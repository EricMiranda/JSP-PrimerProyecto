<%-- 
    Document   : ModificarCongreso
    Created on : 11-nov-2016, 19:55:09
    Author     : Cheto_2
--%>

<%@page import="dto.TotalViaticos"%>
<%@page import="Controlador.Conexion"%>
<%@page import="Modelo.Estado"%>
<%@page import="dto.CongresoEstado"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="ListadoModificarCongreso" scope="request" class="ArrayList<CongresoEstado>" />
<jsp:useBean id="Estados" scope="request" class="ArrayList<Estado>" />
<jsp:useBean id="ListaViaticos" scope="request" class="ArrayList<TotalViaticos>" />


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
                    <h1>Modificar Congresos</h1>
                </div>
                <c:forEach var="con" items="${ListadoModificarCongreso}">
                    <div class ="ListadoCongresosModif">
                        <table>
                            <tr>
                                <td>
                                    <p>Nombre:</p>
                                </td>
                                <td>
                                    <input type="text" name="txtNombre" value="${con.nombre}" readonly="readonly"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>Fecha Inicio:</p>
                                </td>
                                <td>
                                    <input type="date" name="txtNombre" value="${con.fechaInicio}" readonly="readonly"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>Estado:</p>
                                </td>
                                <td>
                                    <input type="text" name="txtNombre" value="${con.estado}" readonly="readonly"/>
                                </td>
                                <td>
                                    <form action="adminCongreso?estado=modificar" method="POST">
                                        <input type="hidden" name="txtIdCongreso" value="${con.id_congreso}" />
                                        <select name="cboNuevoEstado">
                                            <c:forEach var="e" items="${Estados}">
                                                <option value="${e.idEstado}">${e.estado}</option>
                                            </c:forEach>
                                        </select>
                                        <input type="submit" value="Modificar" />
                                    </form>
                                </td>
                            </tr>                        
                            <c:if test="${con.estado == 'Planificado'}">
                                <td>
                                    <p>Total Viaticos</p>
                                </td>
                                <td>
                                    <c:forEach var="v" items="${ListaViaticos}">
                                        <c:set var="viat" value="${v.idCongreso}" />
                                        <c:if test="${con.id_congreso == viat}">
                                            <input type="number" name="txtTotalViatico" value="${v.totalViaticos}" readonly="readonly"/>
                                        </c:if>
                                    </c:forEach>
                                </td>
                            </c:if>
                            <tr>
                                <td>
                                    <p>Descripcion:</p>
                                </td>
                                <td>
                                    <textarea class="descripcion" readonly="readonly" type="text" name="txtNombre" rows="4" cols="20">${con.descripcion}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>Precio Entrada:</p>
                                </td>
                                <td>
                                    <input type="text" name="txtNombre" value="${con.precioEntrada}" readonly="readonly"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${conectado != 'admin' || conectado == null}">
            <h1>No tiene Permiso de modificar Congresos</h1>
        </c:if>
    <scrip type="text/javascript">
        
    </scrip>
    </body>
</html>
