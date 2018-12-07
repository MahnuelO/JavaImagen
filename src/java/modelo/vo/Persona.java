package modelo.vo;

import java.util.Date;

public class Persona {

    private int id_persona;
    private int id_usuario;
    private int id_ciudad;
    private String nombre;
    private String apellido;
    private String direccion;
    private Date fecha_expedicion;
    private String estado_civil;
    private String perfil;
    private int id_categoria_licencia_conduccion;
    private String genero;
    private String se_moveria;
    private String telefono;
    private String numero_libreta_militar;
    private String libreta_militar;
    private int id_pais;
    
    private byte[] foto;

     public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }
    public String getEstado_civil() {
        return estado_civil;
    }

    public void setEstado_civil(String estado_civil) {
        this.estado_civil = estado_civil;
    }

    public int getId_pais() {
        return id_pais;
    }

    public void setId_pais(int id_pais) {
        this.id_pais = id_pais;
    }

    
    
    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_ciudad() {
        return id_ciudad;
    }

    public void setId_ciudad(int id_ciudad) {
        this.id_ciudad = id_ciudad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }


    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNumero_libreta_militar() {
        return numero_libreta_militar;
    }

    public void setNumero_libreta_militar(String numero_libreta_militar) {
        this.numero_libreta_militar = numero_libreta_militar;
    }

    public Date getFecha_expedicion() {
        return fecha_expedicion;
    }

    public void setFecha_expedicion(Date fecha_expedicion) {
        this.fecha_expedicion = fecha_expedicion;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public int getId_categoria_licencia_conduccion() {
        return id_categoria_licencia_conduccion;
    }

    public void setId_categoria_licencia_conduccion(int id_categoria_licencia_conduccion) {
        this.id_categoria_licencia_conduccion = id_categoria_licencia_conduccion;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getSe_moveria() {
        return se_moveria;
    }

    public void setSe_moveria(String se_moveria) {
        this.se_moveria = se_moveria;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }


    public String getLibreta_militar() {
        return libreta_militar;
    }

    public void setLibreta_militar(String libreta_militar) {
        this.libreta_militar = libreta_militar;
    }

}
