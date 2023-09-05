package it.betacom.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import it.betacom.bean.Docente;

public class DocenteDao {

	private Session session = null;
	
	public DocenteDao() {
		session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
	}
	
	public void close() {
		session.close();
		
	}
	
	public int save(Docente d){
		int status = 0;
		
		try{
			if(session != null) {
				Transaction tx = session.beginTransaction();
				
				session.save(d);
				
				tx.commit();
			}else System.err.println("Non è stata aperta la sessione.");
			
		}catch(Exception e){System.out.println(e);}
		
//		if(status == 1) log.info("Registrazione animale");
//		else log.info("Errore registrazione animale");
		
		return status;
	}
	
	public List<Docente> getAllRecords(){
		List<Docente> list = new ArrayList<Docente>();
		
		try{
			
			if(session != null) {
				Transaction tx = session.beginTransaction();
				
//				Query<Docente> query = session.createNamedQuery("findAll", Docente.class);
//				list = query.getResultList();
				
				list = session.createQuery("FROM Docente", Docente.class).list();
				
				tx.commit();
			}else System.err.println("Non è stata aperta la sessione.");
			
		}catch(Exception e){System.out.println(e);}
		
		return list;
	}
	
	public Docente getDocenteById(long id) {
		Docente d = null;
		
		try{
			if(session != null) {
				Transaction tx = session.beginTransaction();
				
				d = session.load(Docente.class, id);
				
				tx.commit();
			}else System.err.println("Non è stata aperta la sessione.");
			
		}catch(Exception e){System.out.println(e);}
		
		
		return d;
	}
	
	public int update(Docente d){
		int status = 0;
		
		try{
			if(session != null) {
				Transaction tx = session.beginTransaction();
				
				session.update(d);
				
				tx.commit();
			}else System.err.println("Non è stata aperta la sessione.");
			
		}catch(Exception e){System.out.println(e);}
		
//		if(status == 1) log.info("Aggiornamento animale");
//		else log.info("Errore aggiornamento animale");
		
		return status;
	}
	
	public int delete(Docente d){
		int status = 0;
		
		try{
			if(session != null) {
				Transaction tx = session.beginTransaction();
				
				session.delete(d);
				
				tx.commit();
			}else System.err.println("Non è stata aperta la sessione.");
		}catch(Exception e){System.out.println(e);}

//		if(status == 1) log.info("Eliminazione animale");
//		else log.info("Errore eliminazione animale");
		
		return status;
	}
	
}
