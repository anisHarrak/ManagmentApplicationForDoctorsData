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

import services.IMedecinService;
import services.MedecinService;

import persistence.Medecin;



@Component

@Scope("session")
@Qualifier("medecinCtrl")
public class MedecinCtrl {
	private Medecin newMedecin = new Medecin();
	private Medecin editMedecin;
	private String messageValcodeconv;
	private SimpleSelection selection3;
	
	private IMedecinService medecinService=MedecinService.instance;
	
	private HtmlExtendedDataTable table3;
	private List<Medecin> selectedMedecins = new ArrayList<Medecin>();
	private ExtendedTableDataModel<Medecin> dataModel3;
	private List<Medecin> medecins = new ArrayList<Medecin>();
	
	private Medecin selectedMedecin;
		public Medecin getSelectedMedecin() {
		return selectedMedecin;
	}
	public void setSelectedMedecin(Medecin selectedMedecin) {
		this.selectedMedecin = selectedMedecin;
	}
	//@Autowired
	public void setMedecinService(IMedecinService medecinService) {
		
		this.medecinService = medecinService;
	}
		public IMedecinService getMedecinService() {
		return medecinService;
	}

		public String createMedecin() {
			medecinService.save(newMedecin);
			newMedecin = new Medecin();
			return "list";
		}

	public String editMedecin() {
		editMedecin = (Medecin) getSelectedMedecins().iterator().next();
		return "edit";
	}
	public String deleteMedecin() {
		Medecin med = (Medecin) getSelectedMedecins().iterator().next();
		medecinService.delete(med);
		resetSelection3();
		getMedecins();
		return null;
	}
	///////////////////////////////////////////////////////
	public boolean isInteger(String s){
		try {
			if(s==newMedecin.getCode_conventionnel() && s!=null){
			Integer.valueOf(newMedecin.getCode_conventionnel().toString());
			return true;
			}else 
			
			return false;
		} catch (Exception e) {
			return false;
		}
	}
	///////////////////////////////////////////////////////////////////
	public void clean(){
		setMessageValcodeconv("");
	}
	public String connectMedecin(){
		
		String codeconv=newMedecin.getCode_conventionnel();
		//clean();
		boolean valid =false;
		if(isInteger(codeconv)){
			valid=true;
			
			
		}else{
			valid=false;
			setMessageValcodeconv("veuillez saisir un code valid");
		
			}
		
		if(valid){
			
		try {  	
		String med= medecinService.connect(newMedecin.getCode_conventionnel());
		}catch (Exception e) {
			setMessageValcodeconv("veuillez saisir un code valid");
			return "nonok";
		}
		}
				return "ok";
				
				
			
		
		
		
		
	}
	//}
	public String updateMedecin() {
		medecinService.update(editMedecin);
		getMedecins();
		return "list";
	}

	public List<Medecin> getMedecins() {
		medecins = medecinService.getAll();
		return medecins;
	}
	
	public Medecin getNewMedecin() {
		return newMedecin;
	}

	public void setNewMedecin(Medecin medecin) {
		this.newMedecin = medecin;
	}

	public Medecin getEditMedecin() {
		return editMedecin;
	}

	public void setEditMedecin(Medecin editMedecin) {
		this.editMedecin = editMedecin;
	}

	public void takeSelection3() {
		getSelectedMedecins().clear();
		Iterator<Object> iterator = getSelection3().getKeys();
		while (iterator.hasNext()) {
			Object key = iterator.next();
			table3.setRowKey(key);
			if (table3.isRowAvailable()) {
				getSelectedMedecins().add((Medecin) table3.getRowData());
			}
		}
	}

	public void resetSelection3() {
		getSelectedMedecins().clear();
	}

	public void setSelection3(SimpleSelection selection3) {
		this.selection3 = selection3;
	}

	public void setTable3(HtmlExtendedDataTable table3) {
		this.table3 = table3;
	}

	public HtmlExtendedDataTable getTable3() {
		return table3;
	}

	public SimpleSelection getSelection3() {
		return selection3;
	}

	public List<Medecin> getSelectedMedecins() {
		return selectedMedecins;
	}

	public void setSelectedMedecins(List<Medecin> selectedMedecins) {
		this.selectedMedecins = selectedMedecins;
	}

	public void setMedecins(List<Medecin> medecins) {
		this.medecins = medecins;
	}

	public ExtendedTableDataModel<Medecin> getMedecinsDataModel() {
		if (dataModel3 == null) {
			dataModel3 = new ExtendedTableDataModel<Medecin>(
					new DataProvider<Medecin>() {

						private static final long serialVersionUID = 5054087821033164847L;

						public Medecin getItemByKey(Object key) {
							for (Medecin c : medecins) {
								if (key.equals(getKey(c))) {
									return c;
								}
							}
							return null;
						}

						public List<Medecin> getItemsByRange(int firstRow,
								int endRow) {
							return medecins.subList(firstRow, endRow);
						}

						public Object getKey(Medecin item) {
							return item.getNom();
						}

						public int getRowCount() {
							return medecins.size();
						}

					});
		}
		return dataModel3;
	}
	public void setMessageValcodeconv(String messageValcodeconv) {
		this.messageValcodeconv = messageValcodeconv;
	}
	public String getMessageValcodeconv() {
		return messageValcodeconv;
	}
}