package dao;

import java.util.List;
import persistence.Decompte;


public interface IDecompteDAO {
	public boolean save(Decompte decompte);
	public List<Decompte> getAll();
	public Decompte getById(Long id);
	public boolean delete(Decompte decompte);
	public boolean update(Decompte decompte);
	public Decompte rechercher( Long id, String num_decompte);
}
