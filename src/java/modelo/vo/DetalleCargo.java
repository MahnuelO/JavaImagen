package modelo.vo;

public class DetalleCargo {
    
    private int id_detalle_cargo;
    private String descripcion;
    private int id_cargo;

    public int getId_detalle_cargo() {
        return id_detalle_cargo;
    }

    public void setId_detalle_cargo(int id_detalle_cargo) {
        this.id_detalle_cargo = id_detalle_cargo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_cargo() {
        return id_cargo;
    }

    public void setId_cargo(int id_cargo) {
        this.id_cargo = id_cargo;
    }
    
}
