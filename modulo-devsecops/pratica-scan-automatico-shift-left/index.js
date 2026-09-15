const express = require('express');
const app = express();

// Exemplo de má prática (Hardcoded Secret) para o teste de SAST
const API_SECRET_KEY = "123456-super-secret-key-exposed"; 

app.get('/', (req, res) => {
  res.send('Aplicação DevSecOps rodando com sucesso!');
});

app.listen(3000, () => {
  console.log('Servidor rodando na porta 3000');
});