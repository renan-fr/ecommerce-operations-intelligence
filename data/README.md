# Dados Brutos

Esta pasta armazena os arquivos originais utilizados no projeto, sem alterações manuais.

Os dados foram extraídos da base pública **Brazilian E-Commerce Public Dataset by Olist**, disponível no Kaggle.

Fonte dos dados:

```text
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
```

## Objetivo

A pasta `data/raw/` representa a camada bruta do projeto. Os arquivos armazenados aqui devem refletir os dados exatamente como foram baixados da fonte original.

Nenhuma limpeza, padronização ou transformação deve ser feita diretamente nesses arquivos.

## Arquivos esperados

- `olist_customers_dataset.csv`
- `olist_geolocation_dataset.csv`
- `olist_orders_dataset.csv`
- `olist_order_items_dataset.csv`
- `olist_order_payments_dataset.csv`
- `olist_order_reviews_dataset.csv`
- `olist_products_dataset.csv`
- `olist_sellers_dataset.csv`
- `product_category_name_translation.csv`

## Uso no projeto

Os arquivos desta pasta são utilizados como entrada para o script de carga:

```text
src/load_raw_data.py
```

Esse script lê os CSVs originais e carrega os dados no schema `raw` do banco PostgreSQL.

## Observações

- Os arquivos desta pasta são dados públicos.
- Futuramente, os CSVs podem ser removidos do versionamento no GitHub para reduzir o tamanho do repositório.
- Caso os arquivos não estejam disponíveis localmente, eles devem ser baixados novamente a partir da fonte original no Kaggle.
- Qualquer transformação deve ser feita por scripts ou consultas SQL, preservando os arquivos brutos intactos.