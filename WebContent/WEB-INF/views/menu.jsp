<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="navbar">
	<div class="navbar-inner">
		<div class="container">
			<a class="brand" href="mostraHome">Academida dos Aprovados</a> <a
				class="btn btn-link" href="mostraHome">Home</a> <a class="btn btn-link"
				href="cadastro_de_usuario.html">Cadastro</a>
			<div class="btn-group">
				<a class="btn dropdown-toggle btn-link" data-toggle="dropdown"
					href="#"> Simulado <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">Consultar Gabarito</a></li>
					<li><a href="#">Simulado Passado</a></li>
					<li><a href="#">Classificação Geral</a></li>
					<li><a href="#">Classificação do Simulado</a></li>
					<li><a href="listaTarefas">Lista de tarefas</a></li>
				</ul>
			</div>
			<c:if test="${usuarioLogado eq null}">
			<a href="loginForm" class="btn btn-link">Logon</a>
			</c:if> 
			<c:if test="${usuarioLogado ne null}">
			<a class="navbar-text pull-right" href="logout"> - Sair do sistema</a>	
			<a 	class="navbar-text pull-right">Bem vindo, ${usuarioLogado.login}&nbsp; </a>
			</c:if>
			
		</div>
	</div>