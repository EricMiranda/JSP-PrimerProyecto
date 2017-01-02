<%-- 
    Document   : ListadoCongresos
    Created on : 11-nov-2016, 23:19:25
    Author     : Cheto_2
--%>

<%@page import="Modelo.Estado"%>
<%@page import="dto.CongresoEstado"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="ListadoModificarCongreso" scope="request" class="ArrayList<CongresoEstado>" />



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
                <h1>Listado de Congresos</h1>
            </div>
            <c:forEach var="con" items="${ListadoModificarCongreso}">
                <div class ="ListadoCongresos">
                    <table>
                        <tr>
                            <h2><u>${con.nombre}</u></h2>
                        </tr>
                        <tr>
                            <td>
                                <p>Fecha Inicio:</p>
                            </td>
                            <td>
                                <input readonly="readonly" type="date" name="txtNombre" value="${con.fechaInicio}" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Estado:</p>
                            </td>
                            <td>
                                <input readonly="readonly" type="text" name="txtNombre" value="${con.estado}" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Descripcion:</p>
                            </td>
                            <td>
                                <textarea class="descripcion"  readonly="readonly" name="txtDescripcion" maxlength="200" rows="4" cols="20">${con.descripcion}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Precio Entrada:</p>
                            </td>
                            <td>
                                <input readonly="readonly" type="text" name="txtNombre" value="${con.precioEntrada}" />
                            </td>
                        </tr>
                    </table>
                </div>
            </c:forEach>
        </div>
        <a id="btnVolver" href="Index.jsp"> Volver... </a>
        </c:if>
        <c:if test="${conectado == null}">
            <div class="anuncioError">
                <h1>Debe registrarse para ingresar a este sitio</h1>
            </div>
        </c:if>
    </body>
</html>