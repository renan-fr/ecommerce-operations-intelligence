## 6.1 Crescimento e comportamento da operação

Esta seção avalia se a operação cresce de forma consistente e se esse crescimento ocorre com manutenção da qualidade operacional.

As consultas utilizadas nesta análise estão salvas em:

```text
sql/analyses/01_crescimento_operacao.sql
```

### Perguntas analisadas

- Como o volume de pedidos evolui ao longo dos meses?
- Existem meses com pico ou queda relevante de vendas?
- O crescimento do volume de pedidos acompanha o crescimento do valor transacionado?
- O ticket médio varia ao longo do tempo?
- A operação cresce de forma saudável ou com aumento de problemas operacionais?

### Indicadores utilizados

- quantidade de pedidos por mês;
- faturamento mensal;
- ticket médio mensal;
- variação percentual mensal de pedidos;
- variação percentual mensal de faturamento;
- variação percentual mensal do ticket médio;
- percentual de pedidos entregues com atraso;
- tempo médio de entrega;
- dias médios de atraso.

### Análise

A operação apresenta tendência geral de crescimento ao longo da maior parte do período analisado, especialmente entre 2017 e o início de 2018. Apesar de existirem meses de retração, o comportamento predominante é de expansão em volume de pedidos e faturamento.

Novembro de 2017 se destaca como um dos principais picos da série, com forte aumento de pedidos e faturamento em relação ao mês anterior. Em seguida, dezembro de 2017 apresenta retração, sugerindo possível efeito pós-sazonalidade ou antecipação de demanda.

De forma geral, o faturamento acompanha o movimento da quantidade de pedidos: quando o volume cresce, o faturamento tende a crescer; quando o volume recua, o faturamento também costuma cair. Porém, as variações percentuais não são equivalentes, indicando influência do ticket médio e do mix de produtos vendidos.

O ticket médio varia ao longo do tempo, mas se mantém relativamente estável na maior parte dos meses analisados. Isso sugere que boa parte do crescimento observado é explicada mais pelo aumento no volume de pedidos do que por uma elevação contínua no valor médio por pedido.

Ao cruzar crescimento comercial com indicadores operacionais, surgem sinais de pressão na entrega. Novembro de 2017 combina forte crescimento com aumento relevante no percentual de atrasos. Fevereiro e março de 2018 também apresentam percentuais elevados de atraso, chegando a 16,00% e 21,36%, respectivamente.

Por outro lado, meses posteriores apresentam redução no tempo médio de entrega, chegando a 7,66 dias em agosto de 2018. Isso sugere que a operação teve períodos de pressão logística, mas também sinais posteriores de recuperação ou ganho de eficiência.

### Observações metodológicas

A análise operacional considera apenas pedidos entregues, pois depende da existência da data de entrega ao cliente.

Meses com volume muito baixo no início e no fim da base devem ser interpretados com cautela, pois podem representar períodos incompletos e distorcer as variações percentuais.

A leitura de crescimento deve considerar simultaneamente volume, faturamento, ticket médio e indicadores operacionais. Crescer em pedidos e faturamento não significa, necessariamente, crescer com qualidade.

### Conclusão parcial

A operação apresenta crescimento em volume e faturamento no período analisado, mas esse crescimento não ocorre sempre de forma plenamente saudável.

O faturamento acompanha o crescimento dos pedidos, porém em proporções diferentes, indicando influência do ticket médio e da composição das vendas.

Do ponto de vista operacional, há meses em que o crescimento vem acompanhado de maior percentual de atrasos, principalmente novembro de 2017, fevereiro de 2018 e março de 2018. Portanto, a expansão comercial precisa ser analisada junto com entrega, satisfação, categorias e vendedores para identificar onde o crescimento pressiona a operação.