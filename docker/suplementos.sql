-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: suplementos
-- ------------------------------------------------------
-- Server version       8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS suplementos;
CREATE DATABASE suplementos;
USE suplementos;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comentario` varchar(510) NOT NULL,
  `feed` int NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `conta` varchar(255) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_feed_idx` (`feed`),
  CONSTRAINT `fk_comentarios_feeds` FOREIGN KEY (`feed`) REFERENCES `feeds` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` (`id`, `comentario`, `feed`, `nome`, `conta`, `data`) VALUES
(1, 'Os suplementos realmente ajudaram no meu desempenho na academia. Sinto-me mais energético e focado.', 1, 'Carlos Silva', 'usuario1@example.com', '2024-07-31 17:00:00'),
(2, 'Não notei muita diferença após começar a usar esses suplementos. O custo-benefício não é o melhor.', 1, 'Ana Souza', 'usuario2@example.com', '2024-07-31 17:05:00'),
(3, 'Ótimo produto! Recomendo para quem quer ganhar massa muscular rapidamente.', 1, 'Roberto Lima', 'usuario3@example.com', '2024-07-31 17:10:00'),
(4, 'Tive alguns efeitos colaterais, como dores de estômago. Não sei se vou continuar usando.', 2, 'Juliana Costa', 'usuario4@example.com', '2024-07-31 17:15:00'),
(5, 'Excelente para recuperação muscular. Sinto que meus treinos estão mais produtivos.', 2, 'Pedro Almeida', 'usuario5@example.com', '2024-07-31 17:20:00'),
(6, 'O sabor é péssimo, mas o efeito é bom. Vale a pena se você conseguir suportar o gosto.', 2, 'Mariana Oliveira', 'usuario6@example.com', '2024-07-31 17:25:00'),
(7, 'Boa qualidade e preço justo. Vi melhorias significativas no meu condicionamento físico.', 7, 'Lucas Pereira', 'usuario7@example.com', '2024-07-31 17:30:00'),
(8, 'O suplemento não atendeu às minhas expectativas. O efeito foi bem abaixo do esperado.', 2, 'Fernanda Santos', 'usuario8@example.com', '2024-07-31 17:35:00'),
(9, 'Muito bom! Me ajudou a aumentar a força e a resistência durante os treinos.', 2, 'Eduardo Martins', 'usuario9@example.com', '2024-07-31 17:40:00'),
(10, 'O suplemento é eficaz, mas o preço é um pouco alto para a quantidade que vem na embalagem.', 2, 'Camila Rocha', 'usuario10@example.com', '2024-07-31 17:45:00'),
(11, 'Estou vendo ótimos resultados na definição muscular. Vale cada centavo!', 6, 'Jorge Silva', 'usuario11@example.com', '2024-07-31 17:50:00'),
(12, 'A embalagem veio com um cheiro estranho. Não estou certa sobre a qualidade do produto.', 6, 'Paula Lima', 'usuario12@example.com', '2024-07-31 17:55:00'),
(13, 'Boa fórmula e eficácia, mas eu esperava um pouco mais de resultados rápidos.', 3, 'Ricardo Costa', 'usuario13@example.com', '2024-07-31 18:00:00'),
(14, 'Gostei muito do suplemento. Aumento na energia e na resistência durante os treinos.', 3, 'Marcos Oliveira', 'usuario14@example.com', '2024-07-31 18:05:00'),
(15, 'Não recomendo. Aumentou minha ansiedade e não vi resultados significativos.', 3, 'Laura Fernandes', 'usuario15@example.com', '2024-07-31 18:10:00'),
(16, 'Excelente suplemento. Senti uma melhora na recuperação muscular e aumento na força.', 3, 'Gustavo Lima', 'usuario16@example.com', '2024-07-31 18:15:00'),
(17, 'Os resultados não foram tão evidentes quanto eu esperava. O suplemento é bom, mas poderia ser melhor.', 3, 'Isabela Martins', 'usuario17@example.com', '2024-07-31 18:20:00'),
(18, 'Gostei muito do efeito do suplemento. Melhorou minha performance na academia.', 3, 'Felipe Alves', 'usuario18@example.com', '2024-07-31 18:25:00'),
(19, 'O preço é um pouco salgado e o efeito não compensou. Não voltaria a comprar.', 4, 'Renata Santos', 'usuario19@example.com', '2024-07-31 18:30:00'),
(20, 'Ótimo suplemento para quem deseja ganhar massa muscular. A qualidade é muito boa.', 4, 'Vitor Costa', 'usuario20@example.com', '2024-07-31 18:35:00'),
(21, 'Não gostei do suplemento. O efeito foi abaixo do esperado e o sabor é ruim.', 4, 'Tatiane Silva', 'usuario21@example.com', '2024-07-31 18:40:00');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
-- Inserir empresas únicas
INSERT INTO `empresas` (`nome`, `avatar`)
VALUES ('Max Titanium', 'maxtitanium.png');

INSERT INTO `empresas` (`nome`, `avatar`)
VALUES ('NutriFit', 'nutrifit.png');

INSERT INTO `empresas` (`nome`, `avatar`)
VALUES ('Growth', 'growth.png');

/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeds`
--

