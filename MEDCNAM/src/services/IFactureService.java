package services;

import java.util.List;
import persistence.Facture;


public interface IFactureService {
	public boolean save(Facture facture);
	public List<Facture> getAll();
	public Facture getById(Long id);
	public boolean delete(Facture facture);
	public boolean update(Facture facture);
	public Facture rechercher( Long id, String ordre_facture);

}
