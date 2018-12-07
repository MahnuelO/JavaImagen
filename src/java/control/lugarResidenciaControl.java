/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.sql.Connection;
import modelo.dao.LugarResidenciaDAO;
import modelo.vo.LugarResidencia;
import utils.AppException;

/**
 *
 * @author Aprendiz
 */
public class lugarResidenciaControl {
        Connection cnn;
        LugarResidenciaDAO dao;
    
    public lugarResidenciaControl(Connection cnn){
        this.cnn = cnn;
        this.dao = new LugarResidenciaDAO(cnn);
    }
    
     public void  insertar(LugarResidencia vo) throws AppException{
        try {
            if (vo.getId_lugar_residencia()== 0) {
                throw new AppException("Campos estan nulo");
            }
            dao.insertar(vo);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }
    
}
