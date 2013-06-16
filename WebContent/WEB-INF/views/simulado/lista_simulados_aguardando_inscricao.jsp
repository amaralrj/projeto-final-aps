<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="../cabecalho.jsp" />
<c:import url="../menu.jsp" />
<div class="container-fluid">
	<div class="row-fluid">
		<div class="pull-left span1">
			<ul class="nav  nav-pills nav-stacked"></ul>
		</div>
		<div class="pull-left span7">
			<div class="row-fluid">
				<div class="span4">
					<p></p>
				</div>
			</div>
		</div>
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
			<li><a href="area_usuario.html">�rea do Usu�rio</a> <span
				class="divider">/</span></li>
			<li class="active">Efetuar inscri��o em Simulado</li>
		</ol>
		<table
			class="table table-hover table-bordered table-condensed table-striped">
			<caption>
				<b><h4 class="pull-left">Lista de Simulados dispon�veis
						para inscri��o</h4></b>
			</caption>
			<thead>
				<tr>
					<th>#</th>
					<th>Nome</th>
					<th>Data de Realiza��o</th>
					<th>Opera��o</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${simulados}" var="simulado">
					<tr>
						<td>${simulado.codSimulado}</td>
						<td>${simulado.titulo}</td>
						<td><fmt:formatDate value="${simulado.dataDeRealizacao.time}"
						pattern="dd/MM/yyyy" /></td>
						<td><a href="#" role="button" class="btn btn-small">Inscrever
								no Simulado</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>




<c:import url="../rodape.jsp" />