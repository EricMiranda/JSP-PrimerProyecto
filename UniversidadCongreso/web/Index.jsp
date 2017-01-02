<%-- 
    Document   : Index
    Created on : 05-nov-2016, 9:16:42
    Author     : Cheto_2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Congresos UTN</title>
        <link rel="shortcut icon" href="Imagenes/utnIcono.ico">
        <!-- Latest compiled and minified CSS -->
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link rel = "stylesheet" href="CSS/estilo.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    </head>
    <body>
        <c:set var="conectado" value="${sessionScope.usuario}" />
        
        <!-- TITULO -->
        <div id="divTitulo">
             <!-- CERRAR SESION -->
            <div id="CerrarSesion">
                <c:if test="${conectado != null}">
                <a href="adminUsuario">Cerrar Sesion</a>
                </c:if>
            </div>
            <h1>Congresos Universitarios</h1>
            <h4>UTN - Facultad Regional de Cordoba</h4>
        </div>
        
        
        <!-- DIV CENTRAL -->
        <div class="DivInicial" id="convocatoria">
            <div class="col-md-7">
                <p>Toda la informacion sobre los Congresos que siguen recibiendo Papers y los planificados</p>
            </div>
                <a class="btn btn-primary" href="adminCongreso?estado=convocatoria">Listado</a>
        </div>
        
        <!-- MENU LATERAL Y CONGRESO NUEVO -->
        <c:if test="${conectado != null}">
            <div class="Menu">
                    <c:if test="${conectado == 'admin'}">
                    <a href="AltaCongreso.jsp">Nuevo Congreso</a></br>
                    <a href="adminCongreso?estado=modif">Modificar Estado Congreso</a></br>
                    </c:if>

                    <!-- MENU LATERAL DE CONSULTAS -->
                    <ul>Consultas
                        <li><a href="adminCongreso?estado=listado">Listado Congresos</a></li>
                        <li><a href="adminCongreso?estado=masConvocantes">Congresos Mas convocantes</a></li>
                        <c:if test="${conectado == 'admin'}">
                        <li><a href="adminCongreso?estado=totalViaticos">Total Viaticos</a></li>
                        </c:if>
                        <li><a href="adminCongreso?estado=trabajoMasLargo">Trabajo mas largo</a></li>
                    </ul>
            </div>
        </c:if>
        <!-- DIV CENTRAL -->
        
        <div id="degradado">
            <c:if test="${conectado == null}">
            <div class="DivInicial" id="login">
                <div class="col-md-7">
                    <p>Iniciar Sesion/Registrar para subir un algun Paper al congreso</p>
                </div>
                <a class="btn btn-primary" href="Login.jsp">Iniciar Sesion</a>
            </div>
        </c:if>
        <c:if test="${conectado != null}">
             <div class="DivInicial" id="login">
                <div class="col-md-7">
                    <p>Aqui podra agregar un nuevo paper y bla bla bla blaa.... </p>
                </div>
                <a class="btn btn-primary" href="adminPaper?estado=cargarLista">Agregar paper</a></br>
            </div>
        </c:if>
        </div>
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
