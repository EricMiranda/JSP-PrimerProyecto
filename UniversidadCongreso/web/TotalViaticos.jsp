<%-- 
    Document   : TotalViaticos
    Created on : 13-nov-2016, 19:20:48
    Author     : Cheto_2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="reporteTotalViat" scope="request" class="int[]" />

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
        <c:if test="${conectado == 'admin'}">
            <div class="container">
                <div class="row ReporteTitulo">
                    <h1>Total Viaticos</h1>
                </div>
                <div class ="ListadoCongresos" id="totalViaticos">
                    <p>Trabajos: $ ${reporteTotalViat[0]}</p>
                    <p>Profesores: $ ${reporteTotalViat[1]}</p>
                    <p>Estudiantes: $ ${reporteTotalViat[2]}</p>
                </div>
            </div>
        </c:if>
        <a id="btnVolver" href="Index.jsp"> Volver... </a>
        <c:if test="${conectado != 'admin' || conectado == null}">
            <div class="anuncioError">
                <h1>No tiene permisos para ver la informacion</h1>
            </div>
        </c:if>
    </body>
</html>
