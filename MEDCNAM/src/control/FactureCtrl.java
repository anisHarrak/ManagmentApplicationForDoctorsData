package control;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

//import org.ajax4jsf.renderkit.compiler.BreakException;
import org.richfaces.component.html.HtmlExtendedDataTable;
import org.richfaces.model.DataProvider;
import org.richfaces.model.ExtendedTableDataModel;
import org.richfaces.model.selection.SimpleSelection;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import org.springframework.beans.factory.annotation.Qualifier;

import services.IFactureService;
import services.FactureService;


import persistence.Facture;

import java.util.Date;


@Component
@Scope("session")
@Qualifier("factureCtrl")

public class FactureCtrl {

	
	private Facture newFacture = new Facture();
	private Facture editFacture;
	private SimpleSelection selection;
	private IFactureService factureService=FactureService.instance;
	private String messageValMontantCnsultation;
	private String messageValticketmoderateur;
	private String messageValtotalfacture;
	private String messageValMontcnam;
	private String messageValordrefacture;
	private String messageValnom;
	private String messageValcodeconv;
	private String messageValprenom;
	private String messageValdatenaissance;
	private String messageValdatepresc;
	private HtmlExtendedDataTable table;
	private List<Facture> selectedFactures = new ArrayList<Facture>();
	private ExtendedTableDataModel<Facture> dataModel;
	private List<Facture> factures = new ArrayList<Facture>();
	
public void setFactureService(IFactureService factureService) {
		
		this.factureService = factureService;
	}
		public IFactureService getFactureService() {
		return factureService;
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
			setMessageValticketmoderateur("");
			setMessageValcodeconv("");
			setMessageValdatenaissance("");
			setMessageValdatepresc("");
			setMessageValMontantCnsultation("");
			setMessageValMontcnam("");
			setMessageValnom("");
			setMessageValordrefacture("");
			setMessageValprenom("");
			setMessageValtotalfacture("");
		}
	public String createFacture() {
	String nom=String.valueOf(newFacture.getNom().toString());
	String prenom=newFacture.getPrenom();
	String codeconv=newFacture.getCode_medecin_famille();
	String ordrefac=newFacture.getOrdre_facture();
	String montcnam=String.valueOf(newFacture.getMontant_a_regler());
	
	String totfac=String.valueOf(newFacture.getTotal_facture());	
	String mc=String.valueOf(newFacture.getMontant_consultation());
	String tottcket=String.valueOf(newFacture.getTotal_ticket_moderateur());
	Date datenaiss=newFacture.getDate_naissance_malade();
	Date datepresc=newFacture.getDate_prescription();
	
	
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
	boolean valid10=false;
	
	
	if( isInteger(ordrefac)){
	valid1=true;	
	}
		else{
			setMessageValordrefacture("valeur erronée");
	valid1=false;
	return null;	
	}
	
	
if( !nom.isEmpty()&& !isInteger(nom)){
	valid2=true;
	}else{
		valid2=false;
		setMessageValnom("veuillez saisir un nom");
	return null;

}


		
if( !prenom.isEmpty()&& !isInteger(prenom)){
	valid3=true;
}
	else{
		setMessageValprenom("veuillez saisir un prénom");
		valid3=false;
	return null;}
			
if(isValid(montcnam)){
	valid4=true;
}else{
	setMessageValMontcnam("valeur erronée");
	valid4=false;
return null;
}

if( isInteger(codeconv)){
	valid5=true;
}else{
	valid5=false;
	setMessageValcodeconv("valeur erronée");
return null;
}

if(datenaiss!=null){
	valid9=true;
}else{
	valid9=false;
	setMessageValdatenaissance("veuillez saisir une date");
}
if(datepresc!=null){
	valid10=true;
}else{
	valid10=false;
	setMessageValdatepresc("veuillez saisir une date");
}

if( isValid(totfac)){
valid6=true;
}else{
	valid6=false;
	setMessageValtotalfacture("valeur erronée");
return null;
}
						
if(isValid(mc)){
	valid7=true;
}else{
	valid7=false;
	setMessageValMontantCnsultation("valeur erronée");
return null;
}
	
if(isValid(tottcket)){
	valid8=true;
}else{
	valid8=false;
	setMessageValticketmoderateur("valeur erronée");
return null;
}
	
if(valid1&valid2&valid3&valid4&valid5&valid6&valid7&valid8&valid9&valid10){

factureService.save(newFacture);
newFacture = new Facture();
return "list";}
								
return "";
}


