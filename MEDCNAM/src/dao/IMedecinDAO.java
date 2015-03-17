package dao;

import java.util.List;
import persistence.Medecin;


public interface IMedecinDAO {
	
	public List<Medecin> getAll();
	public Medecin getById(Long id);
	public boolean save(Medecin med);
	public boolean delete(Medecin med);
	public boolean update(Medecin med);
	public Medecin rechercher(String nom, String prenom);
	public String connect(String code_conventionnel);
}
