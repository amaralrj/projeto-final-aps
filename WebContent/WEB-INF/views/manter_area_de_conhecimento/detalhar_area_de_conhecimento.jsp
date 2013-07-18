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
			<li><a href="areaAdmin"><i class="icon-home"></i> Home</a> <span
				class="divider">/</span></li>
			<li><a href="areaAdmin">Área de Administração</a> <span
				class="divider">/</span></li>
			<li class="active">Detalhes Área de Conhecimento</li>
		</ol>
			<fieldset>
				<legend>Detalhes Área de Conhecimento</legend>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Título</label>
					<div class="controls">
						${titulo} 
					</div>
				</div>
				<!-- Text input-->
				<div class="control-group">
					<label class="control-label">*Descrição</label>
					<div class="controls">
						${descricao} 
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div></div>
			</fieldset>
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">Voltar</button>
			</div>
		</form>
	</div>
</div>
<c:import url="../rodape.jsp" />