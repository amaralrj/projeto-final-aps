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
			<li><a href="area_usuario.html">Área do Usuário</a> <span
				class="divider">/</span></li>
			<li class="active">Efetuar inscrição em Simulado</li>
		</ol>
		<table
			class="table table-hover table-bordered table-condensed table-striped">
			<caption>
				<b><h4 class="pull-left">Lista de Simulados disponíveis
						para inscrição</h4></b>
			</caption>
			<thead>
				<tr>
					<th>#</th>
					<th>Nome</th>
					<th>Data de Realização</th>
					<th>Operação</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${simulados}" var="simulado">
					<tr>
						<td>1</td>
						<td>Simulado para Banco do Brasil-Tecnico Administrativo</td>
						<td>20/10/2012</td>
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
				aria-hidden="true">×</button>
			<h3>Confirmar Inscrição</h3>
		</div>
		<div class="modal-body">
			<p>Confirma a inscrição no simulado "${simulado.titulo}"?</p>
		</div>
		<div class="modal-footer">
			<a
				href="efetuaInscricaoSimulado?codSimulado=${simulado.codSimulado}&codUsuario=${usuarioLogado.codUsuario}"
				class="btn" style="">Sim</a> <a href="#" class="btn btn-primary"
				data-dismiss="modal" aria-hidden="true" style="">Não</a>
		</div>
	</div>
</c:forEach>
<c:import url="../rodape.jsp" />