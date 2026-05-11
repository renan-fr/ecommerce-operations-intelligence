-- ============================================================
-- ANÁLISE 6.1 — CRESCIMENTO E COMPORTAMENTO DA OPERAÇÃO
-- ============================================================

-- Perguntas respondidas:
-- 1. Como o volume de pedidos evolui ao longo dos meses?
-- 2. Existem meses com pico ou queda relevante de vendas?
-- 3. O crescimento do volume de pedidos acompanha o crescimento do valor transacionado?
-- 4. O ticket médio varia ao longo do tempo?
-- 5. A operação cresce de forma saudável ou com aumento de problemas operacionais?

-- ============================================================
-- CONSULTA 1 — CRESCIMENTO COMERCIAL MENSAL
-- ============================================================

WITH base AS (
SELECT DATE_TRUNC('month', order_purchase_timestamp)::date AS mes_venda,
COUNT(DISTINCT ord.order_id) AS qtd_pedidos,
SUM(payment_value) AS faturamento,
ROUND((SUM(payment_value)/COUNT(DISTINCT ord.order_id)),2) AS ticket_medio

FROM raw.olist_orders AS ord
JOIN raw.olist_order_payments AS pay
	ON ord.order_id = pay.order_id
GROUP BY mes_venda
),

mes_anterior AS(
SELECT *,
LAG(qtd_pedidos) OVER (ORDER BY mes_venda) AS qtd_anterior,
LAG(faturamento) OVER (ORDER BY mes_venda) AS faturamento_anterior,
LAG(ticket_medio) OVER (ORDER BY mes_venda) AS ticket_anterior
FROM base
),

calculo_percentual AS (
    SELECT 
        mes_venda, 
        qtd_pedidos,
        ROUND(
            ((qtd_pedidos - qtd_anterior)::numeric / NULLIF(qtd_anterior, 0)) * 100,
            2
        ) AS percentual_pedidos,
        faturamento,
        ROUND(
            ((faturamento - faturamento_anterior)::numeric / NULLIF(faturamento_anterior, 0)) * 100,
            2
        ) AS percentual_faturamento,
		ticket_medio,
        ROUND(
            ((ticket_medio - ticket_anterior)::numeric / NULLIF(ticket_anterior, 0)) * 100,
            2
        ) AS percentual_ticket
    FROM mes_anterior
)

SELECT * 
FROM calculo_percentual
ORDER BY mes_venda

-- ============================================================
-- CONSULTA 2 — SAÚDE OPERACIONAL MENSAL
-- ============================================================

WITH operacao_mensal AS (
    SELECT
        DATE_TRUNC('month', order_purchase_timestamp)::date AS mes_venda,

        COUNT(DISTINCT order_id) AS total_pedidos,

        COUNT(DISTINCT CASE 
            WHEN order_delivered_customer_date > order_estimated_delivery_date
            THEN order_id 
        END) AS pedidos_atrasados,

        AVG(order_delivered_customer_date::date - order_purchase_timestamp::date) AS tempo_medio_entrega,

        AVG(CASE 
            WHEN order_delivered_customer_date > order_estimated_delivery_date
            THEN order_delivered_customer_date::date - order_estimated_delivery_date::date
        END) AS dias_medios_atraso

    FROM raw.olist_orders
    WHERE order_delivered_customer_date IS NOT NULL
    GROUP BY DATE_TRUNC('month', order_purchase_timestamp)::date
),

indicadores_operacao AS (
    SELECT
        mes_venda,
        total_pedidos,
        pedidos_atrasados,
        ROUND(
            pedidos_atrasados::numeric / NULLIF(total_pedidos, 0) * 100,
            2
        ) AS percentual_atraso,
        ROUND(tempo_medio_entrega, 2) AS tempo_medio_entrega,
        ROUND(dias_medios_atraso, 2) AS dias_medios_atraso
    FROM operacao_mensal
)

SELECT *
FROM indicadores_operacao
ORDER BY mes_venda;