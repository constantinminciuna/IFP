package it.betacom.service;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.NotFoundException;

import it.betacom.bean.Docente;
import it.betacom.dao.DocenteDao;

public class DocenteService {
	private DocenteDao docenteDao;
	private List<Docente> docenti = new ArrayList<Docente>();
	
	public DocenteService() {
		docenteDao = new DocenteDao();
	}
	
	public List<Docente> findAll(){
		
		if(docenti.size()==0) docenti = docenteDao.getAllRecords();
		
		return docenti;
	}
	
	public Docente fetchBy(long id) throws NotFoundException{
		
		Docente d = docenteDao.getDocenteById(id);
		
		if (d != null)
			return d;
		throw new NotFoundException("Resource not found with id: " + id);
	}
	
	public boolean create(Docente d) {
		
		int status = docenteDao.save(d);
		
		if(status == 1) return true;
		else return false;
	}
	
	public boolean update(Docente d) {
		
		int status = docenteDao.update(d);
		
		if(status == 1) return true;
		else return false;
	}
	
	public boolean delete(long id) {
		
		int status = docenteDao.delete(fetchBy(id));
		
		if(status == 1) return true;
		else return false;
	}
}
