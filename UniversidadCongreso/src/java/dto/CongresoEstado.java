/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Cheto_2
 */
public class CongresoEstado {
    private int id_congreso;
    private String estado;
    private String nombre;
    private String fechaInicio;
    private String descripcion;
    private float precioEntrada;
    
    public int getId_congreso() {
        return id_congreso;
    }

    public void setId_congreso(int id_congreso) {
        this.id_congreso = id_congreso;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getPrecioEntrada() {
        return precioEntrada;
    }

    public void setPrecioEntrada(float precioEntrada) {
        this.precioEntrada = precioEntrada;
    }

    public CongresoEstado() {
    }

    public CongresoEstado(int id_congreso, String estado, String nombre, String fechaInicio, String descripcion, float precioEntrada) {
        this.id_congreso = id_congreso;
        this.estado = estado;
        this.nombre = nombre;
        this.fechaInicio = fechaInicio;
        this.descripcion = descripcion;
        this.precioEntrada = precioEntrada;
    }

   

}
