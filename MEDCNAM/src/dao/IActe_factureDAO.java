package dao;

import java.util.List;
import persistence.Acte_facture;


public interface IActe_factureDAO {
	public boolean save(Acte_facture acte_fact);
	public List<Acte_facture> getAll();
	//public Acte_facture getById(int id);
	public boolean delete(Acte_facture acte_fact);
	public boolean update(Acte_facture acte_fact);
	public Acte_facture rechercher( Long id);
}
