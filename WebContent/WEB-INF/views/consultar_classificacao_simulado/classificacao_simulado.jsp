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
            <a href="#" ><i class="icon-home" ></i> Home</a>
            <span class="divider" >/</span> 
          </li>
          <li class="active" >Classifica��o Simulado Oficial</li>
        </ol>
    <table class="table table-hover table-bordered table-condensed table-striped" >
        <caption>
          <b><h4 class="pull-left" >Classifica��o do Simulado para ${simulado.titulo}  (<fmt:formatDate value="${simulado.dataDeRealizacao.time}"
						pattern="dd/MM/yyyy" />)</h4></b> 
        </caption>
        <thead>
          <tr>
            <th>Nome do Usu�rio</th>
            <th>Pontua��o</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultados}" var="resultado">
          <tr>
            <td>${resultado.usuario.nome}</td>
            <td>${resultado.notaDoSimulado}</td>
          </tr>
         </c:forEach>
        </tbody>
      </table>   
      </div>
    </div>
<c:import url="../rodape.jsp" />