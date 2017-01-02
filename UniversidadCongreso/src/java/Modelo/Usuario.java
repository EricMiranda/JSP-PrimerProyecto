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
public class Usuario {
    private String acc;
    private String pass;

    public String getAcc() {
        return acc;
    }

    public void setAcc(String acc) {
        this.acc = acc;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Usuario() {
    }

    public Usuario(String acc, String pass) {
        this.acc = acc;
        this.pass = pass;
    }

    @Override
    public String toString() {
        return acc;
    }
    
}
