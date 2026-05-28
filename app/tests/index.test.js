const http = require('http');
const { createApp, greet } = require('../src/index');

describe('Aplicação Web', () => {
  let server;

  beforeAll((done) => {
    server = createApp();
    server.listen(0, done); // porta aleatória para testes
  });

  afterAll((done) => {
    server.close(done);
  });

  test('responde com status 200', (done) => {
    const { port } = server.address();
    http.get(`http://localhost:${port}`, (res) => {
      expect(res.statusCode).toBe(200);
      done();
    });
  });

  test('responde com JSON contendo status ok', (done) => {
    const { port } = server.address();
    http.get(`http://localhost:${port}`, (res) => {
      let data = '';
      res.on('data', (chunk) => { data += chunk; });
      res.on('end', () => {
        const body = JSON.parse(data);
        expect(body.status).toBe('ok');
        done();
      });
    });
  });
});

describe('Função greet', () => {
  test('retorna saudação correta', () => {
    expect(greet('Pedro')).toBe('Olá, Pedro!');
  });

  test('funciona com qualquer nome', () => {
    expect(greet('DevOps')).toBe('Olá, DevOps!');
  });
});
