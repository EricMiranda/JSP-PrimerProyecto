/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Congreso;
import Modelo.Estado;
import Modelo.Paper;
import Modelo.Usuario;
import dto.CongresoEstado;
import dto.PaperCongreso;
import dto.TotalViaticos;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Conexion {
    private Connection con;
    private Statement st;
    private ResultSet rs;

    private void abrirConexion() {
        try {
            String userName = "Eric";
            String password = "";
            String url = "jdbc:sqlserver://127.0.0.1\\SQLEXPRESS;databasename=CongresoUniversidad";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            con = DriverManager.getConnection(url, userName, password);
            st = con.createStatement();
        } catch (Exception e) {
            System.out.println("Error en conexión ");
        }
    }
    
    private void Cerrar() {
        try {
            if(rs != null) rs.close();
            if(st != null) st.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error al cerrar conexión");
        }
    }
    
    public String login(Usuario usuario){
        String acc = "";
        try{
            abrirConexion();
            rs = st.executeQuery("select acc , pass from Usuarios where acc like '%"+usuario.getAcc()+"%'");
            if (rs != null) {
                rs.next();
                if ( usuario.getPass().compareTo(rs.getString("pass")) == 0){
                    acc =  usuario.getAcc();
                }
            }
        }
        catch(SQLException e){
            System.out.println("error: " + e.getMessage());
        }
        finally{
            Cerrar();
        }
        return acc;
    }
    
    public int calcularViaticosDePaper(int id){
        int totalViatico = 0;
        try {
            abrirConexion();
            rs = st.executeQuery("select cant_Autores_profesores *1000  + cant_Autores_Estudiantes * 800 + 3000 total from Papers where id_Paper = " + id);
            rs.next();
            totalViatico = rs.getInt("total");
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            Cerrar();
        }
        return totalViatico;
    }
    
    public boolean addCongreso(Congreso nuevo){
        boolean agregado = true;
        try {
            abrirConexion();
            String[] x = nuevo.getFechaInicio().split("-");
            String fecha = x[2] + "/" + x[1] + "/" + x[0] ;
            st.executeUpdate("insert into Congresos (nombre,fecha_Inicio,descripcion,precio_Entrada) values ('"+nuevo.getNombre()+"','"+fecha+"','"+nuevo.getDescripcion()+"',"+nuevo.getPrecioEntrada()+")");
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            agregado = false;
        }
        finally{
            Cerrar();
        }
        return agregado;
    }
    
    public int addPaper(Paper nuevo){
        int ultimoID = -1 ;
        try {
            abrirConexion();
            st.executeUpdate("insert into Papers values ("+nuevo.getCongreso()+",'"+nuevo.getUsuario()+"','"+nuevo.getTitulo()+"',"+nuevo.getCant_paginas()+",'"+nuevo.getNombreActorPrincipal()+"',"+nuevo.getCantidadActoresProfesores()+","+nuevo.getCantidadActoresEstudiantes()+")");
            rs = st.executeQuery("select @@IDENTITY id");
            rs.next();
            ultimoID = rs.getInt("id");
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            Cerrar();
        }
        return ultimoID;
    }
    
    public ArrayList<Congreso> getCongresosCBO(){
        ArrayList<Congreso> listaCongreso = new ArrayList<Congreso>();
        try {
            abrirConexion();
            rs = st.executeQuery("select id_Congreso, nombre from Congresos");
            while(rs.next()){
                Congreso congreso = new Congreso(rs.getInt("id_Congreso"), rs.getString("nombre"));
                listaCongreso.add(congreso);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            Cerrar();
        }
        return listaCongreso;
    }
    
    public ArrayList<CongresoEstado> getCongresos(){
        ArrayList<CongresoEstado> listaCongreso = new ArrayList<>();
        try {
            abrirConexion();
            rs = st.executeQuery("select id_Congreso,e.estado, nombre, convert(varchar(10), fecha_Inicio, 120)fecha, descripcion, precio_Entrada from Congresos c join Estados e on e.id_Estado=c.estado order by fecha desc");
            while(rs.next()){
                CongresoEstado congreso = new CongresoEstado(rs.getInt("id_Congreso"), rs.getString("estado"), rs.getString("nombre"), rs.getString("fecha"), rs.getString("descripcion"), rs.getFloat("precio_Entrada"));
                listaCongreso.add(congreso);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            Cerrar();
        }
        return listaCongreso;
    }
    
    public ArrayList<TotalViaticos> getTotalViaticos(){
        ArrayList<TotalViaticos> tv = new ArrayList<>();
        try {
            abrirConexion();
            rs = st.executeQuery("select congreso, sum(cant_Autores_profesores) *1000  + sum(cant_Autores_Estudiantes) * 800 + 3000 TotalViaticos\n" +
                                 "from Papers \n" +
                                 "group by congreso");
            while(rs.next()){
                TotalViaticos viatico = new TotalViaticos(rs.getInt("congreso") ,rs.getInt("totalViaticos"));
                tv.add(viatico);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            Cerrar();
        }
        return tv;
    }
    
    public ArrayList<Estado> getEstados(){
        ArrayList<Estado> listaCongreso = new ArrayList<>();
        try {
            abrirConexion();
            rs = st.executeQuery("select id_Estado, estado from Estados ");
            while(rs.next()){
                Estado estado = new Estado(rs.getInt("id_Estado"), rs.getString("estado"));
                listaCongreso.add(estado);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            Cerrar();
        }
        return listaCongreso;
    }
    
    public boolean modificarEstadoCongreso(int nuevoEstado,int idCongreso){
        boolean modificado = true;
        try {
            abrirConexion();
            st.executeUpdate("update Congresos set estado = " + nuevoEstado + " where id_Congreso = " + idCongreso);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            modificado = false;
        }
        finally{
            Cerrar();
        }
        return modificado;
    }
    
    
    //REPORTES
    
    public ArrayList<CongresoEstado> congresoMasConvodado(){
        ArrayList<CongresoEstado> listado = new ArrayList<>();
        try {
            abrirConexion();
            rs = st.executeQuery("select id_Congreso,e.estado, nombre, convert(varchar(10), fecha_Inicio, 120)fecha, descripcion, precio_Entrada from Congresos c join Estados e on e.id_Estado=c.estado where 1000 < (select sum(cant_paginas) from Papers where congreso = id_congreso)");
            while(rs.next()){
                CongresoEstado congreso = new CongresoEstado(rs.getInt("id_Congreso"), rs.getString("estado"), rs.getString("nombre"), rs.getString("fecha"), rs.getString("descripcion"), rs.getFloat("precio_Entrada"));
                listado.add(congreso);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            Cerrar();
        }
        return listado;
    }
    
    public ArrayList<CongresoEstado> convocatoria(){
        ArrayList<CongresoEstado> listado = new ArrayList<>();
        try {
            abrirConexion();
            rs = st.executeQuery("select id_Congreso,e.estado, nombre, convert(varchar(10), fecha_Inicio, 120)fecha, descripcion, precio_Entrada from Congresos c join Estados e on e.id_Estado=c.estado where c.estado != 3");
            while(rs.next()){
                CongresoEstado congreso = new CongresoEstado(rs.getInt("id_Congreso"), rs.getString("estado"), rs.getString("nombre"), rs.getString("fecha"), rs.getString("descripcion"), rs.getFloat("precio_Entrada"));
                listado.add(congreso);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            Cerrar();
        }
        return listado;
    }
    public PaperCongreso trabajoMasLargo(){
        PaperCongreso paper;
        try {
            abrirConexion();
            rs = st.executeQuery("select top 1 id_Paper, c.nombre, usuario, titulo, cant_paginas, nombre_Autor_Principal, cant_Autores_profesores, cant_Autores_Estudiantes from Papers p join Congresos c on p.congreso=c.id_Congreso order by cant_paginas desc");
            rs.next();
            paper = new PaperCongreso(rs.getInt("id_Paper"), rs.getString("nombre"), rs.getString("usuario"), rs.getString("titulo"), rs.getInt("cant_paginas"), rs.getString("nombre_Autor_Principal"), rs.getInt("cant_Autores_profesores"), rs.getInt("cant_Autores_Estudiantes"));
        } catch (SQLException ex) {
            paper = new PaperCongreso();
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            Cerrar();
        }
        return paper;
    }
    /***
     * Reporte
     * @return Devuelve Array Total VIaticos
     *          0 - Trabajos
     *          1 - Profesores
     *          2 - Estudiantes
     */
    public int[] totalViaticos(){
        int[] tviat = {0,0,0};
        try {
            abrirConexion();
            rs = st.executeQuery("select  sum(cant_Autores_profesores) *1000 profesores, sum(cant_Autores_Estudiantes) * 800 estudiantes,  sum(3000) trabajos from Papers ");
            rs.next();
            tviat[0] = rs.getInt("trabajos");
            tviat[1] = rs.getInt("profesores");
            tviat[2] = rs.getInt("estudiantes");
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            Cerrar();
        }
        return tviat;
    }
    
}
