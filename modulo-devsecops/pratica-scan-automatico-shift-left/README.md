# Prática: Scan Automático - Aplicação de Shift-Left

Este projeto demonstra a implementação prática de **DevSecOps** e a cultura **Shift Left**, integrando análises automáticas de segurança dentro do ciclo de vida de desenvolvimento por meio do GitHub Actions.

## 🛡️ Conceitos e Ferramentas Aplicadas

1. **Shift Left:** Trazer a segurança para as fases iniciais do desenvolvimento, detectando falhas antes do código chegar em produção.
2. **SAST (Semgrep):** Inspeciona o código-fonte (`index.js`) em busca de más práticas, como credenciais expostas.
3. **SCA (Trivy):** Inspeciona as dependências de terceiros (`package.json`) para identificar vulnerabilidades conhecidas (CVEs).
4. **DAST (OWASP ZAP):** Analisa a aplicação em tempo de execução simulando requisições e ataques no servidor web.

## 🚀 Como Funciona
A cada envio (`push`) para o repositório, o workflow em `.github/workflows/scan-automatico-shift-left.yml` executa as varreduras e gera relatórios detalhados na aba **Actions**.