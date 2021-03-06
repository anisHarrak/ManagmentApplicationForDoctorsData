package dao;

import java.util.List;

import persistence.Bureau_reg;

public interface IBureau_regDAO {
	public boolean save(Bureau_reg bureau);
	public List<Bureau_reg> getAll();
	public Bureau_reg getById(Long id);
	public boolean delete(Bureau_reg bureau);
	public boolean update(Bureau_reg bureau);
	public Bureau_reg rechercher(String nom_bureau);
}
