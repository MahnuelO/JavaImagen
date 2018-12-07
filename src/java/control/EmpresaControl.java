/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.sql.Connection;
import modelo.dao.EmpresaDAO;
import modelo.vo.Empresa;

import utils.AppException;

/**
 *
 * @author NATALIA
 */
public class EmpresaControl {
     Connection cnn;
     EmpresaDAO dao;

    public EmpresaControl(Connection cnn) {
        this.cnn = cnn;
        dao = new EmpresaDAO(cnn);

    }
     public void insert(Empresa vo) throws AppException {
        try {
            if (vo.getIdSectorEconomico()== 0) {
                throw new AppException("Campos incompletos");
            }
            dao.insert(vo);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }
      public Empresa buscarId(int id) throws AppException{
        try {
            return dao.buscarId(id);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }
}
