#!/bin/bash
# deploy.sh — Script de deploy parametrizável por ambiente
# Uso: bash deploy.sh <ambiente> <docker_user> <tag>
# Exemplo: bash deploy.sh staging pedrobarros05 abc1234

set -euo pipefail

ENV=${1:?Informe o ambiente: staging ou prod}
DOCKER_USER=${2:?Informe o usuário Docker Hub}
TAG=${3:-latest}

IMAGE="${DOCKER_USER}/devops-app:${TAG}"
CONTAINER_NAME="devops-app-${ENV}"
PORT=3000

echo "==> Deploy iniciado: ambiente=${ENV}, imagem=${IMAGE}"

# Autenticar e baixar imagem mais recente
docker pull "${IMAGE}"

# Zero-downtime: parar e remover container anterior, subir novo
if docker ps -q --filter "name=${CONTAINER_NAME}" | grep -q .; then
  echo "==> Parando container existente: ${CONTAINER_NAME}"
  docker stop "${CONTAINER_NAME}"
  docker rm "${CONTAINER_NAME}"
fi

echo "==> Subindo novo container: ${CONTAINER_NAME}"
docker run -d \
  --name "${CONTAINER_NAME}" \
  --restart unless-stopped \
  -p "${PORT}:3000" \
  -e NODE_ENV="${ENV}" \
  "${IMAGE}"

echo "==> Deploy concluído: ${CONTAINER_NAME} rodando na porta ${PORT}"
