<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<f:view>
  <!doctype html public "-//w3c//dtd html 4.0 transitional//en">
  <html>
    <head>
    <style>
.label {
	font-weight: bold;
}

.pbody {
	width: 200px;
}

.div_near_spacer {
	border-top-width: 0px;
	border-left-width: 0px;
	font-size: 0px;
	border-bottom-width: 0px;
	height: 2px;
	border-right-width: 0px
}
</style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
     <title>listing decompte</title>
     
    </head>
<body>

<rich:panel >
			
			<rich:panel>
				<f:facet name="header">
				  <h3 >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;   Liste des décomptes</h3>
				</f:facet>
				<h:form>
				<rich:extendedDataTable cellpadding="0" cellspacing="0" border="0"
					var="list" value="#{decompteCtrl.decomptes}" id="table" 
					sortMode="single" selectionMode="single"
					selection="#{decompteCtrl.selection}"
					style="text-align:center;" rows="10" width="1000" height="300">
					<f:facet name="header">
						<rich:columnGroup>
							<rich:column colspan="10">
								<h:outputText
									value="Décompte(s) selectionné(s): #{decompteCtrl.decomptesDataModel.rowCount}" />
							</rich:column>

							<rich:column breakBefore="true">
								<h:outputText styleClass="headerText" value="Numéro décompte" />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="référence décompte " />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="nombre facture" />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="Date depot" />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="Date début periode" />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="Date fin periode" />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="Total décompte" />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="Total ticket modérateur" />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="Montant à régler avec CNAM" />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="Opérations " />
							</rich:column>
						</rich:columnGroup>
					</f:facet>
					<rich:column filterEvent="onkeyup" filterBy="#{list.num_decompte}" sortBy="#{list.num_decompte}">
						<h:outputText value="#{list.num_decompte}" />
					</rich:column>
					<rich:column filterEvent="onkeyup" filterBy="#{list.ref_decompte}" sortBy="#{list.ref_decompte}" >
						<h:outputText value="#{list.ref_decompte}" />
					</rich:column>
					<rich:column >
						<h:outputText value="#{list.nb_factures}" />
					</rich:column>
					<rich:column  >
						<h:outputText value="#{list.date_depot}" />
					</rich:column>
					<rich:column >
						<h:outputText value="#{list.date_debut_periode}" />
					</rich:column>
					<rich:column >
						<h:outputText value="#{list.date_fin_periode}" />
					</rich:column>
					<rich:column >
						<h:outputText value="#{list.total_decompte}" />
					</rich:column>

					<rich:column >
						<h:outputText value="#{list.total_ticket_moderateur}" />
					</rich:column>
					<rich:column >
						<h:outputText value="#{list.montant_a_regler_CNAM}" />
					</rich:column>
					
						<rich:column >
				
						<h:commandLink value="Modifier"
	                action="#{decompteCtrl.editDecompte}" ></h:commandLink>
                   
					</rich:column>			
				</rich:extendedDataTable>
				
			</h:form>	
			</rich:panel>
			
		</rich:panel>



</body>
</html>
</f:view>