<%-- 
    Document   : TrabajoMasLargo
    Created on : 12-nov-2016, 2:53:09
    Author     : Cheto_2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="TrabajoMasLargo" scope="request" class="dto.PaperCongreso" />
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
        <c:if test="${conectado != null}">
            <div class="container">
                <div class="row ReporteTitulo">
                    <h1>Trabajo más largo</h1>
                </div>
                <div class ="ListadoCongresos" id="congresoMasLargo">
                        <table>
                            <tr>
                            <h2><u>${TrabajoMasLargo.titulo}</u></h2>
                            </tr>
                            <tr>
                                <td>
                                    <p>Congreso:</p>
                                </td>
                                <td>
                                    <input type="text" name="txtNombre" value="${TrabajoMasLargo.congreso}" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>Usuario:</p>
                                </td>
                                <td>
                                    <input type="text" name="txtNombre" value="${TrabajoMasLargo.usuario}" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>Cantidad Paginas:</p>
                                </td>
                                <td>
                                    <input type="number" name="txtNombre" value="${TrabajoMasLargo.cant_paginas}" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>Nombre Autor:</p>
                                </td>
                                <td>
                                    <input type="text" name="txtNombre" value="${TrabajoMasLargo.nombreActorPrincipal}" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>Cantidad Autores Profesores</p>
                                </td>
                                <td>
                                    <input type="number" name="txtNombre" value="${TrabajoMasLargo.cantidadActoresProfesores}" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>Cantidad Autores Estudiantes</p>
                                </td>
                                <td>
                                    <input type="number" name="txtNombre" value="${TrabajoMasLargo.cantidadActoresEstudiantes}" />
                                </td>
                            </tr>
                        </table>
                    </div>
            </div>
        </c:if>
        <a id="btnVolver" href="Index.jsp"> Volver... </a>
        <c:if test="${conectado == null}">
            <div class="anuncioError">
                <h1>Debe registrarse para ver la informacion</h1>
            </div>
        </c:if>
    </body>
</html>
