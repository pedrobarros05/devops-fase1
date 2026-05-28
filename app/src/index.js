const http = require('http');

const PORT = process.env.PORT || 3000;

function createApp() {
  return http.createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({
      status: 'ok',
      message: 'DevOps Fase 1 — App rodando com sucesso!',
      timestamp: new Date().toISOString(),
    }));
  });
}

function greet(name) {
  return `Olá, ${name}!`;
}

if (require.main === module) {
  const server = createApp();
  server.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
  });
}

module.exports = { createApp, greet };
