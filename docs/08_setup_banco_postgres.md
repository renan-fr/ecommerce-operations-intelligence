# Setup do Banco PostgreSQL

Este documento descreve como configurar o banco PostgreSQL local utilizado no projeto **E-commerce Operations Intelligence**.

## 1. Objetivo

O PostgreSQL será utilizado como camada de armazenamento e análise dos dados da base Olist.

Nesta etapa, o banco será usado para:

- armazenar os dados brutos dos arquivos CSV;
- organizar os dados em schemas;
- permitir consultas SQL de validação;
- preparar a criação futura das camadas analíticas e das views para o Power BI.

---

## 2. Criação do banco

O banco deve ser criado manualmente pelo pgAdmin.

Nome do banco:

```text
ecommerce_operations
```

Passo a passo no pgAdmin:

1. Abrir o pgAdmin.
2. Acessar ou registrar o servidor PostgreSQL local.
3. Clicar com o botão direito em `Databases`.
4. Selecionar `Create > Database`.
5. Informar o nome `ecommerce_operations`.
6. Selecionar o usuário local como owner.
7. Salvar.

Observação:

O usuário do PostgreSQL pode variar de acordo com a instalação local. Em uma máquina pode ser `postgres`, em outra pode ser o próprio usuário do sistema.

---

## 3. Criação dos schemas

Após criar o banco, executar o script:

```text
sql/01_create_schema.sql
```

Esse script cria três schemas principais:

- `raw`: armazena os dados brutos carregados dos arquivos CSV;
- `analytics`: armazenará dados tratados, padronizados e enriquecidos;
- `mart`: armazenará views e tabelas finais para consumo no Power BI.

Conteúdo esperado do script:

```sql
CREATE SCHEMA IF NOT EXISTS raw;
CREATE SCHEMA IF NOT EXISTS analytics;
CREATE SCHEMA IF NOT EXISTS mart;
```

---

## 4. Criação das tabelas brutas

Depois da criação dos schemas, executar o script:

```text
sql/02_create_raw_tables.sql
```

Esse script cria as 9 tabelas originais da base Olist dentro do schema `raw`:

- `raw.olist_customers`
- `raw.olist_geolocation`
- `raw.olist_orders`
- `raw.olist_order_items`
- `raw.olist_order_payments`
- `raw.olist_order_reviews`
- `raw.olist_products`
- `raw.olist_sellers`
- `raw.product_category_name_translation`

Nesta camada, as tabelas representam os dados brutos da base, sem aplicação de regras analíticas finais.

---

## 5. Configuração das variáveis de ambiente

O projeto utiliza variáveis de ambiente para conectar o Python ao PostgreSQL.

Na raiz do projeto, deve existir um arquivo:

```text
.env.example
```

Esse arquivo serve como modelo e pode ser versionado no GitHub.

Exemplo:

```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=ecommerce_operations
DB_USER=seu_usuario_postgres
DB_PASSWORD=sua_senha_postgres
DB_SCHEMA_RAW=raw
```

Cada máquina deve criar seu próprio arquivo `.env` com as credenciais reais do PostgreSQL local.

Exemplo:

```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=ecommerce_operations
DB_USER=usuario_local
DB_PASSWORD=senha_local
DB_SCHEMA_RAW=raw
```

O arquivo `.env` não deve ser versionado.

Garanta que o `.gitignore` contenha:

```gitignore
.env
```

---

## 6. Carga dos dados brutos

Com o banco, schemas e tabelas criados, a carga dos CSVs é feita pelo script:

```text
src/load_raw_data.py
```

Antes de executar, os arquivos CSV devem estar em:

```text
data/raw/
```

Arquivos esperados:

- `olist_customers_dataset.csv`
- `olist_geolocation_dataset.csv`
- `olist_orders_dataset.csv`
- `olist_order_items_dataset.csv`
- `olist_order_payments_dataset.csv`
- `olist_order_reviews_dataset.csv`
- `olist_products_dataset.csv`
- `olist_sellers_dataset.csv`
- `product_category_name_translation.csv`

Para executar a carga:

```bash
python src/load_raw_data.py
```

O script realiza as seguintes ações:

- lê as configurações do arquivo `.env`;
- conecta ao banco PostgreSQL local;
- limpa as tabelas do schema `raw`;
- lê os arquivos CSV da pasta `data/raw/`;
- carrega os dados nas tabelas correspondentes;
- exibe logs da execução no terminal.

---

## 7. Validação da carga

Após executar o script de carga, a validação pode ser feita diretamente pelo pgAdmin ou por consultas exploratórias no notebook.

Consulta simples para validar a quantidade de registros por tabela:

```sql
SELECT 'olist_customers' AS tabela, COUNT(*) AS total FROM raw.olist_customers
UNION ALL
SELECT 'olist_geolocation', COUNT(*) FROM raw.olist_geolocation
UNION ALL
SELECT 'olist_orders', COUNT(*) FROM raw.olist_orders
UNION ALL
SELECT 'olist_order_items', COUNT(*) FROM raw.olist_order_items
UNION ALL
SELECT 'olist_order_payments', COUNT(*) FROM raw.olist_order_payments
UNION ALL
SELECT 'olist_order_reviews', COUNT(*) FROM raw.olist_order_reviews
UNION ALL
SELECT 'olist_products', COUNT(*) FROM raw.olist_products
UNION ALL
SELECT 'olist_sellers', COUNT(*) FROM raw.olist_sellers
UNION ALL
SELECT 'product_category_name_translation', COUNT(*) FROM raw.product_category_name_translation
ORDER BY tabela;
```

Também é recomendado validar amostras das tabelas principais:

```sql
SELECT * FROM raw.olist_orders LIMIT 10;
SELECT * FROM raw.olist_order_items LIMIT 10;
SELECT * FROM raw.olist_order_reviews LIMIT 10;
SELECT * FROM raw.olist_products LIMIT 10;
```

Essas consultas não precisam necessariamente ficar salvas como script SQL nesta etapa. Elas servem apenas para conferência inicial da carga.

---

## 8. Replicação em outro computador

Para replicar o ambiente em outra máquina:

1. Clonar o repositório.
2. Criar o banco `ecommerce_operations` no PostgreSQL local.
3. Executar `sql/01_create_schema.sql`.
4. Executar `sql/02_create_raw_tables.sql`.
5. Criar o arquivo `.env` local com base no `.env.example`.
6. Garantir que os CSVs estejam em `data/raw/`.
7. Executar `python src/load_raw_data.py`.
8. Conferir a carga no pgAdmin.

As credenciais de conexão podem mudar entre máquinas. O importante é manter o mesmo nome do banco, os mesmos schemas, as mesmas tabelas e a mesma estrutura do projeto.
