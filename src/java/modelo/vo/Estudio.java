package modelo.vo;

import java.util.Date;

public class Estudio {
    
    private int id_estudio;
    private int id_titulo_obtenido;
    private int id_persona;
    private String institucion;
    private Date año;
    private String url_archivos_adjuntos;
    private int id_pais;
    //private int id_area;
    //private int id_modo_formacion;
    private int id_nivel_estudio;

    public int getId_estudio() {
        return id_estudio;
    }

    public void setId_estudio(int id_estudio) {
        this.id_estudio = id_estudio;
    }

    public int getId_titulo_obtenido() {
        return id_titulo_obtenido;
    }

    public void setId_titulo_obtenido(int id_titulo_obtenido) {
        this.id_titulo_obtenido = id_titulo_obtenido;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getInstitucion() {
        return institucion;
    }

    public void setInstitucion(String institucion) {
        this.institucion = institucion;
    }

    public Date getAño() {
        return año;
    }

    public void setAño(Date año) {
        this.año = año;
    }

    public String getUrl_archivos_adjuntos() {
        return url_archivos_adjuntos;
    }

    public void setUrl_archivos_adjuntos(String url_archivos_adjuntos) {
        this.url_archivos_adjuntos = url_archivos_adjuntos;
    }

    public int getId_pais() {
        return id_pais;
    }

    public void setId_pais(int id_pais) {
        this.id_pais = id_pais;
    }

//    public int getId_area() {
//        return id_area;
//    }

//    public void setId_area(int id_area) {
//        this.id_area = id_area;
//    }
//
//    public int getId_modo_formacion() {
//        return id_modo_formacion;
//    }
//
//    public void setId_modo_formacion(int id_modo_formacion) {
//        this.id_modo_formacion = id_modo_formacion;
//    }

    public int getId_nivel_estudio() {
        return id_nivel_estudio;
    }

    public void setId_nivel_estudio(int id_nivel_estudio) {
        this.id_nivel_estudio = id_nivel_estudio;
    }
    
}
