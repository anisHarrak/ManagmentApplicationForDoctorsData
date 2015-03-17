package services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import dao.IDecompteDAO;

import persistence.Decompte;


@Repository
@Transactional
@Service

public class DecompteService implements IDecompteService {
	
	public static DecompteService instance;
	   
	private IDecompteDAO decompteDAO;

	
	public DecompteService(){
		instance=this;
		System.out.println("---------------------chargement  Service ----------------------");
	
	}
	
	public IDecompteDAO getDecompteDAO() {
		return decompteDAO;
	}
	@Autowired
	public void setDecompteDAO(IDecompteDAO decompteDAO) {
		
		System.out.println("injection decompteDAO");
		this.decompteDAO = decompteDAO;
	}
	
	
	public Decompte getById(Long id) {
		return decompteDAO.getById(id);
	}
	
	public List<Decompte> getAll() {
		return decompteDAO.getAll();
	}
	public boolean update(Decompte decompte){
		return decompteDAO.update(decompte);
		
	}
	public Decompte rechercher(Long id, String num_decompte){
		return decompteDAO.rechercher(id, num_decompte);
	}
	
	public boolean save(Decompte decompte){
		return decompteDAO.save(decompte);
		
	}
	public boolean delete(Decompte decompte){
		return decompteDAO.delete(decompte);
		
	}
		

}
