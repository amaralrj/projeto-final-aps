<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="cabecalho.jsp" />
<c:import url="menu.jsp" />
<div class="container-fluid">
	<div class="row-fluid">
		<div class="pull-left span4"></div>
	</div>
</div>
</div>
<div class="row">
	<div class="span1">
		<a> </a>
	</div>
	<div class="span11">
		<ol class="breadcrumb">
			<li><a href="home.html"><i class="icon-home"></i> Home</a> <span
				class="divider">/</span></li>
			<li class="active">�rea do Usu�rio</li>
		</ol>
		<div class="hero-unit">
			<h1>Bem-Vindo ${usuarioLogado.nome}</h1>
			<p>�rea do Usu�rio</p>
		</div>
	</div>
</div>

<c:import url="rodape.jsp" />