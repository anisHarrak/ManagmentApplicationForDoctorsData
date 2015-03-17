package services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import dao.IFactureDAO;

import persistence.Facture;


@Repository
@Transactional
@Service

public class FactureService implements IFactureService {
	
	public static FactureService instance;
	   
	private IFactureDAO factureDAO;

	
	public FactureService(){
		instance=this;
		System.out.println("---------------------chargement  Service ----------------------");
	
	}
	
	public IFactureDAO getFactureDAO() {
		return factureDAO;
	}
	@Autowired
	public void setFactureDAO(IFactureDAO factureDAO) {
		
		System.out.println("injection factureDAO");
		this.factureDAO = factureDAO;
	}
	
	
	public Facture getById(Long id) {
		return factureDAO.getById(id);
	}
	
	public List<Facture> getAll() {
		return factureDAO.getAll();
	}
	public boolean update(Facture facture){
		return factureDAO.update(facture);
		
	}
	public Facture rechercher(Long id, String ordre_facture){
		return factureDAO.rechercher(id, ordre_facture);
	}
	
	public boolean save(Facture facture){
		return factureDAO.save(facture);
		
	}
	public boolean delete(Facture facture){
		return factureDAO.delete(facture);
		
	}
		

}
