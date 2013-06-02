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
  `CodAreaDeConhecimento` int(11) NOT NULL,
  `Descricao` varchar(255) DEFAULT NULL,
  `Titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CodAreaDeConhecimento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AreaDeConhecimento`
--

LOCK TABLES `AreaDeConhecimento` WRITE;
/*!40000 ALTER TABLE `AreaDeConhecimento` DISABLE KEYS */;
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
  `Titulo` varchar(255) DEFAULT NULL,
  `Instituicao` varchar(255) DEFAULT NULL,
  `DataDeRealizacao` date DEFAULT NULL,
  `Cargo` varchar(255) DEFAULT NULL,
  `CodOrganizadora` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodConcurso`),
  KEY `CodOrganizadora_idx` (`CodOrganizadora`),
  CONSTRAINT `CodOrganizadora` FOREIGN KEY (`CodOrganizadora`) REFERENCES `Organizadora` (`CodOrganizadora`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Concurso`
--

LOCK TABLES `Concurso` WRITE;
/*!40000 ALTER TABLE `Concurso` DISABLE KEYS */;
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
  `Titulo` varchar(255) DEFAULT NULL,
  `Texto` text,
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
  `Nome` varchar(255) DEFAULT NULL,
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
  `CodQuestao` int(11) NOT NULL,
  `Enunciado` text,
  `OpcaoA` varchar(255) DEFAULT NULL,
  `OpcaoB` varchar(255) DEFAULT NULL,
  `OpcaoC` varchar(255) DEFAULT NULL,
  `OpcaoD` varchar(255) DEFAULT NULL,
  `OpcaoE` varchar(255) DEFAULT NULL,
  `OpcaoCorreta` set('A','B','C','D','E') DEFAULT NULL,
  `CodAreaDeConhecimento` int(11) DEFAULT NULL,
  `CodConcurso` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodQuestao`),
  KEY `CodAreaDeConhecimento_idx` (`CodAreaDeConhecimento`),
  KEY `CodConcurso_idx` (`CodConcurso`),
  CONSTRAINT `CodAreaDeConhecimento` FOREIGN KEY (`CodAreaDeConhecimento`) REFERENCES `AreaDeConhecimento` (`CodAreaDeConhecimento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CodConcurso` FOREIGN KEY (`CodConcurso`) REFERENCES `Concurso` (`CodConcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questao`
--

LOCK TABLES `Questao` WRITE;
/*!40000 ALTER TABLE `Questao` DISABLE KEYS */;
/*!40000 ALTER TABLE `Questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resposta`
--

DROP TABLE IF EXISTS `Resposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Resposta` (
  `CodResposta` int(11) NOT NULL,
  `OpcaoEscolhida` set('A','B','C','D','E') DEFAULT NULL,
  `CodQuestao` int(11) DEFAULT NULL,
  `CodResultado` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodResposta`),
  KEY `CodQuestao_idx` (`CodQuestao`),
  KEY `CodResultado_idx` (`CodResultado`),
  CONSTRAINT `CodQuestao` FOREIGN KEY (`CodQuestao`) REFERENCES `Questao` (`CodQuestao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CodResultado` FOREIGN KEY (`CodResultado`) REFERENCES `Resultado` (`CodResultado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Resposta`
--

LOCK TABLES `Resposta` WRITE;
/*!40000 ALTER TABLE `Resposta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Resposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resultado`
--

DROP TABLE IF EXISTS `Resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Resultado` (
  `CodResultado` int(11) NOT NULL,
  `NotaDoSimulado` int(11) DEFAULT NULL,
  `CodSimulado` int(11) DEFAULT NULL,
  `CodUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodResultado`),
  KEY `CodUsuario_idx` (`CodUsuario`),
  KEY `CodSimulado_idx` (`CodSimulado`),
  CONSTRAINT `CodSimulado` FOREIGN KEY (`CodSimulado`) REFERENCES `Simulado` (`CodSimulado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CodUsuario` FOREIGN KEY (`CodUsuario`) REFERENCES `Usuario` (`CodUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Resultado`
--

LOCK TABLES `Resultado` WRITE;
/*!40000 ALTER TABLE `Resultado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Simulado`
--

DROP TABLE IF EXISTS `Simulado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Simulado` (
  `CodSimulado` int(11) NOT NULL,
  `DataDeRealizacao` date DEFAULT NULL,
  `Hora de Realizacao` time DEFAULT NULL,
  `Duracao` int(11) DEFAULT NULL,
  `PontuacaoMinima` int(11) DEFAULT NULL,
  `Titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CodSimulado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Simulado`
--

LOCK TABLES `Simulado` WRITE;
/*!40000 ALTER TABLE `Simulado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Simulado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SimuladoPossuiAreaDeConhecimento`
--

DROP TABLE IF EXISTS `SimuladoPossuiAreaDeConhecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SimuladoPossuiAreaDeConhecimento` (
  `CodAreaDeConhecimento` int(11) NOT NULL,
  `CodSimulado` int(11) NOT NULL,
  PRIMARY KEY (`CodAreaDeConhecimento`,`CodSimulado`),
  KEY `CodSimulado_idx` (`CodSimulado`),
  KEY `CodAreaDeConhecimento_idx` (`CodAreaDeConhecimento`),
  CONSTRAINT `CodAreaDeConhecimento_area` FOREIGN KEY (`CodAreaDeConhecimento`) REFERENCES `AreaDeConhecimento` (`CodAreaDeConhecimento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CodSimulado_area` FOREIGN KEY (`CodSimulado`) REFERENCES `Simulado` (`CodSimulado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SimuladoPossuiAreaDeConhecimento`
--

LOCK TABLES `SimuladoPossuiAreaDeConhecimento` WRITE;
/*!40000 ALTER TABLE `SimuladoPossuiAreaDeConhecimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `SimuladoPossuiAreaDeConhecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SimuladoPossuiQuestao`
--

DROP TABLE IF EXISTS `SimuladoPossuiQuestao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SimuladoPossuiQuestao` (
  `CodQuestão` int(11) NOT NULL,
  `CodSimulado` int(11) NOT NULL,
  PRIMARY KEY (`CodQuestão`,`CodSimulado`),
  KEY `CodSimulado_idx` (`CodSimulado`),
  KEY `CodQuestao_idx` (`CodQuestão`),
  CONSTRAINT `CodQuestao_questao` FOREIGN KEY (`CodQuestão`) REFERENCES `Questao` (`CodQuestao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CodSimulado_questao` FOREIGN KEY (`CodSimulado`) REFERENCES `Simulado` (`CodSimulado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SimuladoPossuiQuestao`
--

LOCK TABLES `SimuladoPossuiQuestao` WRITE;
/*!40000 ALTER TABLE `SimuladoPossuiQuestao` DISABLE KEYS */;
/*!40000 ALTER TABLE `SimuladoPossuiQuestao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `CodUsuario` int(11) NOT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Sobrenome` varchar(255) DEFAULT NULL,
  `DataDeNascimento` date DEFAULT NULL,
  `Escolaridade` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Senha` varchar(255) DEFAULT NULL,
  `ReceberNotificacoes` tinyint(1) DEFAULT NULL,
  `Perfil` set('ADMIN','USER') NOT NULL,
  PRIMARY KEY (`CodUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (0,'Pedro','Licio','0000-00-00','Superior','amaralrj@gmail.com','123',NULL,'ADMIN');
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

-- Dump completed on 2013-06-02 19:48:14
