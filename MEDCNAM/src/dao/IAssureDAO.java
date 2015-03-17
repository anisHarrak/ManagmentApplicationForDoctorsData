package dao;

import java.util.List;
import persistence.Assure;

public interface IAssureDAO {
	
	public List<Assure> getAll();
	public Assure getById(Long id);
	public boolean save(Assure assure);
	public boolean delete(Assure assure);
	public boolean update(Assure assure);
	public Assure rechercher(String nom_assure, String prenom_assure);
}
