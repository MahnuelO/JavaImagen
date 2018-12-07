package modelo.vo;

import java.util.Date;

public class ExperienciaLaboral {

    private int id_experienca_laboral;
    private int id_persona;
    private String nombre;
    private String telefono;
    private String direccion;
    private String url_archivo_adjunto;
    private Date fecha_inicio;
    private Date fecha_fin;
    private String correo;
    private String comentario;
    private String nit;

    public int getId_experienca_laboral() {
        return id_experienca_laboral;
    }

    public void setId_experienca_laboral(int id_experienca_laboral) {
        this.id_experienca_laboral = id_experienca_laboral;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getUrl_archivo_adjunto() {
        return url_archivo_adjunto;
    }

    public void setUrl_archivo_adjunto(String url_archivo_adjunto) {
        this.url_archivo_adjunto = url_archivo_adjunto;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public Date getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(Date fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

}


