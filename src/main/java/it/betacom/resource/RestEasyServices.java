package it.betacom.resource;

import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

@ApplicationPath("/restapi")
public class RestEasyServices extends Application{
	
	private Set<Object> singletons = new HashSet<Object>();
	
	public RestEasyServices() {
		singletons.add(new CorsoResource());
		singletons.add(new DocenteResource());
		singletons.add(new SedeResource());
	}
	
	@Override
    public Set<Object> getSingletons() {
        return singletons;
    }
}
