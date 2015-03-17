package control;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.richfaces.component.html.HtmlExtendedDataTable;
import org.richfaces.model.DataProvider;
import org.richfaces.model.ExtendedTableDataModel;
import org.richfaces.model.selection.SimpleSelection;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import org.springframework.beans.factory.annotation.Qualifier;


import services.IDecompteService;
import services.DecompteService;
import persistence.Decompte;

@Component
@Scope("session")
@Qualifier("decompteCtrl")


public class DecompteCtrl {
	
	private Decompte newDecompte = new Decompte();
	private Decompte editDecompte;
	private SimpleSelection selection;
	private IDecompteService decompteService=DecompteService.instance;
	private String messageValnumdecompte;
	private String messageValrefdecompte;
	private String messageValnbfacture;
	private String messageValdatefinper;
	private String messageValdatedepot;
	private String messageValmontcnam;
	private String messageValtotdecompte;
	private String messageValdatedebutper;
	private String messageValticketmoderateur;
	private HtmlExtendedDataTable table;
	private List<Decompte> selectedDecomptes = new ArrayList<Decompte>();
	private ExtendedTableDataModel<Decompte> dataModel;
	private List<Decompte> decomptes = new ArrayList<Decompte>();
	
public void setDecompteService(IDecompteService decompteService) {
		
		this.decompteService = decompteService;
	}
		public IDecompteService getDecompteService() {
		return decompteService;
	}

////////////////////////////////////////
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

//////////////////////////////////////	
		
		public boolean isInteger(String s){
			try {
				
			int i=Integer.valueOf(s.toString());
			if(i!=0){
				return true;
			}
			return false;
			} catch (Exception e) {
				return false;
			}
		}
		
		
		
		
/////////////////////////////////////////
		public void clean(){
			setMessageValdatedebutper("");
			setMessageValdatedepot("");
			setMessageValdatefinper("");
			setMessageValmontcnam("");
			setMessageValnbfacture("");
			setMessageValnumdecompte("");
			setMessageValrefdecompte("");
			setMessageValticketmoderateur("");
			setMessageValtotdecompte("");
		}
		
	public String createDecompte() {
		
		Date datedepot=newDecompte.getDate_depot();
		Date debutperiode=newDecompte.getDate_debut_periode();
		Date finperiode=newDecompte.getDate_fin_periode();
		String montcnam=newDecompte.getMontant_a_regler_CNAM();
		String nbfact=newDecompte.getNb_factures();
		String numdecompte=newDecompte.getNum_decompte();
		String refdecompte=newDecompte.getRef_decompte();
		String ticketmod=newDecompte.getTotal_ticket_moderateur();
		String totdecompte=newDecompte.getTotal_decompte();
		clean();
		boolean valid1=false;
		boolean valid2=false;
		boolean valid3=false;
		boolean valid4=false;
		boolean valid5=false;
		boolean valid6=false;
		boolean valid7=false;
		boolean valid8=false;
		boolean valid9=false;
		
		
		if(isInteger(numdecompte)){
			valid1=true;
		}else{
			valid1=false;
			setMessageValnumdecompte("valeur erronée");
			return null;
		}
		if( !refdecompte.isEmpty()&& !isInteger(refdecompte)){
			valid2=true;
			}else{
				valid2=false;
				setMessageValrefdecompte("veuillez saisir une référence");
			return null;

		}
		if(isInteger(nbfact)){
			valid3=true;
		}else{
			valid3=false;
			setMessageValnbfacture("valeur erronée");
			return null;
		}
		if(finperiode!=null){
			valid4=true;
		}else{
			valid4=false;
			setMessageValdatefinper("veuillez saisir une date");
			return null;
		}
		if(datedepot!=null){
			valid5=true;
		}else{
			valid5=false;
			setMessageValdatedepot("veuillez saisir une date");
			return null;
		}
		if(isInteger(montcnam)){
			valid6=true;
		}else{
			valid6=false;
			setMessageValmontcnam("valeur erronée");
			return null;
		}
		if(isInteger(totdecompte)){
			valid7=true;
		}else{
			valid7=false;
			setMessageValtotdecompte("valeur erronée");
			return null;
		}
		if(isInteger(ticketmod)){
			valid8=true;
		}else{
			valid8=false;
			setMessageValticketmoderateur("valeur erronée");
			return null;
		}
		if(debutperiode!=null){
			valid9=true;
		}else{
			valid9=false;
			setMessageValdatedebutper("veuillez saisir une date");
			return null;
		}
		
		if(valid1&valid2&valid3&valid4&valid5&valid6&valid7&valid8&valid9){
		decompteService.save(newDecompte);
		newDecompte = new Decompte();
		return "list";
		}
		return "";
	}

