# Módulo Terraform - VM DevOps Lab

Esta atividade implementa a infraestrutura como código (IaC) para a criação de uma máquina virtual Linux (Ubuntu) no AWS, destinada ao laboratório DevOps.

## 🎯 Finalidade

Provisionar uma instância EC2 com:

- **Hostname:** `vm-devops-lab`
- **Cloud-Init:** atualização de pacotes, instalação do Docker e Nginx
- **Docker e Nginx:** habilitados e iniciados via `systemctl`

O IP público gerado é exibido no output `public_ip`.

## 📁 Estrutura

```text
modulo-terraform/
└── pratica-terraform-vm/   # Atividade de provisionamento da VM
    ├── user-data.yaml   # Cloud-Init para hostname, pacotes, Docker e Nginx
    ├── main.tf          # Configuração do Terraform (provedor AWS e recurso EC2)
    ├── variables.tf     # Variáveis (região, tipo de instância e AMI)
    ├── outputs.tf       # Output com o IP público da VM
    └── README.md        # Documentação da atividade
```

## 🚀 Como executar localmente

Pré-requisitos: [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.5.0 e credenciais AWS configuradas.

```bash
# 1. Entra no diretório da atividade
cd modulo-terraform/pratica-terraform-vm

# 2. Inicializa o backend/provedor
terraform init

# 2. Faz o plano da infraestrutura (após configurar as variáveis/secrets)
terraform plan

# 3. Aplica a infraestrutura
terraform apply -auto-approve

# 4. (Opcional) Limpa os recursos criados
terraform destroy
```

### 📌 Variáveis

| Variável        | Descrição                          | Padrão             |
| --------------- | ---------------------------------- | ------------------ |
| `aws_region`   | Região AWS                         | `us-east-1`        |
| `instance_type`| Tipo da instância EC2              | `t2.micro`         |
| `ami_id`       | AMI ID da imagem Ubuntu           | `ami-0c7217cdde317cfec` |

### 🔑 Credenciais

As credenciais AWS devem estar configuradas localmente (via `aws configure` ou variáveis de ambiente):

```bash
export AWS_ACCESS_KEY_ID=<SUA_CHAVE>
export AWS_SECRET_ACCESS_KEY=<SEU_SEGREDO>
```

## 🤖 CI/CD

O workflow em `.github/workflows/terraform-ci-cd.yml` executa automaticamente `fmt`, `validate` e `plan` no diretório `modulo-terraform/pratica-terraform-vm` sempre que há alterações nessa pasta.
