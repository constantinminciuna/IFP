package it.betacom.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import it.betacom.bean.Sede;

public class SedeDao {

	private Session session = null;
	
	public SedeDao() {
		session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
	}
	
	public void close() {
		session.close();
	}
	
	public int save(Sede s){
		int status = 0;
		
		try{
			if(session != null) {
				Transaction tx = session.beginTransaction();
				
				session.save(s);
				
				tx.commit();
			}else System.err.println("Non è stata aperta la sessione.");
			
		}catch(Exception e){System.out.println(e);}
		
//		if(status == 1) log.info("Registrazione animale");
//		else log.info("Errore registrazione animale");
		
		return status;
	}
	
	public List<Sede> getAllRecords(){
		List<Sede> list = new ArrayList<Sede>();
		
		try{
			
			if(session != null) {
				Transaction tx = session.beginTransaction();
				
//				Query<Sede> query = session.createNamedQuery("findAll",Sede.class);
//				
//				list = query.getResultList();
				
				list = session.createQuery("FROM Sede", Sede.class).list();
				
				tx.commit();
			}else System.err.println("Non è stata aperta la sessione.");
			
		}catch(Exception e){System.out.println(e);}
		
		return list;
	}
	
	public Sede getSedeById(long id) {
		Sede s = null;
		
		try{
			if(session != null) {
				Transaction tx = session.beginTransaction();
				
				s = session.load(Sede.class, id);
				
				tx.commit();
			}else System.err.println("Non è stata aperta la sessione.");
			
		}catch(Exception e){System.out.println(e);}
		
		
		return s;
	}
	
	public int update(Sede s){
		int status = 0;
		
		try{
			if(session != null) {
				Transaction tx = session.beginTransaction();
				
				session.update(s);
				
				tx.commit();
			}else System.err.println("Non è stata aperta la sessione.");
			
		}catch(Exception e){System.out.println(e);}
		
//		if(status == 1) log.info("Aggiornamento animale");
//		else log.info("Errore aggiornamento animale");
		
		return status;
	}
	
	public int delete(Sede s){
		int status = 0;
		
		try{
			if(session != null) {
				Transaction tx = session.beginTransaction();
				
				session.delete(s);
				
				tx.commit();
			}else System.err.println("Non è stata aperta la sessione.");
		}catch(Exception e){System.out.println(e);}

//		if(status == 1) log.info("Eliminazione animale");
//		else log.info("Errore eliminazione animale");
		
		return status;
	}
	
}