	public String deleteDecompte() {
		Decompte d = (Decompte) getSelectedDecomptes().iterator().next();
		decompteService.delete(d);
		resetSelection();
		getDecomptes();
		return null;
	}

	public String editDecompte() {
		editDecompte = (Decompte) getSelectedDecomptes().iterator().next();
		return "edit";
	}

	public String updateDecompte() {
		decompteService.update(editDecompte);
		getDecomptes();
		return "list";
	}

	public List<Decompte> getDecomptes() {
		decomptes = decompteService.getAll();
		return decomptes;
	}
	
	public Decompte getNewDecompte() {
		return newDecompte;
	}

	public void setNewDecomptee(Decompte decompte) {
		this.newDecompte = decompte;
	}

	public Decompte getEditDecompte() {
		return editDecompte;
	}

	public void setEditDecompte(Decompte editDecompte) {
		this.editDecompte = editDecompte;
	}

	public void takeSelection() {
		getSelectedDecomptes().clear();
		Iterator<Object> iterator = getSelection().getKeys();
		while (iterator.hasNext()) {
			Object key = iterator.next();
			table.setRowKey(key);
			if (table.isRowAvailable()) {
				getSelectedDecomptes().add((Decompte) table.getRowData());
			}
		}
	}

	public void resetSelection() {
		getSelectedDecomptes().clear();
	}

	public void setSelection(SimpleSelection selection) {
		this.selection = selection;
	}

	public void setTable(HtmlExtendedDataTable table) {
		this.table = table;
	}

	public HtmlExtendedDataTable getTable() {
		return table;
	}

	public SimpleSelection getSelection() {
		return selection;
	}

	public List<Decompte> getSelectedDecomptes() {
		return selectedDecomptes;
	}

	public void setSelectedDecomptes(List<Decompte> selectedDecomptes) {
		this.selectedDecomptes = selectedDecomptes;
	}

	public void setDecomptes(List<Decompte> decomptes) {
		this.decomptes = decomptes;
	}

	public ExtendedTableDataModel<Decompte> getDecomptesDataModel() {
		if (dataModel == null) {
			dataModel = new ExtendedTableDataModel<Decompte>(
					new DataProvider<Decompte>() {

						private static final long serialVersionUID = 5054087821033164847L;

						public Decompte getItemByKey(Object key) {
							for (Decompte c : decomptes) {
								if (key.equals(getKey(c))) {
									return c;
								}
							}
							return null;
						}

						public List<Decompte> getItemsByRange(int firstRow,
								int endRow) {
							return decomptes.subList(firstRow, endRow);
						}

						public Object getKey(Decompte item) {
							return item.getNum_decompte();
						}

						public int getRowCount() {
							return decomptes.size();
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
	public String getMessageValnumdecompte() {
		return messageValnumdecompte;
	}
	public void setMessageValnumdecompte(String messageValnumdecompte) {
		this.messageValnumdecompte = messageValnumdecompte;
	}
	public String getMessageValrefdecompte() {
		return messageValrefdecompte;
	}
	public void setMessageValrefdecompte(String messageValrefdecompte) {
		this.messageValrefdecompte = messageValrefdecompte;
	}
	public String getMessageValnbfacture() {
		return messageValnbfacture;
	}
	public void setMessageValnbfacture(String messageValnbfacture) {
		this.messageValnbfacture = messageValnbfacture;
	}
	public String getMessageValdatefinper() {
		return messageValdatefinper;
	}
	public void setMessageValdatefinper(String messageValdatefinper) {
		this.messageValdatefinper = messageValdatefinper;
	}
	public String getMessageValdatedepot() {
		return messageValdatedepot;
	}
	public void setMessageValdatedepot(String messageValdatedepot) {
		this.messageValdatedepot = messageValdatedepot;
	}
	public String getMessageValmontcnam() {
		return messageValmontcnam;
	}
	public void setMessageValmontcnam(String messageValmontcnam) {
		this.messageValmontcnam = messageValmontcnam;
	}
	public String getMessageValtotdecompte() {
		return messageValtotdecompte;
	}
	public void setMessageValtotdecompte(String messageValtotdecompte) {
		this.messageValtotdecompte = messageValtotdecompte;
	}
	public String getMessageValdatedebutper() {
		return messageValdatedebutper;
	}
	public void setMessageValdatedebutper(String messageValdatedebutper) {
		this.messageValdatedebutper = messageValdatedebutper;
	}

	
	
	


}
