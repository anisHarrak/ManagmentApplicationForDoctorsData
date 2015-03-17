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

import services.IBeneficierService;
import services.BeneficierService;
import persistence.Beneficier;


@Component

@Scope("session")
@Qualifier("beneficierCtrl")

public class BeneficierCtrl {
	
	private Beneficier newBeneficier = new Beneficier();
	private Beneficier editBeneficier;
	
	private SimpleSelection selection;
	
	private IBeneficierService beneficierService=BeneficierService.instance;
	
	private HtmlExtendedDataTable table;
	private List<Beneficier> selectedBeneficiers = new ArrayList<Beneficier>();
	private ExtendedTableDataModel<Beneficier> dataModel;
	private List<Beneficier> beneficiers = new ArrayList<Beneficier>();
	
		//@Autowired
	public void setBeneficierService(IBeneficierService beneficierService) {
		
		this.beneficierService = beneficierService;
	}
		public IBeneficierService getBeneficierService() {
		return beneficierService;
	}

		public String createBeneficier() {
			beneficierService.save(newBeneficier);
			newBeneficier = new Beneficier();
			return "list";
		}

	public String editBeneficier() {
		editBeneficier = (Beneficier) getSelectedBeneficiers().iterator().next();
		return "edit";
	}
	public String deleteBeneficier() {
		Beneficier med = (Beneficier) getSelectedBeneficiers().iterator().next();
		beneficierService.delete(med);
		resetSelection();
		getBeneficiers();
		return null;
	}
	
	public String updateBeneficier() {
		beneficierService.update(editBeneficier);
		getBeneficiers();
		return "list";
	}

	public List<Beneficier> getBeneficiers() {
		beneficiers = beneficierService.getAll();
		return beneficiers;
	}
	
	public Beneficier getNewBeneficier() {
		return newBeneficier;
	}

	public void setNewBeneficier(Beneficier beneficier) {
		this.newBeneficier = beneficier;
	}

	public Beneficier getEditBeneficier() {
		return editBeneficier;
	}

	public void setEditBeneficier(Beneficier editBeneficier) {
		this.editBeneficier = editBeneficier;
	}

	public void takeSelection() {
		getSelectedBeneficiers().clear();
		Iterator<Object> iterator = getSelection().getKeys();
		while (iterator.hasNext()) {
			Object key = iterator.next();
			table.setRowKey(key);
			if (table.isRowAvailable()) {
				getSelectedBeneficiers().add((Beneficier) table.getRowData());
			}
		}
	}

	public void resetSelection() {
		getSelectedBeneficiers().clear();
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

	public List<Beneficier> getSelectedBeneficiers() {
		return selectedBeneficiers;
	}

	public void setSelectedBeneficiers(List<Beneficier> selectedBeneficiers) {
		this.selectedBeneficiers = selectedBeneficiers;
	}

	public void setBeneficiers(List<Beneficier> beneficiers) {
		this.beneficiers = beneficiers;
	}

	public ExtendedTableDataModel<Beneficier> getBeneficiersDataModel() {
		if (dataModel == null) {
			dataModel = new ExtendedTableDataModel<Beneficier>(
					new DataProvider<Beneficier>() {

						private static final long serialVersionUID = 5054087821033164847L;

						public Beneficier getItemByKey(Object key) {
							for (Beneficier c : beneficiers) {
								if (key.equals(getKey(c))) {
									return c;
								}
							}
							return null;
						}

						public List<Beneficier> getItemsByRange(int firstRow,
								int endRow) {
							return beneficiers.subList(firstRow, endRow);
						}

						public Object getKey(Beneficier item) {
							return item.getNom();
						}

						public int getRowCount() {
							return beneficiers.size();
						}

					});
		}
		return dataModel;
	}
	
	
	
	

}
