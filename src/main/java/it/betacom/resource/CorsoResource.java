package it.betacom.resource;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.json.JSONObject;

import it.betacom.bean.Corso;
import it.betacom.service.CorsoService;

@Path("corsi")
public class CorsoResource {
	
	private CorsoService corsoService = new CorsoService();
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response getCorsi() {
		List<Corso> corsi = corsoService.findAll();
		
		if(!corsi.isEmpty()) {
			//200
			return Response.ok(corsi).build();
		}else {
			//404
			return Response.status(Response.Status.NOT_FOUND).build();
		}
	}
	
	@Path("/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response getCorsoById(@PathParam("id") long id) {
		Corso corso = null;
		
		try {
			corso = corsoService.fetchBy(id);
			return Response.ok(corso).build();
		} catch (Exception e) {
			JSONObject message = new JSONObject();
			message.put("message", e.getMessage());
			
			return Response.status(Response.Status.NOT_FOUND).entity(message.toString()).build();
		}
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response createCorso(Corso corso) {
		boolean result = corsoService.create(corso);
		
		if(result) {
			return Response.ok().status(Response.Status.CREATED).build();
		}
		
		return Response.notModified().build();
	}
	
	@PUT
	@Path("/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response updateCorso(@PathParam("id") long id, Corso corso) {
		
		if(id != corso.getId()) {
			return Response.notModified().build();
		}
		
		boolean result = corsoService.update(corso);
		
		if(result) {
			return Response.ok().status(Response.Status.NO_CONTENT).build();
		}
		
		return Response.notModified().build();
	}
	
	@DELETE
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response deleteCorso(@PathParam("id") long id) {
		
		boolean result = corsoService.delete(id);
		
		if(result) {
			return Response.ok().status(Response.Status.NO_CONTENT).build();
		}
		
		return Response.notModified().build();
	}
}
