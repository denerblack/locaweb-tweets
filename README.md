# Setup

`bundle install`

# Rodar testes

`rspec spec/tweets_spec.rb`

# Rodar web

`bundle exec rackup -p 9292 config.ru`

acessar: `http://localhost:9292`

# Explicações

Para testes foi utilizado rspec para rodar os testes por descrever melhor (no meu ver) o comportamento do sistema (BDD)
Para parte Web fou utilizado o Sinatra, pois é mais fácil executar uma aplicação Restful, já que a mesma é bem simples.
Também foi utilizado jQuey e bootstrap para melhor visualização na parte WEB.
