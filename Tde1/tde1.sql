CREATE TABLE Pessoa ( /*ok*/
    cpf CHAR(11) NOT NULL, 
    nome VARCHAR(30) NOT NULL,
    PRIMARY KEY (cpf)
);

CREATE TABLE Funcionario (/*ok*/
    cpf CHAR(11) NOT NULL,  
    cracha INT NOT NULL,
    PRIMARY KEY (cpf),
    FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);

CREATE TABLE Empresa ( /*ok*/
    cnpj CHAR(14) NOT NULL,  
    ie VARCHAR(9) NOT NULL, 
    PRIMARY KEY (cnpj)
);

CREATE TABLE Projeto ( /*ok*/
    id_projeto int NOT NULL, 
    nome_projeto VARCHAR(30) NOT NULL,
    data_inicio DATE NOT NULL,
    PRIMARY KEY (id_projeto)
);

CREATE TABLE Tarefa ( /*ok*/
    id_tarefa int NOT NULL,
    objetivo VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_tarefa)
);

CREATE TABLE Feedback ( /*ok*/
    id_feedback int NOT NULL,
    comentarios VARCHAR(50) NOT NULL,
    melhorias VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_feedback)
);

CREATE TABLE Mentores ( /*ok*/
    cpf CHAR(11) NOT NULL,  
    especialidade VARCHAR(30) NOT NULL,
    PRIMARY KEY (cpf),
    FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);

CREATE TABLE Avaliacao ( /*ok*/
    id_avaliacao int NOT NULL,
    requisitos VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_avaliacao)
);

CREATE TABLE Diagnostico ( /*ok*/
    id_diagnostico int NOT NULL,
    pontos_fortes VARCHAR(80) NOT NULL,
    pontos_fracos VARCHAR(80) NOT NULL,
    PRIMARY KEY (id_diagnostico)
);

CREATE TABLE Pontuacao ( /*ok*/
    id_pontuacao int NOT NULL,
    score FLOAT NOT NULL,
    PRIMARY KEY (id_pontuacao)
);

CREATE TABLE Indicador ( /*ok*/
    id_indicador int NOT NULL,
    id_pontuacao_ind int NOT NULL,
    objetivos VARCHAR(80) NOT NULL,
    PRIMARY KEY (id_indicador),
    FOREIGN KEY (id_pontuacao_ind) REFERENCES Pontuacao(id_pontuacao)
);

CREATE TABLE Elabora ( /*ok*/
    id_projeto INT NOT NULL,
    cpf CHAR(11) NOT NULL,  
    cnpj CHAR(14) NOT NULL,  
    ideia VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_projeto, cpf, cnpj),
    FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto),
    FOREIGN KEY (cpf) REFERENCES Funcionario(cpf),
    FOREIGN KEY (cnpj) REFERENCES Empresa(cnpj)
);

CREATE TABLE Projeto_Tarefa (
    id_projeto INT NOT NULL,
    id_tarefa INT NOT NULL,
    PRIMARY KEY (id_projeto, id_tarefa),
    FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto),
    FOREIGN KEY (id_tarefa) REFERENCES Tarefa(id_tarefa)
);

CREATE TABLE Correcoes (
    id_tarefa INT NOT NULL,
    id_feedback INT NOT NULL,
    cpf CHAR(11) NOT NULL, 
    PRIMARY KEY (id_tarefa, id_feedback, cpf),
    FOREIGN KEY (id_tarefa) REFERENCES Tarefa(id_tarefa),
    FOREIGN KEY (id_feedback) REFERENCES Feedback(id_feedback),
    FOREIGN KEY (cpf) REFERENCES Mentores(cpf)  
);

CREATE TABLE Revisao (
    id_avaliacao INT NOT NULL,
    id_projeto INT NOT NULL,
    id_diagnostico INT NOT NULL,
    PRIMARY KEY (id_avaliacao, id_projeto, id_diagnostico),
    FOREIGN KEY (id_avaliacao) REFERENCES Avaliacao(id_avaliacao),
    FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto),
    FOREIGN KEY (id_diagnostico) REFERENCES Diagnostico(id_diagnostico)  
);

CREATE TABLE Conclusoes (
    id_diagnostico INT NOT NULL,
    id_indicador INT NOT NULL,
    PRIMARY KEY (id_diagnostico, id_indicador),
    FOREIGN KEY (id_diagnostico) REFERENCES Diagnostico(id_diagnostico),
    FOREIGN KEY (id_indicador) REFERENCES Indicador(id_indicador)
);

insert into Pessoa (cpf, nome) values
    ('95239491011', 'João Araujo Castro'),
    ('79394260013', 'Marina Carvalho Ferreira'),
    ('49393897077', 'Emilly Souza Cavalcanti'),
    ('19873929061', 'Amanda Alves Pinto'),
    ('94037098040', 'Letícia Ribeiro Azevedo'),
    ('12345678901', 'Ana Silva'),
    ('23456789012', 'Carlos Oliveira'),
    ('34567890123', 'Fernanda Costa'),
    ('45678901234', 'João Pereira'),
    ('56789012345', 'Mariana Santos');

