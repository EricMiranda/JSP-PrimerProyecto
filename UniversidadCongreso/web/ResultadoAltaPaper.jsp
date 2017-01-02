<%-- 
    Document   : ResultadoAltaPaper
    Created on : 16-nov-2016, 2:10:16
    Author     : Cheto_2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="agregado" scope="request" class="String" />
<jsp:useBean id="total" scope="request" class="Integer" />
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
        <script src="JS/Validaciones.js"></script>
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
        <div class="resultadoAlta">
            <p>${agregado}</p>
            <p>Total a Recibir: $ ${total}</p>
            <a class="btn btn-info" href="Index.jsp"> Volver</a>
        </div>
    </body>
</html>
