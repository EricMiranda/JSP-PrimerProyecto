<%-- 
    Document   : AltaCongreso
    Created on : 10-nov-2016, 19:18:09
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
        <c:if test="${conectado == 'admin'}">
            <div class="container contenedorNuevoPaper">
                <div class="row" id="congresoTitulo">
                    <h1>NUEVO CONGRESO</h1>
                </div>
                <div class="row formularioNewPaper" >
                    <form action="adminCongreso" method="POST">
                        <input type="hidden" name="estado" value="insert" />
                        <table>
                            <tr>
                                <td>
                                    <p>Nombre:</p>
                                </td>
                                <td>
                                    <input type="text" name="txtNombre"   id="nombre" required/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>Fecha inicio:</p>
                                </td>
                                <td>
                                    <input type="date" name="fechaInicio" id="fecha" required/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>Descripcion:</p>
                                </td>
                                <td>
                                    <textarea id="descripcion" class="descripcion" name="txtDescripcion" maxlength="200" rows="4" cols="20" required></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>Precio:</p>
                                </td>
                                <td>
                                    <input type="number" name="txtPrecio" value="" onkeypress="return soloNumeros(event)" required />
                                </td>
                            </tr>
                        </table>
                        <div class="btnCongreso">
                            <a class="btn btn-danger" href="Index.jsp"> Cancelar </a>
                            <input class="btn btn-success" type="submit" value="Agregar" id="btnAltaCongreso" />
                        </div>
                    </form>
                </div>
            </div>
        </c:if>
        <c:if test="${conectado != 'admin' || conectado == null}">
            <div class="anuncioError">
                <h1>Debe ser administrador para cargar un congreso</h1>
            </div>
        </c:if>
    </body>
    <script type="text/javascript">
            fechaDeHoy("fecha");
        </script>
</html>