DROP TABLE IF EXISTS `feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feeds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `produto` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_feeds_produtos_idx` (`produto`),
  CONSTRAINT `fk_feeds_produtos` FOREIGN KEY (`produto`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeds`
--

LOCK TABLES `feeds` WRITE;
/*!40000 ALTER TABLE `feeds` DISABLE KEYS */;
INSERT INTO feeds (id, data, produto) VALUES
(1, '2024-07-30 17:00:00', 1),
(2, '2024-07-30 17:00:00', 2),
(3, '2024-07-30 17:00:00', 3),
(4, '2024-07-30 17:00:00', 4),
(5, '2024-07-30 17:00:00', 5),
(6, '2024-07-30 17:00:00', 6),
(7, '2024-07-30 17:00:00', 7),
(8, '2024-07-30 17:00:00', 8),
(9, '2024-07-30 17:00:00', 9),
(10, '2024-07-30 17:00:00', 10),
(11, '2024-07-30 17:00:00', 11),
(12, '2024-07-30 17:00:00', 12);

/*!40000 ALTER TABLE `feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feed` int NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_likes_feeds_idx` (`feed`),
  CONSTRAINT `fk_likes_feeds` FOREIGN KEY (`feed`) REFERENCES `feeds` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` (id, feed, email) VALUES
(1,1,'usuario1@example.com'),
(2,1,'usuario2@example.com'),
(3,2,'usuario3@example.com'),
(4,2,'usuario4@example.com'),
(5,3,'usuario5@example.com'),
(6,3,'usuario6@example.com'),
(7,4,'usuario7@example.com');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(510) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `url` varchar(1020) NOT NULL,
  `imagem1` varchar(255) NOT NULL,
  `imagem2` varchar(255) DEFAULT NULL,
  `imagem3` varchar(255) DEFAULT NULL,
  `empresa` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produtos_empesas_idx` (`empresa`),
  CONSTRAINT `fk_produtos_empesas` FOREIGN KEY (`empresa`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`id`, `nome`, `descricao`, `preco`, `url`, `imagem1`, `imagem2`, `imagem3`, `empresa`)
VALUES
(1, 'Whey Protein Concentrado', 'Suplemento proteico com 24g de proteína por dose, ideal para recuperação muscular e ganho de massa.', 150.00, 'https://www.maxtitanium.com.br/', 'whey1.jpg', 'whey2.jpg', 'whey3.jpg', 1),
(2, 'Creatina Monohidratada', 'Aumenta a força e o desempenho durante treinos intensos, com alta pureza e solubilidade.', 90.00, 'https://www.nutrifit.com.br/', 'creatina1.png', 'creatina2.jpg', NULL, 2),
(3, 'BCAA', 'Auxilia na recuperação muscular e redução da fadiga, com uma fórmula balanceada de aminoácidos essenciais.', 110.00, 'https://www.gsuplementos.com.br/', 'bcaa1.png', 'bcaa2.png', NULL, 3),
(4, 'Pré-Treino Energético', 'Formulação potente para aumentar a energia e a concentração durante os treinos.', 120.00, 'https://www.maxtitanium.com.br/', 'pre-treino1.jpg', 'pre-treino2.jpg', NULL, 1),
(5, 'Glutamina', 'Ideal para recuperação muscular e fortalecimento do sistema imunológico.', 80.00, 'https://www.nutrifit.com.br/', 'glutamina1.png', 'glutamina2.jpg', NULL, 2),
(6, 'Multivitamínico', 'Suplemento completo com vitaminas e minerais essenciais para o bem-estar geral e desempenho físico.', 95.00, 'https://www.gsuplementos.com.br/', 'multivitaminico1.png', 'multivitaminico2.png', NULL, 3),
(7, 'Óleo de Peixe', 'Fonte rica em ácidos graxos essenciais, promovendo a saúde cardiovascular e a recuperação muscular.', 70.00, 'https://www.gsuplementos.com.br/', 'oleo-peixe1.png', 'oleo-peixe2.png', NULL, 3),
(8, 'Proteína Vegana', 'Suplemento proteico à base de plantas, ideal para veganos e vegetarianos.', 130.00, 'https://www.gsuplementos.com.br/', 'proteina-vegana1.png', 'proteina-vegana2.png', NULL, 3),
(9, 'Termogênico', 'Aumenta o metabolismo e auxilia na queima de gordura, ajudando na perda de peso.', 100.00, 'https://www.gsuplementos.com.br/', 'termogenico1.png', 'termogenico2.png', NULL, 3),
(10, 'Caseína', 'Proteína de lenta absorção, ideal para consumir antes de dormir para promover a recuperação durante o sono.', 160.00, 'https://www.gsuplementos.com.br/', 'caseina1.png', 'caseina2.png', NULL, 3),
(11, 'Whey Protein Concentrado', 'Suplemento proteico com 24g de proteína por dose, ideal para recuperação muscular e ganho de massa.', 85.00, 'https://www.gsuplementos.com.br/', 'whey4.png', 'whey5.png', NULL, 3),
(12, 'HMB', 'Suplemento para melhorar a recuperação muscular e reduzir a quebra muscular após treinos intensos.', 140.00, 'https://www.gsuplementos.com.br/', 'hmb1.png', 'hmb2.jpg', NULL, 3);

/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-16 21:48:40
