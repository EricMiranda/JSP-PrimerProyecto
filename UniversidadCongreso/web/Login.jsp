<%-- 
    Document   : Login
    Created on : 07-nov-2016, 20:14:45
    Author     : Cheto_2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- TITULO -->
        <div id="divTitulo">
            <h1>Congresos Universitarios</h1>
            <h4>UTN - Facultad Regional de Cordoba</h4>
        </div>
              
        <div class="container">
            <div class="row" id="loginTitulo">
                <h1>Iniciar Sesion</h1>
            </div>
            <div class="col-md-4">
            </div>
            <div class="row">
                <div class="formularioLogin">
                    <form action="adminUsuario" method="POST">
                        <table>
                            <tr>
                                <td>
                                    <p>Nombre de Usuario:</p>
                                </td>
                                <td>
                                    <input type="text" name="txtAcc" value="" autofocus/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>Contraña:</p>
                                </td>
                                <td>
                                    <input type="password" name="txtPass" value="" />
                                </td>
                            </tr>
                        </table>
                        <div class="btnFormulario">
                            <a class="btn btn-danger" href="Index.jsp"> Cancelar </a>
                            <input type="submit" class="btn btn-success" value="Iniciar Sesion" name="btnIngresar" />
                        </div>
                    </form>
                    <a id="registrarse" href="#">No tiene una cuenta?? <u>REGISTRATE</u></a>
                </div>
            </div>
        </div>
        
    </body>
</html>
