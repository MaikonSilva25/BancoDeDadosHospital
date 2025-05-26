CREATE TABLE Paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE,
    telefone VARCHAR(15)
);
CREATE TABLE Medico (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    crm VARCHAR(20) NOT NULL UNIQUE
);
CREATE TABLE Enfermeiro (
    id_enfermeiro INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    coren VARCHAR(20) NOT NULL UNIQUE
);
CREATE TABLE TipoQuarto (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    valor_diario DECIMAL(10,2) NOT NULL
);
CREATE TABLE Quarto (
    numero_quarto INT PRIMARY KEY,
    id_tipo INT NOT NULL,
    FOREIGN KEY (id_tipo) REFERENCES TipoQuarto(id_tipo)
);
CREATE TABLE Internacao (
    id_internacao INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    numero_quarto INT NOT NULL,
    data_entrada DATE NOT NULL,
    data_prevista_alta DATE,
    data_efetiva_alta DATE,
    descricao_procedimentos TEXT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (numero_quarto) REFERENCES Quarto(numero_quarto)
);
CREATE TABLE Internacao_Enfermeiro (
    id_internacao INT,
    id_enfermeiro INT,
    PRIMARY KEY (id_internacao, id_enfermeiro),
    FOREIGN KEY (id_internacao) REFERENCES Internacao(id_internacao),
    FOREIGN KEY (id_enfermeiro) REFERENCES Enfermeiro(id_enfermeiro)
);