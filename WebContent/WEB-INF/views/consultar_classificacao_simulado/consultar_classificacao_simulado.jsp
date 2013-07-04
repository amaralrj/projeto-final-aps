<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="../cabecalho.jsp" />
<c:import url="../menu.jsp" />
<div class="container-fluid" >
        <div class="row-fluid" >
          <div class="pull-left span1" >
            <ul class="nav  nav-pills nav-stacked" ></ul>
          </div>
          <div class="pull-left span7" >
            <div class="row-fluid" >
              <div class="span4" >
                <p></p>
              </div>
            </div>
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
            <a href="<c:url value="/"/>" ><i class="icon-home" ></i> Home</a>
            <span class="divider" >/</span> 
          </li>
          <li class="active" >Consulta Classificação Simulado Oficial</li>
        </ol>
    <table class="table table-hover table-bordered table-condensed table-striped" >
        <caption>
          <b><h4 class="pull-left" >Lista de Simulados Oficiais Realizados</h4></b> 
        </caption>
        <thead>
          <tr>
            <th>#</th>
            <th>Título</th>
            <th>Data de Realização</th>
            <th>Operação</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${simulados}" var="simulado">
          <tr>
            <td>${simulado.codSimulado}</td>
            <td>${simulado.titulo}</td>
            <td><fmt:formatDate value="${simulado.dataDeRealizacao.time}"
						pattern="dd/MM/yyyy" /></td>
            <td>
              <a href="classificacaoSimulado?codSimulado=${simulado.codSimulado}" role="button" class="btn" >Consultar Classificação</a>
            </td>
          </tr>
          </c:forEach>
          
        </tbody>
      </table>   
      </div>
    </div>
<c:import url="../rodape.jsp" />