-- Criação do Banco de Dados
CREATE DATABASE clinica;

-- Comando para utilizar o Banco
USE clinica;

-- Criação da tabela tipo_telefone
CREATE TABLE tb_tipo_telefone(
    tipo_tel_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    tipo_telefone VARCHAR(12) NOT NULL
);

-- Criação da tabela tb_telefone
CREATE TABLE tb_telefone(
    tel_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    tel_numero VARCHAR(25) NOT NULL,
    tel_ddd CHAR(2) NOT NULL,
    tipo_tel_id INT(11) NOT NULL,
    FOREIGN KEY (tipo_tel_id) REFERENCES tb_tipo_telefone(tipo_tel_id)
) ENGINE=INNODB;

-- Criação da tabela tb_tipo_endereco
CREATE TABLE tb_tipo_endereco(
    tipo_end_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    tipo_endereco VARCHAR(12) NOT NULL
) ENGINE=INNODB;

-- Criação da tabela tb_endereco
CREATE TABLE tb_endereco(
    end_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    end_rua VARCHAR(100) NOT NULL,
    end_numero VARCHAR(10) NOT NULL,
    end_bairro VARCHAR(100) NOT NULL,
    end_cidade VARCHAR(100) NOT NULL,
    end_estado CHAR(2) NOT NULL,
    tipo_end_id INT(11) NOT NULL,
    FOREIGN KEY (tipo_end_id) REFERENCES tb_tipo_endereco(tipo_end_id)
) ENGINE=INNODB;

-- Criação da tabela tb_especialidade
CREATE TABLE tb_especialidade(
    esp_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    especialidade VARCHAR(30) NOT NULL
) ENGINE=INNODB;

-- Criação da tabela tb_medico
CREATE TABLE tb_medico(
    med_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    med_nome VARCHAR(50) NOT NULL,
    med_crm VARCHAR(20) NOT NULL UNIQUE,
    med_email VARCHAR(50) NOT NULL UNIQUE
) ENGINE=INNODB;

-- Criação da tabela tb_paciente
CREATE TABLE tb_paciente(
    pac_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    pac_nome VARCHAR(50) NOT NULL,
    pac_cpf VARCHAR(11) NOT NULL UNIQUE,
    pac_data_nascimento DATE NOT NULL,
    pac_sexo CHAR(1) NOT NULL,
    pac_email VARCHAR(50) NOT NULL UNIQUE
) ENGINE=INNODB;

-- Criação da tabela tb_consulta
CREATE TABLE tb_consulta(
    con_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    con_data DATE NOT NULL,
    con_hora TIME NOT NULL,
    con_status VARCHAR(15) NOT NULL,
    med_id INT(11) NOT NULL,
    pac_id INT(11) NOT NULL,
    FOREIGN KEY (med_id) REFERENCES tb_medico(med_id),
    FOREIGN KEY (pac_id) REFERENCES tb_paciente(pac_id)
) ENGINE=INNODB;
