-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 30-Out-2015 às 20:36
-- Versão do servidor: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nwkcolecaodb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartoes`
--

CREATE TABLE `cartoes` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `serie` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `dh_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cartoes`
--

INSERT INTO `cartoes` (`codigo`, `nome`, `serie`, `usuario`, `dh_registro`) VALUES
(1, 'a', 'a', 'Richard', '2015-10-29 13:21:35');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE `livro` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `dh_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`codigo`, `nome`, `autor`, `usuario`, `dh_registro`) VALUES
(1, 'teste', 'a', 'Richard', '2015-10-29 13:34:22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `miniaturas`
--

CREATE TABLE `miniaturas` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `dh_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `miniaturas`
--

INSERT INTO `miniaturas` (`codigo`, `nome`, `usuario`, `dh_registro`) VALUES
(1, 'aw', 'Richard', '2015-10-29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `dh_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`codigo`, `nome`, `senha`, `dh_registro`) VALUES
(1, 'a', 'aa', '2015-10-29 15:15:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cartoes`
--
ALTER TABLE `cartoes`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `miniaturas`
--
ALTER TABLE `miniaturas`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cartoes`
--
ALTER TABLE `cartoes`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `livro`
--
ALTER TABLE `livro`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `miniaturas`
--
ALTER TABLE `miniaturas`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