insert into Funcionario (cpf, cracha) values
    ('19873929061', 5495),
    ('79394260013', 6599),
    ('95239491011', 6891),
    ('94037098040', 8551),
    ('49393897077', 9289);

insert into Empresa (cnpj, ie) values
    ('88370727000101', '125825048'),
    ('96440536000105', '120498391'),
    ('81121970000147', '128653728'),
    ('00665438000199', '288345428'),
    ('35866113000159', '316682284');

INSERT INTO Projeto (id_projeto, nome_projeto, data_inicio) VALUES
    (1, 'Desenvolvimento de App', '2024-01-15'),
    (2, 'Lançamento de Produto', '2024-02-20'),
    (3, 'Atualização de Website', '2024-03-10'),
    (4, 'Pesquisa de Mercado', '2024-04-05'),
    (5, 'Otimização de Processos', '2024-05-25');

INSERT INTO Tarefa (id_tarefa, objetivo) VALUES
    (1, 'Definir requisitos do projeto'),
    (2, 'Criar protótipos de design'),
    (3, 'Desenvolver funcionalidades principais'),
    (4, 'Realizar testes de usabilidade'),
    (5, 'Preparar documentação final');

INSERT INTO Feedback (id_feedback, comentarios, melhorias) VALUES
    (1, 'Ótimo trabalho, mas precisa de mais testes.', 'Adicionar testes de carga.'),
    (2, 'Interface amigável e fácil de usar.', 'Melhorar a acessibilidade.'),
    (3, 'Bom desempenho, mas a documentação está faltando.', 'Completar a documentação.'),
    (4, 'A funcionalidade está bem implementada.', 'Adicionar opções de customização.'),
    (5, 'O projeto atende às expectativas.', 'Considerar integração com outras plataformas.');

INSERT INTO Mentores (cpf, especialidade) VALUES
('12345678901', 'Desenvolvimento de Software'),
('23456789012', 'Gerenciamento de Projetos'),
('34567890123', 'Design de UX/UI'),
('45678901234', 'Infraestrutura de TI'),
('56789012345', 'Segurança da Informação');

INSERT INTO Avaliacao (id_avaliacao, requisitos) VALUES
(1, 'O sistema deve ser escalável e suportar 1000 usuários simultâneos.'),
(2, 'A interface deve ser responsiva em dispositivos móveis e desktops.'),
(3, 'O sistema deve integrar-se com o sistema de pagamento existente.'),
(4, 'Deve haver um processo de autenticação de dois fatores para segurança adicional.'),
(5, 'A aplicação deve permitir a exportação de dados em formatos CSV e PDF.');

INSERT INTO Diagnostico (id_diagnostico, pontos_fortes, pontos_fracos) VALUES
(1, 'Interface intuitiva e fácil de usar', 'Desempenho lento em dispositivos antigos'),
(2, 'Documentação completa e clara', 'Falta de integração com ferramentas externas'),
(3, 'Alta segurança e proteção de dados', 'Curva de aprendizado acentuada para novos usuários'),
(4, 'Boa escalabilidade para aumentar o número de usuários', 'Problemas de compatibilidade com navegadores antigos'),
(5, 'Funcionalidades robustas e bem implementadas', 'Alguns bugs intermitentes nas funcionalidades avançadas');

INSERT INTO Pontuacao (id_pontuacao, score) VALUES
(1, 85.5),
(2, 90.0),
(3, 78.2),
(4, 92.7),
(5, 88.3);

INSERT INTO Indicador (id_indicador, id_pontuacao_ind, objetivos) VALUES
(1, 1, 'Melhoria de desempenho'),
(2, 2, 'Aumento da eficiência'),
(3, 3, 'Otimização de processos'),
(4, 4, 'Desenvolvimento de novas funcionalidades'),
(5, 5, 'Aprimoramento da interface');

insert into Elabora (id_projeto, cpf, cnpj, ideia) values
(1, '95239491011', '96440536000105', 'Criar um aplicativo móvel para gerenciamento de tarefas.'),
(2, '79394260013', '00665438000199', 'Lançar uma nova linha de produtos para o mercado de tecnologia.'),
(3, '94037098040', '88370727000101', 'Redesenhar o site para melhorar a experiência do usuário.'),
(4, '19873929061', '81121970000147', 'Realizar uma pesquisa para entender as tendências do mercado e preferências dos consumidores.'),
(5, '49393897077', '35866113000159', 'Melhorar a eficiência dos processos internos da empresa.');

insert into Projeto_Tarefa (id_projeto, id_tarefa) values
(2, 1),
(2, 2),
(3, 2),
(3, 3),
(4, 3),
(4, 4),
(5, 4),
(5, 5),
(1, 5),
(1, 1);

insert into Correcoes values
(1, 5, '12345678901'),
(2, 4, '34567890123'),
(3, 3, '23456789012'),
(4, 2, '45678901234'),
(5, 1, '56789012345');

insert into Revisao values
(4, 5, 1),
(5, 1, 2),
(1, 2, 3),
(2, 3, 4),
(3, 4, 5);

insert into Conclusoes values
(1,3),
(2,1),
(3,5),
(4,4),
(5,2);