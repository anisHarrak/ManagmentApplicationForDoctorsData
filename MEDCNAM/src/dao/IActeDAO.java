package dao;

import java.util.List;
import persistence.Acte;


public interface IActeDAO {
	
	public List<Acte> getAll();
	public Acte getById(Long id);
	public boolean save(Acte acte);
	public boolean delete(Acte acte);
	public boolean update(Acte acte);
	public Acte rechercher(String code_acte);

}
