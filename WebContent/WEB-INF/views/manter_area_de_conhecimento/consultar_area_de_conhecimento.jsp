<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:import url="../cabecalho.jsp" />
<c:import url="../menu.jsp" />
<div class="container-fluid">
	<div class="row-fluid">
		<div class="pull-left span4">
			<ul class="nav  nav-pills nav-stacked"></ul>
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
			<li><a href="area_admin.html">Área de Administração</a> <span
				class="divider">/</span></li>
			<li class="active">Consultar Área de Conhecimento</li>
		</ol>
		<form action="consultarAreaDeConhecimento" method="post">
			<fieldset>
				<legend>Consultar Área de Conhecimento</legend>
				<div class="control-group">
					<label class="control-label" for="inputNome"> <b>Título</b>
					</label>
					<div class="controls">
						<input type="text" id="inputNome" name="titulo"
							placeholder="Título da Área de Conhecimento" />
					</div>
				</div>
			</fieldset>
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">Consultar</button>
			</div>
		</form>
		<table
			class="table table-hover table-bordered table-condensed table-striped">
			<caption>
				<b><h4 class="pull-left">Lista de Áreas de Conhecimento</h4></b>
			</caption>
			<thead>
				<tr>
					<th>#</th>
					<th>Título</th>
					<th>Descrição</th>
					<th>Operação</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${areasDeConhecimento}" var="areaDeConhecimento">
				<tr>
					<td>${areaDeConhecimento.codAreaDeConhecimento}</td>
					<td>${areaDeConhecimento.titulo}</td>
					<td></td>
					<td><a href="#${areaDeConhecimento.codAreaDeConhecimento}" role="button" class="btn"
						data-toggle="modal">Detalhar</a> <a
						href="alterar_area_de_conhecimento.html" role="button" class="btn">Alterar</a>
						<a href="#modalExcluir" role="button" class="btn"
						data-toggle="modal">Excluir</a></td>
				</tr>
			</c:forEach>
				
			</tbody>
		</table>
	</div>
</div>
<!-- Modal Excluir -->
<div id="modalExcluir" class="modal hide fade" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-header" style="">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3>Excluir Área de Conhecimento</h3>
	</div>
	<div class="modal-body">
		<p>Confirma a exclusão da área de conhecimento ?</p>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal" aria-hidden="true"
			style="">Sim</a> <a href="#" class="btn btn-primary"
			data-dismiss="modal" aria-hidden="true" style="">Não</a>
	</div>
</div>
<c:forEach items="${areasDeConhecimento}" var="areaDeConhecimento">
<!-- Modal Detalhar -->
<div id="${areaDeConhecimento.codAreaDeConhecimento}" class="modal hide fade" style="display: none;"
	aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">Detalhes da Área de Conhecimento</h3>
	</div>
	<div class="modal-body">
		<form class="form-horizontal" style="">
			<div class="control-group">
				<label class="control-label">Título</label>
				<div class="controls">
					<span class="input-xlarge uneditable-input">${areaDeConhecimento.titulo}</span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Descrição</label>
				<div class="controls">
					<span class="input-xlarge uneditable-input">${areaDeConhecimento.descricao}</span>
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn-primary" data-dismiss="modal"
			aria-hidden="true" style="">Fechar</a>
	</div>
</div>
</c:forEach>
<c:import url="../rodape.jsp" />