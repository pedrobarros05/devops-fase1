# DevOps na Prática — Fase 1: Configuração e Automação Inicial

Projeto da disciplina **DevOps na Prática** — PUC RS Online.

## Visão Geral

Aplicação web simples com pipeline de DevOps automatizado, cobrindo:
- **CI** via GitHub Actions
- **IaC** via Terraform (AWS)

## Estrutura do Repositório

```
devops-fase1/
├── .github/
│   └── workflows/
│       └── ci.yml          # Pipeline de Integração Contínua
├── app/
│   ├── src/
│   │   └── index.js        # Aplicação Node.js
│   ├── tests/
│   │   └── index.test.js   # Testes automatizados
│   └── package.json
├── terraform/
│   ├── main.tf             # Recursos AWS principais
│   ├── variables.tf        # Variáveis de configuração
│   └── outputs.tf          # Outputs exportados
├── .gitignore
└── README.md
```

## Branches

| Branch | Descrição |
|--------|-----------|
| `main` | Branch principal protegida — requer PR aprovado |
| `develop` | Branch de integração de features |
| `feature/*` | Branches de funcionalidades individuais |

## Pipeline CI

O pipeline roda automaticamente a cada push ou PR para `main`/`develop`:

1. Checkout do código
2. Setup Node.js 18
3. Instalação de dependências (`npm install`)
4. Lint (`npm run lint`)
5. Testes (`npm test`)
6. Build (`npm run build`)

## Infraestrutura (Terraform)

Infraestrutura provisionada na AWS (região `us-east-1`):

| Recurso | Tipo | Descrição |
|---------|------|-----------|
| EC2 | `t2.micro` | Servidor da aplicação |
| S3 Bucket | — | Armazenamento de artefatos |
| VPC | — | Rede virtual isolada |
| Security Group | — | Firewall (HTTP 80, HTTPS 443, SSH 22) |
| IAM Role | — | Permissões com menor privilégio |

### Comandos Terraform

```bash
cd terraform/
terraform init      # Inicializa o backend e providers
terraform plan      # Visualiza as mudanças antes de aplicar
terraform apply     # Provisiona a infraestrutura
terraform destroy   # Remove todos os recursos criados
```

## Setup Local

```bash
# Instalar dependências
cd app
npm install

# Rodar testes
npm test

# Rodar lint
npm run lint
```

## Aluno

Pedro Barros — PUC RS Online
