# Ecommerce Application

Este é um exemplo de aplicação de Ecommerce desenvolvida com Ruby on Rails. A aplicação é destinada a fornecer uma plataforma para exibir produtos, realizar autenticação de usuários e gerenciar o carrinho de compras.

Funcionalidades

Autenticação de Usuários: A aplicação utiliza o gem Devise para autenticação, permitindo que os usuários se registrem e façam login com email ou CPF.

Exibição de Produtos: Produtos podem ser visualizados com suas descrições e detalhes.

Carrinho de Compras: Produtos escolhidos pelo usuario sao salvos no carrinho de compra e podem ser gerenciados.

Tecnologias Utilizadas

Ruby on Rails 7.2: Framework principal da aplicação.

Devise: Gem para gestão de autenticação de usuários.

Bootstrap: Framework CSS para layout e design responsivo.

PGAdmin: Banco de dados utilizado no desenvolvimento local.

Requisitos

Para rodar essa aplicação localmente, você precisa dos seguintes pré-requisitos:

Ruby 3.1.4

Rails 7.2.2

Node.js (necessário para o Webpacker)

Yarn (opcionalmente necessário para dependências front-end)

# Instalação

1. Clonando o Repositório

Clone o repositório para o seu diretório local:

bash
git clone https://github.com/caionsouza/caio-ecommerce-app.git

cd caio-ecommerce-app.git

2. Instalando Dependências

Instale as dependências do Ruby e JavaScript:

bash

bundle install

# Instale as dependências do Node.js (Webpacker)

yarn install

3. Configurando o Banco de Dados

Crie e migre o banco de dados:

bash

# Criação do banco de dados

rails db:create

# Migração das tabelas

rails db:migrate

# Populando com dados iniciais (opcional)

rails db:seed

4. Iniciando o Servidor

Inicie o servidor de desenvolvimento:

bash

rails server

A aplicação estará disponível em http://localhost:3000.

Uso

Registro de Usuário: O registro de usuários é realizado utilizando o Devise. O formulário solicita nome, email ou CPF, e senha.

Login: Usuários podem fazer login usando email ou CPF. A autenticação é validada via Devise.

Visualização de Produtos: Produtos são listados na página principal, e um link com detalhes.
