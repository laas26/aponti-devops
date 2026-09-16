# Atividade Prática: Validação Automática de Serviço Docker em CI/CD

> Demonstrar a automação do ciclo de vida de um contêiner Docker dentro de uma esteira de CI/CD utilizando GitHub Actions, validando a disponibilidade do serviço em tempo de execução (*smoke test*) e garantindo a limpeza do ambiente após a execução.

---

### 1. Origem da Imagem
A imagem foi obtida do registry público oficial **Docker Hub** através do repositório oficial: **[https://hub.docker.com/_/redis](https://hub.docker.com/_/redis)**.

---

### 2. Imagem Escolhida
**`redis:alpine`**
*(Optei pela tag `alpine` por ser uma versão leve, segura e com consumo reduzido de recursos).*

---

### 3. Propósito do Serviço
O **Redis** (Remote Dictionary Server) é um banco de dados NoSQL de chave-valor em memória, amplamente utilizado como camada de cache, gerenciador de sessões e *message broker* devido à sua altíssima velocidade de leitura e escrita.

---

### 4. Nome do Contêiner
Contêiner instanciado: **`redis-service-test`**

---

### 5. Comandos Docker Utilizados
* **`docker pull redis:alpine`**: Faz o download da imagem oficial a partir do Docker Hub.
* **`docker run -d -p 6379:6379 --name redis-service-test redis:alpine`**: Inicia o contêiner em segundo plano (*detached mode*), atribuindo o nome `redis-service-test` e mapeando a porta `6379` do host para a porta `6379` do contêiner.
* **`docker exec redis-service-test redis-cli ping`**: Executa a CLI do Redis dentro do contêiner ativo para disparar o comando de *healthcheck* (`ping`).
* **`docker stop redis-service-test`**: Interrompe a execução do contêiner.
* **`docker rm redis-service-test`**: Remove o contêiner finalizado do ambiente.

> 📄 **Workflow completo da automação:** **[docker-validation.yml](../../.github/workflows/docker-validation.yml)**.

---

### 6. Fluxo de Validação em CI/CD
A validação (*smoke test*) ocorre de forma automatizada na etapa **3** da pipeline:
1. Após iniciar o contêiner, o script aguarda 3 segundos para que o serviço processe a inicialização.
2. É executado o comando `docker exec redis-service-test redis-cli ping` diretamente contra o contêiner em execução.
3. A pipeline lê a resposta de saída do comando:
   - Se o retorno for **`PONG`**, o serviço está funcional e a pipeline prossegue registrando o status de sucesso.
   - Se o retorno for diferente de `PONG` ou o serviço não responder, o script gera uma mensagem de erro e falha a execução (`exit 1`).
4. Ao final (sucesso ou falha), a etapa de *cleanup* é acionada (`if: always()`) para parar e remover o contêiner.

---

### 7. Evidência da Execução

![Evidência da Pipeline com Sucesso](./pipeline-success.png)

---

### 💡 Conclusão
A implementação valida que serviços conteinerizados podem ser testados de forma consistente e isolada em ambientes efêmeros de CI/CD. A automação reduz o risco de falhas em produção ao garantir que a aplicação atenda aos requisitos básicos de execução antes do *deploy*.
