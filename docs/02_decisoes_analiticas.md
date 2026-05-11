## Decisão 001 — Analisar os dados em Python/Google Sheets antes da carga no PostgreSQL

Decisão:
Antes de carregar os dados no PostgreSQL, será realizada uma etapa inicial de entendimento dos arquivos CSV utilizando Python e Google Sheets. O Python será usado para diagnósticos técnicos, como tipos de dados, nulos, duplicidades e validações. O Google Sheets será usado como apoio visual para inspeção rápida da estrutura e dos registros.

Motivo:
Como a base possui múltiplas tabelas relacionadas, é necessário entender colunas, tipos de dados, chaves, valores nulos, duplicidades e relacionamentos antes de definir a estrutura final no banco.

Impacto:
Essa decisão reduz o risco de criar tabelas mal modeladas no PostgreSQL e permite construir uma camada analítica mais consistente para o dashboard final.

## Decisão 002 — Criar uma modelagem visual própria da base bruta

Decisão:
Será criada uma modelagem visual própria da base bruta Olist utilizando DBML e dbdiagram.io, em vez de depender apenas do diagrama original disponibilizado no Kaggle.

Motivo:
O diagrama original ajuda no entendimento inicial, mas não apresenta todos os campos, cardinalidades, observações analíticas e decisões específicas do projeto. Criar uma modelagem própria permite documentar melhor os relacionamentos e adaptar a leitura da base ao objetivo da análise.

Impacto:
A modelagem própria facilita o entendimento da estrutura dos dados, apoia a futura criação do modelo analítico no PostgreSQL e melhora a documentação do projeto para o portfólio.

Artefatos gerados:
- `models/raw_olist_model.dbml`: arquivo DBML com a estrutura da modelagem bruta.
- `images/raw_olist_model.png`: imagem exportada do modelo para visualização e documentação.

## Decisão 003 — Utilizar PostgreSQL local com carga automatizada dos dados brutos

Decisão:
O projeto utilizará um banco PostgreSQL local, criado manualmente pelo pgAdmin, com scripts SQL versionados para criação dos schemas e das tabelas brutas. A carga dos arquivos CSV será feita por um script Python configurado por variáveis de ambiente.

Motivo:
Essa abordagem mantém o ambiente simples, direto e replicável, sem adicionar camadas como Docker neste primeiro momento. Os scripts SQL garantem a criação padronizada da estrutura do banco, enquanto o script Python automatiza a carga dos dados e permite repetir o processo em diferentes computadores.

Impacto:
A decisão facilita a validação dos dados brutos, melhora a rastreabilidade do projeto e cria uma base sólida para as próximas etapas de tratamento, modelagem analítica e construção das views para o Power BI.