	public String deleteFacture() {
		Facture f = (Facture) getSelectedFactures().iterator().next();
		factureService.delete(f);
		resetSelection();
		getFactures();
		return null;
	}

	public String editFacture() {
		editFacture = (Facture) getSelectedFactures().iterator().next();
	
		return "edit";
	}

	public String updateFacture() {
		factureService.update(editFacture);
		getFactures();
		return "list";
	}

	public List<Facture> getFactures() {
		factures = factureService.getAll();
		return factures;
	}
	
	public Facture getNewFacture() {
		return newFacture;
	}

	public void setNewFacture(Facture facture) {
		this.newFacture = facture;
	}

	public Facture getEditFacture() {
		return editFacture;
	}

	public void setEditFacture(Facture editFacture) {
		this.editFacture = editFacture;
	}

	public void takeSelection() {
		getSelectedFactures().clear();
		Iterator<Object> iterator = getSelection().getKeys();
		while (iterator.hasNext()) {
			Object key = iterator.next();
			table.setRowKey(key);
			if (table.isRowAvailable()) {
				getSelectedFactures().add((Facture) table.getRowData());
			}
		}
	}

	public void resetSelection() {
		getSelectedFactures().clear();
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

	public List<Facture> getSelectedFactures() {
		return selectedFactures;
	}

	public void setSelectedFactures(List<Facture> selectedFactures) {
		this.selectedFactures = selectedFactures;
	}

	public void setFactures(List<Facture> factures) {
		this.factures = factures;
	}

	public ExtendedTableDataModel<Facture> getFacturesDataModel() {
		if (dataModel == null) {
			dataModel = new ExtendedTableDataModel<Facture>(
					new DataProvider<Facture>() {

						private static final long serialVersionUID = 5054087821033164847L;

						public Facture getItemByKey(Object key) {
							for (Facture c : factures) {
								if (key.equals(getKey(c))) {
									return c;
								}
							}
							return null;
						}

						public List<Facture> getItemsByRange(int firstRow,
								int endRow) {
							return factures.subList(firstRow, endRow);
						}

						public Object getKey(Facture item) {
							return item.getNom();
						}

						public int getRowCount() {
							return factures.size();
						}

					});
		}
		return dataModel;
	}
	public void setMessageValMontantCnsultation(
			String messageValMontantCnsultation) {
		this.messageValMontantCnsultation = messageValMontantCnsultation;
	}
	public String getMessageValMontantCnsultation() {
		return messageValMontantCnsultation;
	}
	public void setMessageValticketmoderateur(String messageValticketmoderateur) {
		this.messageValticketmoderateur = messageValticketmoderateur;
	}
	public String getMessageValticketmoderateur() {
		return messageValticketmoderateur;
	}
	public void setMessageValtotalfacture(String messageValtotalfacture) {
		this.messageValtotalfacture = messageValtotalfacture;
	}
	public String getMessageValtotalfacture() {
		return messageValtotalfacture;
	}
	public void setMessageValMontcnam(String messageValMontcnam) {
		this.messageValMontcnam = messageValMontcnam;
	}
	public String getMessageValMontcnam() {
		return messageValMontcnam;
	}
	public void setMessageValordrefacture(String messageValordrefacture) {
		this.messageValordrefacture = messageValordrefacture;
	}
	public String getMessageValordrefacture() {
		return messageValordrefacture;
	}
	public void setMessageValnom(String messageValnom) {
		this.messageValnom = messageValnom;
	}
	public String getMessageValnom() {
		return messageValnom;
	}
	public void setMessageValcodeconv(String messageValcodeconv) {
		this.messageValcodeconv = messageValcodeconv;
	}
	public String getMessageValcodeconv() {
		return messageValcodeconv;
	}
	public void setMessageValprenom(String messageValprenom) {
		this.messageValprenom = messageValprenom;
	}
	public String getMessageValprenom() {
		return messageValprenom;
	}
	
	public void setMessageValdatenaissance(String messageValdatenaissance) {
		this.messageValdatenaissance = messageValdatenaissance;
	}
	public String getMessageValdatenaissance() {
		return messageValdatenaissance;
	}
	public void setMessageValdatepresc(String messageValdatepresc) {
		this.messageValdatepresc = messageValdatepresc;
	}
	public String getMessageValdatepresc() {
		return messageValdatepresc;
	}
	
	
	
	

	
	
	
}
