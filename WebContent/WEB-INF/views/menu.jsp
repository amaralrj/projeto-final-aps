<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="navbar">
	<div class="navbar-inner">
		<div class="container">
			<c:if test="${usuarioLogado eq null}">
				<a class="brand" href="mostraHome">Academia dos Aprovados</a>
				<a class="btn btn-link" href="mostraHome">Home</a>
				<a class="btn btn-link" href="novoUsuario">Cadastro</a>
			</c:if>
			<c:if test="${usuarioLogado ne null}">
				<c:if test="${usuarioLogado.perfil == 'ADMIN'}">
					<a class="brand" href="areaAdmin">Academia dos Aprovados</a>
				</c:if>
				<c:if test="${usuarioLogado.perfil == 'USER'}">
					<a class="brand" href="areaUsuario">Academida dos Aprovados</a>
					<a class="btn btn-link" href="mostraHome">Home</a>
					<a href="#" class="btn btn-link" >Alterar Cadastro</a>
				</c:if>
				<c:if test="${usuarioLogado.perfil == 'ADMIN'}">
					<div class="btn-group">
						<a class="btn dropdown-toggle btn-link" data-toggle="dropdown">
							Consultar <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#">Consultar Usuário</a></li>
							<li><a href="consultarAreaDeConhecimento">Consultar
									Área de Conhecimento</a></li>
							<li><a href="#">Consultar
									Organizadora</a></li>
							<li><a href="#">Consultar Concurso</a></li>
							<li><a href="consultarQuestao">Consultar Questão</a></li>
							<li><a href="#">Consultar Notícia</a></li>
						</ul>
					</div>
				<div class="btn-group">
					<a class="btn dropdown-toggle btn-link" data-toggle="dropdown">
						Incluir <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">Incluir Usuário</a></li>
						<li><a href="novaAreaDeConhecimento">Incluir Área de Conhecimento</a></li>
						<li><a href="#">Incluir Organizadora</a></li>
						<li><a href="#">Incluir Concurso</a></li>
						<li><a href="novaQuestao">Incluir Questão</a></li>
						<li><a href="#">Incluir Notícia</a></li>
					</ul>
				</div>					
				</c:if>
			</c:if>
			<c:if test="${(usuarioLogado == null) || (usuarioLogado.perfil == 'USER')}">
			<div class="btn-group">
				<a class="btn dropdown-toggle btn-link" data-toggle="dropdown" href="#"> 
				Simulado <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">Realizar Simulado Passado</a></li>
					<li><a href="#">Consultar Gabarito</a></li>
					<li><a href="#">Consultar Classificação Geral</a></li>
					<li><a href="consultarClassificacaoSimulado">Consultar Classificação do Simulado</a></li>
					
					<c:if test="${usuarioLogado.perfil == 'USER'}">
						<li class="divider"></li>
						<li><a href="#">Consultar Estatísticas do Usuário</a></li>						
						<li><a href="realizaSimulado?codUsuario=${usuarioLogado.codUsuario}">Realizar
									Simulado Previamente Inscrito</a></li>
						<li><a href="listaSimuladosAguardandoInscricao?codUsuario=${usuarioLogado.codUsuario}">Efetuar
									inscrição em Simulado</a></li>
					</c:if>
					
				</ul>
			</div>
			</c:if>
			<c:if test="${usuarioLogado eq null}">
				<a href="loginForm" class="btn btn-link">Logon</a>
			</c:if>
			<c:if test="${usuarioLogado ne null}">
				<c:if test="${usuarioLogado.perfil == 'ADMIN'}">
					<a href="novoSimulado" class="btn btn-link ">Criar Simulado</a>
				</c:if>
				<a class="btn btn-link" href="logout">Logoff</a>
				<a class="navbar-text pull-right">Bem-vindo ${usuarioLogado.nome}</a>
			</c:if>

		</div>
	</div>
</div>
