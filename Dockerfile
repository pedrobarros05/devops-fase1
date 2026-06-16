FROM node:18-alpine

WORKDIR /app

# Copiar manifests primeiro para aproveitar cache de layers
COPY app/package*.json ./

RUN npm install --omit=dev

# Copiar código-fonte
COPY app/src ./src

# Usuário não-root para segurança
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 3000

CMD ["node", "src/index.js"]
