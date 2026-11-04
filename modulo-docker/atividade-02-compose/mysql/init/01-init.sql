CREATE TABLE IF NOT EXISTS alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    curso VARCHAR(120) NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO alunos (nome, curso) VALUES
    ('Ana Silva', 'DevOps'),
    ('Bruno Costa', 'Cloud Computing'),
    ('Carla Souza', 'DevSecOps');
