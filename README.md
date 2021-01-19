# poc-auth-wildlfy-docker
Repositório para criação da imagem Docker do Wildfly para POC de autenticação de usuários do TCC de Arquitetura de SW

Para rodar baixe o projeto, instale o Docker e execute as seguintes linhas no diretório onde o projeto foi baixado:

> docker build --tag=wildfly-poc-auth .

> docker run -p 8080:8080 --name wildfly21 --link keycloak12 -it wildfly-poc-auth

