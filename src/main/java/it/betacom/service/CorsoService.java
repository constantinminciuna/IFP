package it.betacom.service;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.NotFoundException;

import it.betacom.bean.Corso;
import it.betacom.dao.CorsoDao;

public class CorsoService {
	
	private CorsoDao corsoDao;
	private List<Corso> corsi = new ArrayList<Corso>();
	
	public CorsoService() {
		corsoDao = new CorsoDao();
	}
	
	public List<Corso> findAll(){
		
		if(corsi.size()==0) corsi = corsoDao.getAllRecords();
		
		return corsi;
	}
	
	public Corso fetchBy(long id) throws NotFoundException{
		
		Corso c = corsoDao.getCorsoById(id);
		
		if (c != null) {
			return c;
		}
		throw new NotFoundException("Resource not found with id: " + id);
	}
	
	public boolean create(Corso c) {
		
		int status = corsoDao.save(c);
		
		if(status == 1) return true;
		else return false;
	}
	
	public boolean update(Corso c) {
		
		int status = corsoDao.update(c);
		
		if(status == 1) return true;
		else return false;
	}
	
	public boolean delete(long id) {
		
		int status = corsoDao.delete(fetchBy(id));
		
		if(status == 1) return true;
		else return false;
	}
}
