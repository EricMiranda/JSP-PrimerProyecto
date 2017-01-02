/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Cheto_2
 */
public class Paper {
    private int id_paper;
    private int congreso;
    private String usuario;
    private String titulo;
    private int cant_paginas;
    private String nombreActorPrincipal;
    private int cantidadActoresProfesores;
    private int cantidadActoresEstudiantes;
    

    public int getId_paper() {
        return id_paper;
    }

    public void setId_paper(int id_paper) {
        this.id_paper = id_paper;
    }

    public int getCongreso() {
        return congreso;
    }

    public void setCongreso(int congreso) {
        this.congreso = congreso;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getCant_paginas() {
        return cant_paginas;
    }

    public void setCant_paginas(int cant_paginas) {
        this.cant_paginas = cant_paginas;
    }

    public String getNombreActorPrincipal() {
        return nombreActorPrincipal;
    }

    public void setNombreActorPrincipal(String nombreActorPrincipal) {
        this.nombreActorPrincipal = nombreActorPrincipal;
    }

    public int getCantidadActoresProfesores() {
        return cantidadActoresProfesores;
    }

    public void setCantidadActoresProfesores(int cantidadActoresProfesores) {
        this.cantidadActoresProfesores = cantidadActoresProfesores;
    }

    public int getCantidadActoresEstudiantes() {
        return cantidadActoresEstudiantes;
    }

    public void setCantidadActoresEstudiantes(int cantidadActoresEstudiantes) {
        this.cantidadActoresEstudiantes = cantidadActoresEstudiantes;
    }

    public Paper() {
    }

    public Paper(int id_paper, int congreso, String usuario, String titulo, int cant_paginas, String nombreActorPrincipal, int cantidadActoresProfesores, int cantidadActoresEstudiantes) {
        this.id_paper = id_paper;
        this.congreso = congreso;
        this.usuario = usuario;
        this.titulo = titulo;
        this.cant_paginas = cant_paginas;
        this.nombreActorPrincipal = nombreActorPrincipal;
        this.cantidadActoresProfesores = cantidadActoresProfesores;
        this.cantidadActoresEstudiantes = cantidadActoresEstudiantes;
    }

    @Override
    public String toString() {
        return "Congreso{" + "congreso=" + congreso + ", titulo=" + titulo + ", cant_paginas=" + cant_paginas + ", nombreActorPrincipal=" + nombreActorPrincipal + '}';
    }
}
