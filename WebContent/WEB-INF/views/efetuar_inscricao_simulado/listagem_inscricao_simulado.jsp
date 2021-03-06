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
			<li><a href="#"><i class="icon-home"></i> Home</a> <span
				class="divider">/</span></li>
			<li><a href="#">�rea do Usu�rio</a> <span
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
						<td><a href="#modal_inscrever_${simulado.codSimulado}" role="button" class="btn"
						data-toggle="modal">Inscrever
								no Simulado</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<td></td>
<!-- Modal Excluir -->
<c:forEach items="${simulados}" var="simulado">
	<div id="modal_inscrever_${simulado.codSimulado}"
		class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-header" style="">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">�</button>
			<h3>Confirmar Inscri��o</h3>
		</div>
		<div class="modal-body">
			<p>Confirma a inscri��o no simulado "${simulado.titulo}"?</p>
		</div>
		<div class="modal-footer">
			<a
				href="efetuaInscricaoSimulado?codSimulado=${simulado.codSimulado}&codUsuario=${usuarioLogado.codUsuario}"
				class="btn" style="">Sim</a> <a href="#" class="btn btn-primary"
				data-dismiss="modal" aria-hidden="true" style="">N�o</a>
		</div>
	</div>
</c:forEach>
<c:import url="../rodape.jsp" />