-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: sispol
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.13.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AreaDeConhecimento`
--

DROP TABLE IF EXISTS `AreaDeConhecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AreaDeConhecimento` (
  `CodAreaDeConhecimento` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(255) DEFAULT NULL,
  `Titulo` varchar(255) NOT NULL,
  PRIMARY KEY (`CodAreaDeConhecimento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AreaDeConhecimento`
--

LOCK TABLES `AreaDeConhecimento` WRITE;
/*!40000 ALTER TABLE `AreaDeConhecimento` DISABLE KEYS */;
INSERT INTO `AreaDeConhecimento` VALUES (1,'ortografia','Portugues'),(2,'areas da matemática','Matemática');
/*!40000 ALTER TABLE `AreaDeConhecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Concurso`
--

DROP TABLE IF EXISTS `Concurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Concurso` (
  `CodConcurso` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Instituicao` varchar(255) NOT NULL,
  `DataDeRealizacao` date NOT NULL,
  `Cargo` varchar(255) NOT NULL,
  `CodOrganizadora` int(11) NOT NULL,
  PRIMARY KEY (`CodConcurso`),
  KEY `CodOrganizadora_idx` (`CodOrganizadora`),
  CONSTRAINT `CodOrganizadora` FOREIGN KEY (`CodOrganizadora`) REFERENCES `Organizadora` (`CodOrganizadora`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Concurso`
--

LOCK TABLES `Concurso` WRITE;
/*!40000 ALTER TABLE `Concurso` DISABLE KEYS */;
INSERT INTO `Concurso` VALUES (1,'ENEM 2012 - Caderno 1 - Azul','','0000-00-00','',0);
/*!40000 ALTER TABLE `Concurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Noticia`
--

DROP TABLE IF EXISTS `Noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Noticia` (
  `CodNoticia` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Texto` text NOT NULL,
  `DataDeCriacao` date DEFAULT NULL,
  PRIMARY KEY (`CodNoticia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Noticia`
--

LOCK TABLES `Noticia` WRITE;
/*!40000 ALTER TABLE `Noticia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Noticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organizadora`
--

DROP TABLE IF EXISTS `Organizadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organizadora` (
  `CodOrganizadora` int(11) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CodOrganizadora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organizadora`
--

LOCK TABLES `Organizadora` WRITE;
/*!40000 ALTER TABLE `Organizadora` DISABLE KEYS */;
/*!40000 ALTER TABLE `Organizadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Questao`
--

DROP TABLE IF EXISTS `Questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Questao` (
  `CodQuestao` int(11) NOT NULL AUTO_INCREMENT,
  `Enunciado` text NOT NULL,
  `OpcaoA` varchar(255) NOT NULL,
  `OpcaoB` varchar(255) NOT NULL,
  `OpcaoC` varchar(255) NOT NULL,
  `OpcaoD` varchar(255) NOT NULL,
  `OpcaoE` varchar(255) NOT NULL,
  `OpcaoCorreta` set('A','B','C','D','E') NOT NULL,
  `CodAreaDeConhecimento` int(11) NOT NULL,
  `CodConcurso` int(11) NOT NULL,
  PRIMARY KEY (`CodQuestao`),
  KEY `CodAreaDeConhecimento_idx` (`CodAreaDeConhecimento`),
  KEY `CodConcurso_idx` (`CodConcurso`),
  CONSTRAINT `CodAreaDeConhecimento` FOREIGN KEY (`CodAreaDeConhecimento`) REFERENCES `AreaDeConhecimento` (`CodAreaDeConhecimento`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `CodConcurso` FOREIGN KEY (`CodConcurso`) REFERENCES `Concurso` (`CodConcurso`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questao`
--

LOCK TABLES `Questao` WRITE;
/*!40000 ALTER TABLE `Questao` DISABLE KEYS */;
INSERT INTO `Questao` VALUES (1,'Responda a questao de Port.','','','','','','A',1,0),(2,'Responda a questão de Mat.','','','','','','B',2,0),(4,'Enuncaido2','opcao a','opcao b','opcao c','opcao d','opcao e','A',2,1);
/*!40000 ALTER TABLE `Questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resposta`
--

DROP TABLE IF EXISTS `Resposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Resposta` (
  `CodResposta` int(11) NOT NULL AUTO_INCREMENT,
  `OpcaoEscolhida` set('A','B','C','D','E') NOT NULL,
  `CodQuestao` int(11) NOT NULL,
  `CodResultado` int(11) NOT NULL,
  PRIMARY KEY (`CodResposta`),
  KEY `CodQuestao_idx` (`CodQuestao`),
  KEY `CodResultado_idx` (`CodResultado`),
  CONSTRAINT `CodQuestao` FOREIGN KEY (`CodQuestao`) REFERENCES `Questao` (`CodQuestao`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `CodResultado` FOREIGN KEY (`CodResultado`) REFERENCES `Resultado` (`CodResultado`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Resposta`
--

LOCK TABLES `Resposta` WRITE;
/*!40000 ALTER TABLE `Resposta` DISABLE KEYS */;
INSERT INTO `Resposta` VALUES (1,'A',2,1),(2,'A',1,1);
/*!40000 ALTER TABLE `Resposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resultado`
--

DROP TABLE IF EXISTS `Resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Resultado` (
  `CodResultado` int(11) NOT NULL AUTO_INCREMENT,
  `NotaDoSimulado` int(11) NOT NULL,
  `CodSimulado` int(11) NOT NULL,
  `CodUsuario` int(11) NOT NULL,
  PRIMARY KEY (`CodResultado`),
  KEY `CodUsuario_idx` (`CodUsuario`),
  KEY `CodSimulado_idx` (`CodSimulado`),
  CONSTRAINT `CodSimulado` FOREIGN KEY (`CodSimulado`) REFERENCES `Simulado` (`CodSimulado`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `CodUsuario` FOREIGN KEY (`CodUsuario`) REFERENCES `Usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Resultado`
--

LOCK TABLES `Resultado` WRITE;
/*!40000 ALTER TABLE `Resultado` DISABLE KEYS */;
INSERT INTO `Resultado` VALUES (1,1,1,2);
/*!40000 ALTER TABLE `Resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Simulado`
--

DROP TABLE IF EXISTS `Simulado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Simulado` (
  `CodSimulado` int(11) NOT NULL AUTO_INCREMENT,
  `DataDeRealizacao` date NOT NULL,
  `HoraDeRealizacao` time NOT NULL,
  `Duracao` int(11) NOT NULL,
  `PontuacaoMinima` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  PRIMARY KEY (`CodSimulado`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Simulado`
--

LOCK TABLES `Simulado` WRITE;
/*!40000 ALTER TABLE `Simulado` DISABLE KEYS */;
INSERT INTO `Simulado` VALUES (1,'2013-06-29','12:00:00',5,10,'Enem 2012'),(2,'2013-07-16','16:00:00',2,10,'Enem 2012'),(3,'2013-07-16','16:00:00',2,10,'Portugues'),(4,'2013-07-16','16:00:00',2,10,'Enem 2012'),(5,'2013-07-16','16:00:00',2,10,'Enem 2012'),(6,'2013-07-16','16:00:00',2,10,'Enem 2012'),(7,'2013-07-16','16:00:00',2,10,'Enem 2012'),(8,'2013-07-16','16:00:00',2,10,'Enem 2012'),(9,'2013-07-16','16:00:00',2,10,'Enem 2012'),(10,'2013-07-16','16:00:00',2,10,'sei la'),(11,'2013-07-16','16:00:00',2,10,'Portugues'),(12,'2013-07-16','16:00:00',2,10,'Enem 2012'),(13,'2013-07-16','16:00:00',2,10,'Enem 2012'),(14,'2013-07-16','16:00:00',2,10,'Enem 2012'),(15,'2013-07-16','16:00:00',2,10,'Matemática'),(16,'2013-07-16','16:00:00',2,10,'Enem 2012'),(17,'2013-07-16','16:00:00',2,10,'uyatsdiuh'),(18,'2013-07-16','16:00:00',2,10,'ulmto');
/*!40000 ALTER TABLE `Simulado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SimuladoPossuiQuestao`
--

DROP TABLE IF EXISTS `SimuladoPossuiQuestao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SimuladoPossuiQuestao` (
  `CodQuestao` int(11) NOT NULL,
  `CodSimulado` int(11) NOT NULL,
  PRIMARY KEY (`CodQuestao`,`CodSimulado`),
  KEY `CodSimulado_idx` (`CodSimulado`),
  KEY `CodQuestao_idx` (`CodQuestao`),
  CONSTRAINT `CodQuestao_questao` FOREIGN KEY (`CodQuestao`) REFERENCES `Questao` (`CodQuestao`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `CodSimulado_questao` FOREIGN KEY (`CodSimulado`) REFERENCES `Simulado` (`CodSimulado`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SimuladoPossuiQuestao`
--

LOCK TABLES `SimuladoPossuiQuestao` WRITE;
/*!40000 ALTER TABLE `SimuladoPossuiQuestao` DISABLE KEYS */;
INSERT INTO `SimuladoPossuiQuestao` VALUES (1,1),(2,1),(1,18),(2,18);
/*!40000 ALTER TABLE `SimuladoPossuiQuestao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `CodUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `Sobrenome` varchar(255) NOT NULL,
  `DataDeNascimento` date DEFAULT NULL,
  `Escolaridade` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Senha` varchar(255) NOT NULL,
  `ReceberNotificacoes` tinyint(1) DEFAULT '0',
  `Perfil` set('ADMIN','USER') NOT NULL DEFAULT 'USER',
  PRIMARY KEY (`CodUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'Pedro','Licio','0000-00-00','Superior','amaralrj@gmail.com','123',NULL,'ADMIN'),(2,'Anderson','Santos','0000-00-00','Superior','asantos35@gmail.com','123',NULL,'USER');
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefas`
--

DROP TABLE IF EXISTS `tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarefas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `finalizado` tinyint(1) DEFAULT NULL,
  `dataFinalizacao` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefas`
--

LOCK TABLES `tarefas` WRITE;
/*!40000 ALTER TABLE `tarefas` DISABLE KEYS */;
INSERT INTO `tarefas` VALUES (1,'teste',0,NULL);
/*!40000 ALTER TABLE `tarefas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-18 21:40:34
