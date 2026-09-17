# 🛡️ Prática: Scan Automático de Segurança (Shift-Left)

> A aplicação simula um serviço web construído em Node.js com a biblioteca Express. A pipeline de integração contínua (GitHub Actions) analisa preventivamente a qualidade do código, as dependências utilizadas e o comportamento da aplicação em tempo de execução antes que qualquer alteração chegue à branch principal.

## 🚀 Sobre o Projeto

A aplicação simula um serviço web construído em Node.js com a biblioteca Express. A pipeline de integração contínua (GitHub Actions) analisa preventivamente a qualidade do código, as dependências utilizadas e o comportamento da aplicação em tempo de execução antes que qualquer alteração chegue à branch principal.

---

## 🛠️ Ferramentas Utilizadas & Tipos de Análise

| Ferramenta | Tipo de Análise | Foco da Inspeção |
| :--- | :--- | :--- |
| **Semgrep** | **SAST** (Static Application Security Testing) | Análise estática do código-fonte em busca de falhas de segurança e más práticas de programação. |
| **Trivy** | **SCA** (Software Composition Analysis) | Auditoria de dependências (pacotes e bibliotecas) para identificação de CVEs conhecidas. |
| **OWASP ZAP** | **DAST** (Dynamic Application Security Testing) | Varredura dinâmica em tempo de execução inspecionando cabeçalhos HTTP, respostas da aplicação no `localhost:3000` e superfícies expostas. |

---

## 🔄 Funcionamento da Pipeline

1. **Gatilhos (Triggers):** A pipeline é acionada automaticamente nos eventos de `push` e `pull_request` no repositório.
2. **Estágio de Análise:** Três jobs independentes são disparados em paralelo para execução dos scanners (Semgrep, Trivy e OWASP ZAP).
3. **Tratamento de Encontrados (Findings):** Se falhas críticas forem identificadas, a pipeline falha a checagem (*quality gate*) e notifica as vulnerabilidades no relatório do GitHub.

> 📄 **Workflow completo da automação:** [scan-automatico-shift-left.yml](../../.github/workflows/scan-automatico-shift-left.yml)

---

## 📁 Estrutura do Projeto

* `index.js`: Ponto de entrada do serviço Express (simulação de API).
* `package.json`: Gerenciador de dependências e scripts do projeto.
* `.github/workflows/`: Workflows do GitHub Actions para a pipeline de DevSecOps.

---

## 📊 Evidências de Execução

<details>
<summary><b>1. Visão Geral da Pipeline (GitHub Actions)</b></summary>
<br>

Execução automatizada bem-sucedida de todos os *checks* de segurança:

![Visão Geral da Pipeline](./images/01-pipeline-checks.png)
</details>

<details>
<summary><b>2. Análise Estática de Código - SAST (Semgrep)</b></summary>
<br>

Log da varredura estática de código com 0 vulnerabilidades bloqueantes encontradas:

![Evidência SAST Semgrep](./images/02-sast-semgrep.png)
</details>

<details>
<summary><b>3. Checagem de Dependências - SCA (Trivy)</b></summary>
<br>

Log do scanner de composição inspecionando os pacotes do ecossistema Node.js:

![Evidência SCA Trivy](./images/03-sca-trivy.png)
</details>

<details>
<summary><b>4. Análise Dinâmica da Aplicação - DAST (OWASP ZAP)</b></summary>
<br>

Relatório automatizado e registro de issue no GitHub apontando a ausência de cabeçalhos de segurança na aplicação em execução:

![Evidência DAST OWASP ZAP](./images/04-dast-zap-issue.png)
</details>

---

## 💡 Conclusão: DevSecOps & Shift-Left Security

A automação criada demonstra a aplicação prática dos conceitos de **DevSecOps** e **Shift-Left Security**. Em vez de tratar a segurança como uma auditoria tardia no final do ciclo de vida do software, as checagens foram deslocadas para a fase inicial de desenvolvimento (*early stage*). 

Com o uso integrado de **SAST**, **SCA** e **DAST** na esteira de CI/CD, os desenvolvedores recebem feedback imediato sobre vulnerabilidades a cada commit, reduzindo drasticamente os custos de correção e aumentando a resiliência da aplicação.
