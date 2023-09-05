package it.betacom.service;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.NotFoundException;

import it.betacom.bean.Sede;
import it.betacom.dao.SedeDao;

public class SedeService {
	private SedeDao sedeDao;
	private List<Sede> sedi = new ArrayList<Sede>();
	
	public SedeService() {
		sedeDao = new SedeDao();
	}
	
	public List<Sede> findAll(){
		
		if(sedi.size()==0) sedi = sedeDao.getAllRecords();
		
		return sedi;
	}
	
	public Sede fetchBy(long id) throws NotFoundException{
		
		Sede s = sedeDao.getSedeById(id);
		
		if (s != null)
			return s;
		throw new NotFoundException("Resource not found with id: " + id);
	}
	
	public boolean create(Sede s) {
		
		int status = sedeDao.save(s);
		
		if(status == 1) return true;
		else return false;
	}
	
	public boolean update(Sede s) {
		
		int status = sedeDao.update(s);
		
		if(status == 1) return true;
		else return false;
	}
	
	public boolean delete(long id) {
		
		int status = sedeDao.delete(fetchBy(id));
		
		if(status == 1) return true;
		else return false;
	}
}
