# fiap-soat-fastfood-database

Projeto desenvolvido para o curso de [pós-graduação em Arquitetura de Software (Soat Póstech) da FIAP](https://postech.fiap.com.br/curso/software-architecture/).

Este repositório contém a infraestrutura como código (IaC) para o provisionamento e gerenciamento de ambientes de banco de dados MongoDB Atlas utilizando Terraform. O projeto contempla ambientes de desenvolvimento (`development`) e produção (`production`), garantindo consistência, segurança e escalabilidade para aplicações que utilizam MongoDB como base de dados.

## 🏃 Integrantes do grupo

- Jeferson dos Santos Gomes - **RM 362669**
- Jamison dos Santos Gomes - **RM 362671**
- Alison da Silva Cruz - **RM 362628**

## 📄 Contexto

**MongoDB Atlas** é uma plataforma de banco de dados como serviço (DBaaS) totalmente gerenciada para o MongoDB, hospedada na nuvem. Ela simplifica o gerenciamento, a escalabilidade e a segurança de clusters MongoDB, permitindo que equipes foquem no desenvolvimento de aplicações sem se preocupar com a administração da infraestrutura do banco de dados.

Este repositório automatiza a criação de projetos, clusters, usuários, regras de acesso por IP e inicialização de dados no MongoDB Atlas, utilizando o Terraform como ferramenta de orquestração.

## 🗂️ Estrutura dos Diretórios

- **development/**  
  Infraestrutura para o ambiente de desenvolvimento, permitindo testes e validações antes da promoção para produção.
- **production/**  
  Infraestrutura para o ambiente de produção, executada via pipeline com [github actions](https://github.com/features/actions?locale=pt-BR).

Cada ambiente possui dois subdiretórios principais:
- `database/`: Provisionamento do projeto, cluster, usuários, regras de IP e execução de scripts de inicialização no MongoDB Atlas.
- `k8s_access/`: Gerenciamento de regras de acesso por IP para integração com clusters Kubernetes.

## 📈 Módulos

Os módulos reutilizáveis estão localizados em `modules/` e são utilizados tanto em desenvolvimento quanto em produção:

- **cluster/**  
  Cria o projeto e o cluster MongoDB Atlas, configurando nome, organização, região e tags.
- **users/**  
  Gerencia a criação de usuários de banco de dados, atribuindo roles e permissões específicas.
- **ip_access/**  
  Controla a lista de IPs permitidos a acessar o cluster, aumentando a segurança do ambiente.
- **executor/**  
  Executa comandos locais, como a inicialização do banco de dados com scripts customizados (ex: inserção de dados iniciais).
  
## 📜 Scripts

- **scripts/init-db.js**  
  Script de inicialização que popula o banco de dados com índices e dados de menu, utilizado após o provisionamento do cluster.

## ⚙️ Provisionamento

O provisionamento é realizado via [Terraform](https://www.terraform.io/), utilizando o provider oficial do MongoDB Atlas. O pipeline de CI/CD (GitHub Actions) automatiza a aplicação das mudanças de infraestrutura, garantindo rastreabilidade e controle de versões.

---