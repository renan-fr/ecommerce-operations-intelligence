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

## 6. Perguntas Analíticas e Indicadores de Apoio

A análise não será baseada apenas em valores absolutos dos indicadores. Os KPIs serão utilizados como ponto de partida para investigar evolução temporal, comportamento por categoria, desempenho por região, impacto operacional e relação com a satisfação do cliente.

### 6.1 Crescimento e comportamento da operação

Perguntas de negócio:
- Como o volume de pedidos evolui ao longo dos meses?
- Existem meses com pico ou queda relevante de vendas?
- O crescimento do volume de pedidos acompanha o crescimento do valor transacionado?
- O ticket médio varia ao longo do tempo?
- A operação cresce de forma saudável ou com aumento de problemas operacionais?

Indicadores de apoio:
- Quantidade de pedidos
- Quantidade de clientes únicos
- Valor total transacionado
- Ticket médio
- Pedidos por mês
- Receita por mês

---

### 6.2 Receita, categorias e mix de produtos

Perguntas de negócio:
- Quais categorias mais contribuem para o valor vendido?
- As categorias com maior receita também possuem boa avaliação?
- Existem categorias que vendem muito, mas geram mais atraso ou insatisfação?
- O mix de produtos muda ao longo do tempo?
- Quais categorias deveriam receber maior atenção operacional?

Indicadores de apoio:
- Valor vendido por categoria
- Quantidade de pedidos por categoria
- Ticket médio por categoria
- Avaliação média por categoria
- Percentual de atraso por categoria

---

### 6.3 Frete e impacto na experiência

Perguntas de negócio:
- O valor médio do frete varia por categoria, região ou período?
- O frete representa quanto do valor total do pedido?
- Pedidos com maior participação do frete recebem avaliações piores?
- Existem categorias ou regiões onde o frete pode estar prejudicando a competitividade?
- O custo de frete está associado a maior atraso ou menor satisfação?

Indicadores de apoio:
- Valor médio de frete
- Participação média do frete no pedido
- Frete médio por estado
- Frete médio por categoria
- Nota média por faixa de frete

---

### 6.4 Entrega e eficiência operacional

Perguntas de negócio:
- Qual percentual de pedidos é entregue com atraso?
- O atraso piora em determinados meses?
- Quais estados concentram maior percentual de atraso?
- Quais categorias apresentam maior risco logístico?
- O tempo médio de entrega está melhorando ou piorando ao longo do tempo?
- Existem períodos de maior volume em que a entrega perde eficiência?

Indicadores de apoio:
- Percentual de pedidos entregues com atraso
- Dias médios de atraso
- Tempo médio de entrega
- Atraso por estado
- Atraso por categoria
- Tempo médio de entrega por mês

---

### 6.5 Satisfação do cliente

Perguntas de negócio:
- Qual é a nota média dos pedidos?
- A satisfação muda ao longo dos meses?
- Pedidos atrasados recebem notas menores?
- Quais categorias geram mais avaliações ruins?
- Quais fatores parecem mais associados à insatisfação: atraso, frete, categoria, região ou vendedor?
- A empresa está vendendo mais às custas de uma pior experiência?

Indicadores de apoio:
- Nota média de avaliação
- Percentual de avaliações ruins
- Avaliação média por categoria
- Avaliação média por estado
- Avaliação média por status de atraso
- Avaliação média por faixa de frete

---

### 6.6 Performance dos vendedores

Perguntas de negócio:
- Quais vendedores concentram maior volume de pedidos?
- Quais vendedores geram maior valor vendido?
- Quais vendedores possuem maior taxa de atraso?
- Quais vendedores possuem pior avaliação média?
- Existem vendedores com alto volume, mas baixa qualidade operacional?
- Quais vendedores deveriam ser priorizados para acompanhamento?

Indicadores de apoio:
- Pedidos por vendedor
- Valor vendido por vendedor
- Ticket médio por vendedor
- Percentual de atraso por vendedor
- Nota média por vendedor
- Percentual de avaliações ruins por vendedor

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
