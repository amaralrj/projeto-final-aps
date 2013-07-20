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
              <a href="home.html" ><i class="icon-home" ></i> Home</a>
              <span class="divider" >/</span> 
            </li>
            <li>
			  <a href="area_usuario.html" >Área do Usuário</a>
			  <span class="divider" >/</span> 
			</li>            
          <li class="active" >Efetuar inscrição em Simulado</li>
        </ol>
        <div class="alert alert-success">Inscrição no <b>${simulado.titulo}</b> realizado com sucesso!</div>  
      </div>
    </div>
  <c:import url="../rodape.jsp" />