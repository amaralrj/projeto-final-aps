<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="navbar">
	<div class="navbar-inner">
		<div class="container">
			<a class="brand" href="#">Academida dos Aprovados</a> <a
				class="btn btn-link">Home</a> <a class="btn btn-link"
				href="cadastro_de_usuario.html">Cadastro</a>
			<div class="btn-group">
				<a class="btn dropdown-toggle btn-link" data-toggle="dropdown"
					href="#"> Simulado <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">Consultar Gabarito</a></li>
					<li><a href="#">Simulado Passado</a></li>
					<li><a href="#">Classifica��o Geral</a></li>
					<li><a href="#">Classifica��o do Simulado</a></li>
					<li><a href="listaTarefas">Lista de tarefas</a></li>
				</ul>
			</div>
			<a href="logon.html" class="btn btn-link">Logon</a> 
			<a class="navbar-text pull-right" href="logout"> - Sair do sistema</a>	
			<a 	class="navbar-text pull-right">Bem vindo, ${usuarioLogado.login}</a>
			
		</div>
	</div>