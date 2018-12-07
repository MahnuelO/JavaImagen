package modelo.vo;

public class ReferenciaPersonal {
    private int id_referencia_personal;
    private String nombre;
    private String apellido;
    private String empresa_donde_labora;
    private String telefono;
    private String profesion;
    private String cargo_actual;
    private String correo;
    private int idPersona;

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public int getId_referencia_personal() {
        return id_referencia_personal;
    }

    public void setId_referencia_personal(int id_referencia_personal) {
        this.id_referencia_personal = id_referencia_personal;
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

    public String getEmpresa_donde_labora() {
        return empresa_donde_labora;
    }

    public void setEmpresa_donde_labora(String empresa_donde_labora) {
        this.empresa_donde_labora = empresa_donde_labora;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }

    public String getCargo_actual() {
        return cargo_actual;
    }

    public void setCargo_actual(String cargo_actual) {
        this.cargo_actual = cargo_actual;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
}
