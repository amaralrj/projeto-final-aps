<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../cabecalho.jsp" />
<c:import url="../menu.jsp" />
<div class="container-fluid" >
        <div class="row-fluid" >
          <div class="pull-left span4" >
            <ul class="nav  nav-pills nav-stacked" ></ul>
          </div>
        </div>
      </div>
    </div>
    <div class="row" >
      <div class="span1" >
        <a> </a> 
      </div>
      <div class="span11" >
        <ol class="breadcrumb" >
                  <li>
            <a href="areaAdmin"><i class="icon-home" ></i> Home</a>
            <span class="divider" >/</span> 
          </li>
          <li>
            <a href="areaAdmin" >Área de Administração</a>
            <span class="divider" >/</span> 
          </li>
          <li class="active" >Incluir Área de Conhecimento</li>
        </ol>
        <form class="form-signin form-horizontal" >
          <fieldset>
            <legend>Incluir Área de Conhecimento</legend>
            <!-- Text input-->
            <div class="control-group" >
              <label class="control-label" >*Título</label>
              <div class="controls" >
                <input id="tituloac" name="tituloac" type="text" placeholder="Título da Área de Conhecimento" class="input-xlarge" required="" data-errormessage-value-missing="Campo obrigatório não preenchido." value="" /> 
              </div>
            </div>
            <!-- Text input-->
            <div class="control-group" >
              <label class="control-label" >*Descrição</label>
              <div class="controls" >
                <input id="descac" name="descac" type="text" placeholder="Descrição da Área de Conhecimento" class="input-xlarge" required="" data-errormessage-value-missing="Campo obrigatório não preenchido." value="" /> 
              </div>
            </div>
            <div class="control-group" >
              <div class="controls" >
              <label class="control-label" >* Campos obrigatórios</label>
              <div>
            </div>                        
          </fieldset>
          <div class="form-actions" >
            <button type="submit" class="btn btn-primary" >Incluir</button>
          </div>
        </form>
      </div>
    </div>
  
<c:import url="../rodape.jsp" />