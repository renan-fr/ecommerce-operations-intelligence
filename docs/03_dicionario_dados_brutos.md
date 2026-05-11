# Dicionário de Dados — Base Bruta Olist

Este documento apresenta uma descrição inicial das tabelas originais da base Olist, com o objetivo de facilitar o entendimento dos dados antes da etapa de modelagem, limpeza e carga no PostgreSQL.

## 1. olist_customers_dataset

Tabela responsável por identificar os clientes da base.

Principais informações:
- ID do cliente no pedido;
- ID único do consumidor na base Olist;
- CEP aproximado do cliente;
- cidade do cliente;
- estado do cliente.

Uso esperado no projeto:
Esta tabela será utilizada para análises geográficas dos pedidos, permitindo segmentações por cidade e estado do cliente.

Observação:
O campo `customer_id` identifica o cliente associado a um pedido específico, enquanto `customer_unique_id` permite reconhecer o mesmo consumidor em compras diferentes.

---

## 2. olist_geolocation_dataset

Tabela responsável por mapear informações geográficas a partir dos códigos de CEP.

Principais informações:
- prefixo do CEP;
- latitude;
- longitude;
- cidade;
- estado.

Uso esperado no projeto:
Esta tabela pode ser usada como apoio para análises geográficas mais detalhadas. Porém, sua utilização precisa ser avaliada, pois pode exigir tratamento adicional por conta de múltiplas coordenadas para o mesmo prefixo de CEP.

---

## 3. olist_order_items_dataset

Tabela responsável por registrar os itens vendidos em cada pedido.

Principais informações:
- ID do pedido;
- número sequencial do item dentro do pedido;
- ID do produto;
- ID do vendedor;
- data limite para envio do item;
- preço do produto;
- valor do frete.

Uso esperado no projeto:
Esta será uma das principais tabelas transacionais do projeto, pois permite analisar receita, frete, produtos, categorias e vendedores.

Observação:
A data limite de envio representa o prazo máximo para o vendedor postar ou despachar o item, não a data de entrega ao cliente.

---

## 4. olist_order_payments_dataset

Tabela responsável por registrar os pagamentos associados aos pedidos.

Principais informações:
- ID do pedido;
- sequência do pagamento;
- tipo de pagamento;
- quantidade de parcelas;
- valor pago.

Uso esperado no projeto:
Esta tabela será utilizada para análises de valor pago, formas de pagamento e parcelamento dos pedidos.

Observação:
Um mesmo pedido pode ter mais de uma linha de pagamento. Para calcular o valor total pago por pedido, será necessário agrupar por `order_id` e somar `payment_value`.

---

## 5. olist_order_reviews_dataset

Tabela responsável por registrar as avaliações feitas pelos clientes.

Principais informações:
- ID da avaliação;
- ID do pedido;
- nota da avaliação, em escala de 1 a 5;
- título do comentário;
- texto do comentário;
- data de criação da avaliação;
- data de resposta da avaliação.

Uso esperado no projeto:
Esta tabela será usada para medir satisfação do cliente, identificar pedidos com avaliação ruim e cruzar experiência do cliente com atraso, frete, categoria e vendedor.

Observação:
Nem toda avaliação possui título ou texto de comentário. A nota da avaliação é o campo mais completo para análises quantitativas de satisfação.

---

## 6. olist_orders_dataset

Tabela responsável por registrar os pedidos realizados.

Principais informações:
- ID do pedido;
- ID do cliente;
- status do pedido;
- data da compra;
- data de aprovação do pedido;
- data de envio para a transportadora;
- data de entrega ao cliente;
- data estimada de entrega.

Uso esperado no projeto:
Esta será a tabela central da análise, pois conecta clientes, itens, pagamentos e avaliações. Também será usada para calcular indicadores de entrega, atraso e status dos pedidos.

---

## 7. olist_products_dataset

Tabela responsável por registrar as características dos produtos.

Principais informações:
- ID do produto;
- categoria do produto;
- tamanho do nome do produto;
- tamanho da descrição do produto;
- quantidade de fotos cadastradas;
- peso em gramas;
- comprimento em centímetros;
- altura em centímetros;
- largura em centímetros.

Uso esperado no projeto:
Esta tabela será usada para análises por categoria de produto e para investigar possíveis relações entre características do produto, frete, atraso e avaliação.

Observação:
As colunas `product_name_lenght` e `product_description_lenght` representam o tamanho dos textos cadastrados no site, não os textos em si. O nome das colunas possui erro de grafia na base original (`lenght` em vez de `length`).

---

## 8. olist_sellers_dataset

Tabela responsável por registrar os vendedores da base.

Principais informações:
- ID do vendedor;
- prefixo do CEP do vendedor;
- cidade do vendedor;
- estado do vendedor.

Uso esperado no projeto:
Esta tabela será usada para análises de performance por vendedor, localização do vendedor e concentração de pedidos problemáticos.

---

## 9. product_category_name_translation.csv

Tabela responsável por traduzir os nomes das categorias dos produtos do português para o inglês.

Principais informações:
- nome da categoria em português;
- nome da categoria em inglês.

Uso esperado no projeto:
Esta tabela será usada como apoio para padronizar ou enriquecer os nomes das categorias dos produtos. A decisão sobre usar categorias em português ou inglês será definida na etapa de preparação dos dados.
