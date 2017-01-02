<%-- 
    Document   : AltaPaper
    Created on : 11-nov-2016, 14:02:22
    Author     : Cheto_2
--%>

<%@page import="Modelo.Congreso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.Conexion"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="listaCongresos" scope="request" class="ArrayList<Congreso>" />

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
        <c:if test="${conectado != null}">
            <div class="container contenedorNuevoPaper" >
                <div class="row" id="paperTitulo">
                    <h1>Nuevo Paper</h1>
                </div>
                <div class="col-md-4">
                </div>
                <div class="row">
                    <div class="formularioNewPaper">
                        <form action="adminPaper" method="POST">
                            <input type="hidden" name="txtUsuario" value="${conectado}" />
                            <table>
                                <tr class="fila">
                                    <td>
                                        <p>Congreso:</p>
                                    </td>
                                    <td>
                                        <select name="cboCongreso" autofocus>
                                            <c:forEach var="con" items="${listaCongresos}">
                                                <option value="${ con.id_congreso}"> ${ con.nombre} </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>Titulo:</p>
                                    </td>
                                    <td>
                                        <input type="text" name="txtTitulo" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>Cantidad de Paginas: </p>
                                    </td>
                                    <td>
                                        <input type="number" name="txtCantPag" value="" onkeypress="return soloNumeros(event)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>Nombre Autor: </p>
                                    </td>
                                    <td>
                                        <input type="text" name="txtNombreAutor" value="" onkeypress="return val(event)"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>Cantidad Autores Profesores</p>
                                    </td>
                                    <td>
                                        <input type="number" name="txtCantAutoresProfesores" value="" min="0" max="100" onkeypress="return soloNumeros(event)"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>Cantidad Autores Estudiantes: </p>
                                    </td>
                                    <td>
                                        <input type="number" name="txtCantAutoresEstudiantes" value="" min="0" max="100"  onkeypress="return soloNumeros(event)"/>
                                    </td>
                                </tr>
                            </table>
                            <div class="btnNewPaper">
                                <a class="btn btn-danger" href="Index.jsp"> Cancelar </a>
                                <input class="btn btn-success" type="submit" value="Enviar" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${conectado == null}">
            <div class="anuncioError">
                <h1>Debe registrarse para subir un Paper</h1>
            </div>
        </c:if>
    </body>
</html>
