<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
				<tr>
					<td>1</td>
					<td>Simulado para Banco do Brasil-Tecnico Administrativo</td>
					<td>20/10/2012</td>
					<td><a href="#" role="button" class="btn btn-small">Inscrever
							no Simulado</a></td>
				</tr>
				<tr>
					<td>2</td>
					<td>Simulado de Matemática Financeira</td>
					<td>20/10/2012</td>
					<td><a href="#" role="button" class="btn btn-small">Inscrever
							no Simulado</a></td>
				</tr>
				<tr>
					<td>3</td>
					<td>Simulado de Direito do Trabalho</td>
					<td>20/10/2012</td>
					<td><a href="#" role="button" class="btn btn-small">Inscrever
							no Simulado</a></td>
				</tr>
				<tr>
					<td>4</td>
					<td>Simulado de Português</td>
					<td>20/10/2012</td>
					<td><a href="#" role="button" class="btn btn-small">Inscrever
							no Simulado</a></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>




<c:import url="../rodape.jsp" />