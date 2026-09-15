# Módulo: DevSecOps

Este diretório reúne as práticas, automações e projetos desenvolvidos ao longo do módulo de **DevSecOps**. O objetivo principal é aplicar o conceito de **Shift-Left Security**, integrando verificações de segurança automatizadas desde as primeiras etapas do desenvolvimento.

---

## 📁 Estrutura de Práticas

| Prática / Projeto | Descrição | Status |
| :--- | :--- | :---: |
| **`pratica-scan-automatico-shift-left/`** | Aplicação Node.js com pipeline CI/CD integrada a scanners de segurança via GitHub Actions. | 🟢 Concluído |

---

## 🛡️ Principais Conceitos Aplicados

- **Shift-Left Security:** Identificação de falhas e vulnerabilidades antes da integração na branch principal (`main`).
- **Segurança em Pull Requests:** Validação obrigatória de qualidade e segurança durante o processo de code review.
- **Automação CI/CD:** Execução automatizada de testes e análises de código a cada novo push ou Pull Request.