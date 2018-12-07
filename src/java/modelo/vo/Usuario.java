package modelo.vo;

import java.util.Date;

public class Usuario {
    
    private int id_usuario;
    private int id_rol;
    private int id_pregunta_seguridad;
    private int id_tipo_documento_identidad;
    private String numero_identificacion;
    private String clave;
    private String respuesta;
    private String correo;
    private Date fecha_nacimiento;
    private double codigoval;
    private int codigo_editar;

    
    
    
   

    public int getCodigo_editar() {
        return codigo_editar;
    }

    public void setCodigo_editar(int codigo_editar) {
        this.codigo_editar = codigo_editar;
    }
 
    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public int getId_pregunta_seguridad() {
        return id_pregunta_seguridad;
    }

    public void setId_pregunta_seguridad(int id_pregunta_seguridad) {
        this.id_pregunta_seguridad = id_pregunta_seguridad;
    }

    public int getId_tipo_documento_identidad() {
        return id_tipo_documento_identidad;
    }

    public void setId_tipo_documento_identidad(int id_tipo_documento_identidad) {
        this.id_tipo_documento_identidad = id_tipo_documento_identidad;
    }

    public String getNumero_identificacion() {
        return numero_identificacion;
    }

    public void setNumero_identificacion(String numero_identificacion) {
        this.numero_identificacion = numero_identificacion;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }
    
    public double getCodigoval() {
        return codigoval;
    }

    public void setCodigoval(double codigoval) {
        this.codigoval = codigoval;
    }
   
 
    
}
