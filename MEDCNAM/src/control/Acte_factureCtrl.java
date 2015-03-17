package control;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.richfaces.component.html.HtmlExtendedDataTable;
import org.richfaces.model.DataProvider;
import org.richfaces.model.ExtendedTableDataModel;
import org.richfaces.model.selection.SimpleSelection;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import org.springframework.beans.factory.annotation.Qualifier;

import services.IActe_factureService;
import services.Acte_factureService;
import persistence.Acte_facture;

@Component
@Scope("session")
@Qualifier("actefactureCtrl")


public class Acte_factureCtrl {
	

	private Acte_facture newActe_facture = new Acte_facture();
	private Acte_facture editActe_facture;
	private SimpleSelection selection;
	private IActe_factureService acte_factureService=Acte_factureService.instance;
	private String messageValticketmoderateur;
	private HtmlExtendedDataTable table;
	private List<Acte_facture> selectedActe_factures = new ArrayList<Acte_facture>();
	private ExtendedTableDataModel<Acte_facture> dataModel;
	private List<Acte_facture> acte_factures = new ArrayList<Acte_facture>();
	public Acte_facture getNewActe_facture() {
		return newActe_facture;
	}
	public void setNewActe_facture(Acte_facture newActeFacture) {
		newActe_facture = newActeFacture;
	}
	public Acte_facture getEditActe_facture() {
		return editActe_facture;
	}
	public void setEditActe_facture(Acte_facture editActeFacture) {
		editActe_facture = editActeFacture;
	}
	public SimpleSelection getSelection() {
		return selection;
	}
	public void setSelection(SimpleSelection selection) {
		this.selection = selection;
	}
	public IActe_factureService getActe_factureService() {
		return acte_factureService;
	}
	public void setActe_factureService(IActe_factureService acteFactureService) {
		acte_factureService = acteFactureService;
	}
	public HtmlExtendedDataTable getTable() {
		return table;
	}
	public void setTable(HtmlExtendedDataTable table) {
		this.table = table;
	}
	public List<Acte_facture> getSelectedActe_factures() {
		return selectedActe_factures;
	}
	public void setSelectedActe_factures(List<Acte_facture> selectedActeFactures) {
		selectedActe_factures = selectedActeFactures;
	}
	
	public List<Acte_facture> getActe_factures() {
		return acte_factures;
	}
	public void setActe_factures(List<Acte_facture> acteFactures) {
		acte_factures = acteFactures;
	}
	public void takeSelection() {
		getSelectedActe_factures().clear();
		Iterator<Object> iterator = getSelection().getKeys();
		while (iterator.hasNext()) {
			Object key = iterator.next();
			table.setRowKey(key);
			if (table.isRowAvailable()) {
				getSelectedActe_factures().add((Acte_facture) table.getRowData());
			}
		}
	}

	public void resetSelection() {
		getSelectedActe_factures().clear();
	}
	/////////////////////////////////////////////
	public boolean isValid(String c){
		try{
			System.out.println(c);
			
		float d=Float.parseFloat(c);
		if (d!=0){
		return true;
		}
		return false;
		}
		catch (Exception e) {
			
		return false;
		}
	}
	
	/////////////////////////////////////////////
	
	public void clean(){
		setMessageValticketmoderateur("");
	}
	
	public String createActe_facture() {
		
		String montticket=String.valueOf(newActe_facture.getMontant_ticket_moderateur());
		clean();
		
		boolean valid1=false;
		if(isValid(montticket)){
			valid1=true;
		}else{
			
			setMessageValticketmoderateur("valeur erronée");
			valid1=false;
			return null;
		}
		if(valid1){
		acte_factureService.save(newActe_facture);
		newActe_facture = new Acte_facture();
		return "list";
		}
		return "";
	}

	public String deleteActe_facture() {
		Acte_facture a = (Acte_facture) getSelectedActe_factures().iterator().next();
		acte_factureService.delete(a);
		resetSelection();
		getActe_factures();
		return null;
	}

	public String editActe_facture() {
		editActe_facture = (Acte_facture) getSelectedActe_factures().iterator().next();
		return "edit";
	}

	public String updateActe_facture() {
		acte_factureService.update(editActe_facture);
		getActe_factures();
		return "list";
	}
	
	public ExtendedTableDataModel<Acte_facture> getActe_facturesDataModel() {
		if (dataModel == null) {
			dataModel = new ExtendedTableDataModel<Acte_facture>(
					new DataProvider<Acte_facture>() {

						private static final long serialVersionUID = 5054087821033164847L;

						public Acte_facture getItemByKey(Object key) {
							for (Acte_facture c : acte_factures) {
								if (key.equals(getKey(c))) {
									return c;
								}
							}
							return null;
						}

						public List<Acte_facture> getItemsByRange(int firstRow,
								int endRow) {
							return acte_factures.subList(firstRow, endRow);
						}

						public Object getKey(Acte_facture item) {
							return item.getId();
						}

						public int getRowCount() {
							return acte_factures.size();
						}

					});
		}
		return dataModel;
	}
	public void setMessageValticketmoderateur(String messageValticketmoderateur) {
		this.messageValticketmoderateur = messageValticketmoderateur;
	}
	public String getMessageValticketmoderateur() {
		return messageValticketmoderateur;
	}
	
	
	
	

}
