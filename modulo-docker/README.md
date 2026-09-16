# Módulo Docker

Este módulo contém as implementações práticas, automações e documentações referentes ao aprendizado de **Docker Engine, Containerização e Integração CI/CD**.

---

## 🎯 Objetivos Gerais do Módulo

- Domínio dos comandos nativos da CLI do Docker (`pull`, `run`, `exec`, `stop`, `rm`).
- Automação do ciclo de vida de contêineres em ambientes de CI/CD.
- Gerenciamento de persistência de dados via **Volumes** e comunicação via **Redes**.
- Criação e otimização de imagens personalizadas com **Dockerfiles**.

---

## 🛠️ Tecnologias e Ferramentas

- **Docker Engine / CLI**
- **Docker Hub** (Registry Oficial)
- **GitHub Actions** (`.github/workflows/`)
- **Bash / Shell Script**

---

## 📚 Índice de Atividades Práticas

| Item | Atividade | Descrição / Tecnologia | Status |
| :---: | :--- | :--- | :---: |
| **01** | **[Validação Automática de Serviço em CI/CD](./atividade-01-pipeline/README.md)** | Automação do ciclo completo (*pull*, *run*, *smoke test/ping* e *cleanup*) usando **Redis** no GitHub Actions. | ✅ Concluído |

<!-- Novas atividades práticas serão adicionadas neste índice conforme o avanço do curso -->

---

## 📂 Estrutura da Pasta do Módulo

```text
modulo-docker/
├── README.md                          # Este arquivo (Índice Geral)
└── atividade-01-pipeline/             # Atividade 01: Pipeline com Redis
    ├── README.md                      # Respostas e documentação da entrega
    └── pipeline-success.png           # Evidência da execução no GitHub Actions
```

---