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
public class TotalViaticos {
    private int idCongreso;
    private int totalViaticos;

    public int getIdCongreso() {
        return idCongreso;
    }

    public void setIdCongreso(int idCongreso) {
        this.idCongreso = idCongreso;
    }

    public int getTotalViaticos() {
        return totalViaticos;
    }

    public void setTotalViaticos(int totalViaticos) {
        this.totalViaticos = totalViaticos;
    }

    public TotalViaticos() {
    }

    public TotalViaticos(int idCongreso, int totalViaticos) {
        this.idCongreso = idCongreso;
        this.totalViaticos = totalViaticos;
    }
    
    
}
