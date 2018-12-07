/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.vo;

/**
 *
 * @author Aprendiz
 */
public class LugarResidencia {
    
    private int id_lugar_residencia;
    private int id_persona;
    private int id_ciudad;
    private String direccion;
    private String telefono;
    private String se_moveria;

    public int getId_lugar_residencia() {
        return id_lugar_residencia;
    }

    public void setId_lugar_residencia(int id_lugar_residencia) {
        this.id_lugar_residencia = id_lugar_residencia;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public int getId_ciudad() {
        return id_ciudad;
    }

    public void setId_ciudad(int id_ciudad) {
        this.id_ciudad = id_ciudad;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getSe_moveria() {
        return se_moveria;
    }

    public void setSe_moveria(String se_moveria) {
        this.se_moveria = se_moveria;
    }
    
    
    
}
