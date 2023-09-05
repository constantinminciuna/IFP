package it.betacom.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import it.betacom.bean.Corso;

public class CorsoDao {

	private Session session = null;
	
	public CorsoDao() {
		session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
	}
	
	public void close() {

		session.close();
		
	}
	
	public int save(Corso c){
		int status = 0;
		
		try{
			if(session != null) {
				Transaction tx = session.beginTransaction();
				
				session.save(c);
				
				tx.commit();
			}else System.err.println("Non è stata aperta la sessione.");
			
		}catch(Exception e){System.out.println(e);}
		
//		if(status == 1) log.info("Registrazione animale");
//		else log.info("Errore registrazione animale");
		
		return status;
	}
	
	public List<Corso> getAllRecords(){
		List<Corso> list = new ArrayList<Corso>();
		
		try{
			
			if(session != null) {
				Transaction tx = session.beginTransaction();
				
//				Query<Corso> query = session.createNamedQuery("findAll", Corso.class);
//				
//				list = query.getResultList();
				
				list = session.createQuery("FROM Corso", Corso.class).list();
				
				tx.commit();
			}else System.err.println("Non è stata aperta la sessione.");
			
		}catch(Exception e){System.out.println(e);}
		
		return list;
	}
	
	public Corso getCorsoById(long id) {
		Corso c = null;
		
		try{
			if(session != null) {
				Transaction tx = session.beginTransaction();
				
				c = session.load(Corso.class, id);
				
				tx.commit();
			}else System.err.println("Non è stata aperta la sessione.");
			
		}catch(Exception e){System.out.println(e);}
		
		
		return c;
	}
	
	public int update(Corso c){
		int status = 0;
		
		try{
			if(session != null) {
				Transaction tx = session.beginTransaction();
				
				session.update(c);
				
				tx.commit();
			}else System.err.println("Non è stata aperta la sessione.");
			
		}catch(Exception e){System.out.println(e);}
		
//		if(status == 1) log.info("Aggiornamento");
//		else log.info("Errore aggiornamento");
		
		return status;
	}
	
	public int delete(Corso c){
		int status = 0;
		
		try{
			if(session != null) {
				Transaction tx = session.beginTransaction();
				
				session.delete(c);
				
				tx.commit();
			}else System.err.println("Non è stata aperta la sessione.");
		}catch(Exception e){System.out.println(e);}

//		if(status == 1) log.info("Eliminazione animale");
//		else log.info("Errore eliminazione animale");
		
		return status;
	}
	
}
