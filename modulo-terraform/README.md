# Módulo Terraform

Este módulo contém as implementações práticas, automações e documentações referentes ao aprendizado de **Terraform, Packer, Ansible, Infraestrutura como Código (IaC), Infraestrutura Imutável e Provisionamento de Ambientes na AWS**.

---

## 🎯 Objetivos Gerais do Módulo

- Domínio dos conceitos fundamentais de **Infraestrutura como Código (IaC)** com **Terraform**.
- Provisionamento de recursos em nuvem (ex.: instância **EC2** na AWS).
- Uso de **Cloud-Init** para customização automática de instâncias (hostname, pacotes, serviços).
- Construção de imagens imutáveis com **Packer** e configuração com **Ansible**, de forma local e automatizada.
- Integração entre Terraform e **GitHub Actions** para validação e planejamento de infraestrutura.

---

## 🛠️ Tecnologias e Ferramentas

- **Terraform**
- **AWS (EC2 / VPC)**
- **Cloud-Init**
- **HashiCorp Packer**
- **Ansible**
- **Docker** (construção e execução local de imagens)
- **GitHub Actions** (`.github/workflows/`)

---

## 📚 Índice de Atividades Práticas

| Item | Atividade | Descrição / Tecnologia | Status |
| :---: | --- | --- | ---: |
| **01** | **[Provisionamento de VM DevOps Lab](./pratica-terraform-vm/README.md)** | Provisionamento de instância **EC2** Ubuntu com **Docker** e **Nginx** via **Cloud-Init**. | ✅ Concluído |
| **02** | **[Infraestrutura Imutável com Packer e Ansible](./pratica-packer-ansible/README.md)** | Construção automatizada de imagem Docker a partir do **Ubuntu**, com **Apache** configurado via **Ansible** e página HTML personalizada, sem serviços de nuvem. | ✅ Concluído |

<!-- Novas atividades práticas serão adicionadas neste índice conforme o avanço do curso -->
