# Problema da listagem de Tweets

Você deve assumir o seguinte problema hipotético:

```
A Locaweb está planejando uma maneira de prover suporte e iniciar protocolos
para quem reclamar de seus produtos via Twitter. A idéia é listar os tweets
mais relevantes e os usuários que mais mencionam a Locaweb.
```

## Regras

Para um tweet ser elegível para a lista, ele deve estar em uma dessas categorias:

* tweets que mencionem o usuário da Locaweb
* tweets não são replies para tweets da Locaweb

Os tweets que não fazem parte dessas categorias **não** podem estar na lista.

Considerando os padrões de urgência para o problema, os tweets devem
ser ordenados de acordo com as seguintes prioridades:

1. Usuários com mais seguidores
2. Tweets que tenham mais retweets (considerar apenas o RT oficial do Twitter)
3. Tweet com mais likes

Os resultados ordenados devem conter as seguintes informações:

* screen_name (@usuario) que fez o tweet (com link para o perfil)
* Número de seguidores do autor, número de retweets e likes do tweet
* Conteúdo do tweet
* Data e hora com link para o tweet

Seu sistema deve prover dois recursos:

1. Mostra os tweets mais relevantes
2. Mostra os usuários que mais mencionaram a locaweb

Para a lista dos usuários que mais mencionarem o usuário da Locaweb,
os tweets devem ser agregados por usuário, aplicando os mesmos
critérios de ordenação dos mais relevantes.

## Implementação

Para simplificar a autenticação do Twitter e evitar limites, você **deve**
usar as respostas mockadas da API de busca do Twitter nesta URL:

http://tweeps.locaweb.com.br/tweeps

Essa API segue o mesmo formato descrito na documentação do Twitter em:
https://dev.twitter.com/docs/api/1.1/get/search/tweets

Para autenticar, envie um header HTTP chamado “Username” com o seu e-mail.

Considere apenas os tweets retornados na primeira página do web
service, ou seja, não é necessário varrer os links das próximas
páginas. Para efeito de testes, considere que o usuário da Locaweb no
Twitter tem o ID 42.

Seu sistema deve expor os recursos **em formato JSON**, nas seguintes
URIs:

/most_relevants
    Mostra os tweets mais relevantes
    
/most_mentions
    Mostra os usuários que mais mencionaram a locaweb

Lembre-se que escrever testes automatizados é indispensável.

## Entrega do projeto

O projeto deve ser entregue em um único arquivo compactado (zip,
tar.gz, etc), contendo seu código e versionamento (diretório .git). É
imprescindível que seu repositório tenha instruções sobre como o
projeto deve ser executado, incluindo versões e bibliotecas.

Você pode usar a linguagem que estiver mais confortável. Na Locaweb
usamos bastante Ruby e um pouco de muitas coisas, como: Go, Python,
Elixir e Java.

### Opcionais (mas dá pontos extras)

+ Vir com um Dockerfile para que sua aplicação possa ser executada com
  apenas um comando
+ Escrever porque você decidiu utilizar tais ferramentas para resolver
  esse problema
+ Escrever o código que resolve o problema utilizando apenas a
  biblioteca padrão da linguagem, sem adicionar libs externas (não tem
  problema usar lib para os testes)
+ Construir uma interface que leia o JSON e mostre uma versão
  apresentável para o usuário final
# locaweb-tweets
