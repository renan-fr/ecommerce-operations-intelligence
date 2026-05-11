# Briefing Analítico

## 1. Contexto do Projeto

A empresa deseja entender como fatores operacionais do e-commerce impactam volume de pedidos, valor transacionado, prazo de entrega, custo de frete e satisfação dos clientes.

A análise será feita com base na base pública da Olist, simulando um cenário empresarial em que a diretoria busca identificar gargalos operacionais e oportunidades de melhoria na experiência do cliente.

A base disponível contém informações sobre pedidos, itens vendidos, pagamentos, avaliações, produtos, vendedores, clientes e localização aproximada por prefixo de CEP.

---

## 2. Problema de Negócio

A operação de e-commerce envolve múltiplos fatores que podem afetar a experiência do cliente, como prazo de entrega, valor do frete, categoria do produto, localização, desempenho dos vendedores e status dos pedidos.

O principal problema é entender quais desses fatores estão mais associados a atrasos, avaliações ruins e concentração de problemas operacionais.

A base não possui informações de margem, estoque, custo operacional interno, motivo detalhado de cancelamento ou comportamento de navegação do cliente. Por isso, a análise será focada em indicadores observáveis nos dados transacionais e operacionais disponíveis.

---

## 3. Objetivo da Análise

Construir uma visão analítica da operação de e-commerce para identificar padrões, gargalos e oportunidades de melhoria relacionados a:

- pedidos e valor transacionado;
- prazo de entrega;
- frete;
- satisfação do cliente;
- categorias de produto;
- performance dos vendedores;
- localização dos clientes e vendedores.

O objetivo final é apoiar decisões de priorização operacional, acompanhamento de desempenho e identificação de pontos de atenção para melhoria da experiência do cliente.

---

## 4. Público-Alvo

Esta análise é direcionada para:

- diretoria executiva;
- área de operações;
- área comercial;
- time de experiência do cliente;
- time de logística.

---

## 5. Perguntas de Negócio

### Pedidos e valor transacionado

- Qual é o volume total de pedidos analisados?
- Qual é o valor total transacionado no período?
- Como pedidos e valor transacionado evoluem ao longo do tempo?
- Quais categorias concentram maior valor vendido?
- Quais estados ou cidades concentram maior volume de pedidos?

### Entrega e operação

- Qual percentual de pedidos foi entregue com atraso em relação à data estimada?
- Qual é o tempo médio entre compra, aprovação, envio e entrega?
- Quais estados ou cidades apresentam maior concentração de atrasos?
- Quais categorias apresentam maior risco de atraso?
- O tempo de entrega varia significativamente por região?

### Frete

- Qual é o valor médio de frete por categoria?
- Qual é a participação do frete no valor total do pedido?
- Quais regiões apresentam maior custo médio de frete?
- Existe relação entre frete alto e pior avaliação do cliente?

### Satisfação do cliente

- Qual é a nota média das avaliações?
- Qual percentual de pedidos possui avaliação ruim?
- Pedidos atrasados recebem avaliações piores?
- Quais categorias têm maior concentração de avaliações ruins?
- Quais fatores parecem estar mais associados à insatisfação do cliente?

### Vendedores

- Quais vendedores concentram maior volume de pedidos e valor vendido?
- Quais vendedores possuem maior taxa de atraso?
- Quais vendedores possuem maior concentração de avaliações ruins?
- Existem vendedores com bom volume, mas baixa satisfação?

---

## 6. Indicadores Esperados

- Quantidade de pedidos
- Quantidade de clientes únicos
- Valor total transacionado
- Ticket médio
- Valor médio de frete
- Participação média do frete no pedido
- Nota média de avaliação
- Percentual de avaliações ruins
- Percentual de pedidos entregues com atraso
- Dias médios de atraso
- Tempo médio de entrega
- Pedidos por status
- Valor vendido por categoria
- Atraso por estado
- Avaliação média por categoria
- Performance por vendedor

---

## 7. Regras e Premissas Analíticas

- O valor vendido será calculado principalmente a partir dos itens do pedido (`price`) e poderá considerar frete (`freight_value`) quando a métrica exigir valor total pago pelo cliente.
- A tabela de pagamentos será usada para validar ou analisar formas de pagamento, parcelas e valor pago. Como um pedido pode ter mais de uma linha de pagamento, análises por pedido devem agregar `payment_value` por `order_id`.
- Pedido atrasado será definido como pedido entregue ao cliente após a data estimada de entrega.
- Avaliação ruim será definida como `review_score` menor ou igual a 2, salvo decisão analítica posterior.
- As análises de localização usarão cidade e estado dos clientes e vendedores. A tabela de geolocalização poderá ser usada com cautela, pois há múltiplas coordenadas para alguns prefixos de CEP.
- Categorias de produto poderão ser analisadas em português ou inglês, usando a tabela de tradução como apoio.

---

## 8. Limitações dos Dados

- A base não contém margem, lucro, custo de aquisição, estoque ou custo operacional interno.
- A base não contém motivo detalhado para cancelamentos ou indisponibilidades.
- A base não contém dados de navegação, carrinho abandonado ou comportamento antes da compra.
- A base não contém o texto real do nome e da descrição dos produtos, apenas o tamanho desses textos.
- Nem toda avaliação possui título ou comentário textual.
- A localização por CEP é aproximada e pode exigir tratamento adicional antes de análises geográficas mais detalhadas.

---

## 9. Entregáveis

Ao final do projeto, serão produzidos:

- banco PostgreSQL com dados brutos e camadas analíticas;
- modelagem visual dos dados;
- dashboard no Power BI;
- relatório executivo com principais insights;
- documentação técnica e analítica no GitHub.

---

## 10. Critérios de Sucesso

O projeto será considerado bem-sucedido se conseguir:

- organizar os dados da Olist em uma estrutura analítica confiável;
- responder às principais perguntas de negócio com base nos dados disponíveis;
- identificar fatores associados a atraso e baixa satisfação;
- gerar um dashboard claro e útil para tomada de decisão;
- documentar o processo de forma reprodutível.
