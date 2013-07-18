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
			<li class="active">Alterar Área de Conhecimento</li>
		</ol>
		<form:errors path="*" />
		<form class="form-signin form-horizontal" action="alteraAreaDeConhecimento" method="post">
			<fieldset>
				<legend>Alterar Área de Conhecimento</legend>
				<c:if test="${sucesso eq 1}">
					<div class="alert alert-success">Cadastro alterado com
						sucesso!</div>
				</c:if>
				<!-- Text input-->
				<input type="hidden" name="codAreaDeConhecimento" value="${areaDeConhecimento.codAreaDeConhecimento}">
				<div class="control-group">
					<label class="control-label">*Título</label>
					<div class="controls">
						<input id="titulo" name="titulo" type="text"
							placeholder="Título da Área de Conhecimento" class="input-xlarge"
							value="${areaDeConhecimento.titulo}" />
							<form:errors path="areaDeConhecimento.titulo" class="text-error" />
					</div>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Descrição</label>
					<div class="controls">
						<input id="descricao" name="descricao" type="text"
							placeholder="Descrição da Área de Conhecimento"
							class="input-xlarge" value="${areaDeConhecimento.descricao}" />
							<form:errors path="areaDeConhecimento.descricao" class="text-error" />
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<label class="control-label">* Campos obrigatórios</label>
						<div></div>
			</fieldset>
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">Alterar</button>
				<a href="#" class="btn" data-dismiss="modal" aria-hidden="true">Voltar</a>
			</div>
		</form>
	</div>
</div>
<c:import url="../rodape.jsp" />