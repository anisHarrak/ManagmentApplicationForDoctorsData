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
     <title>listing facture</title>
     
    </head>
<body>

<rich:panel style="border:0;width:60%;text-align:center">
			
			<rich:panel>
				<f:facet name="header">
				  <h3 >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Liste des factures</h3>
				</f:facet>
				<h:form>
				<rich:extendedDataTable cellpadding="0" cellspacing="0" border="0"
					var="list" value="#{factureCtrl.factures}" id="table" 
					sortMode="single" selectionMode="single"
					selection="#{factureCtrl.selection}"
					style="text-align:center;" rows="11" width="1100" height="300">
					<f:facet name="header">
						<rich:columnGroup>
							<rich:column colspan="11">
								<h:outputText
									value="Béneficier(s) selectionné(s): #{factureCtrl.facturesDataModel.rowCount}" />
							</rich:column>

							<rich:column breakBefore="true">
								<h:outputText styleClass="headerText" value="Nom" />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="Prénom " />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="Ordre facture" />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="Date naissance" />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="Code médecin famille" />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="Date prescription" />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="Total facture" />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="Montant consultation" />
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
					<rich:column filterEvent="onkeyup" filterBy="#{list.nom}" sortBy="#{list.nom}">
						<h:outputText value="#{list.nom}" />
					</rich:column>
					<rich:column filterEvent="onkeyup" filterBy="#{list.prenom}">
						<h:outputText value="#{list.prenom}" />
					</rich:column>
					<rich:column >
						<h:outputText value="#{list.ordre_facture}" />
					</rich:column>
					<rich:column  >
						<h:outputText value="#{list.date_naissance_malade}" />
					</rich:column>
					<rich:column >
						<h:outputText value="#{list.code_medecin_famille}" />
					</rich:column>
					<rich:column >
						<h:outputText value="#{list.date_prescription}" />
					</rich:column>
					<rich:column >
						<h:outputText value="#{list.total_facture}" />
					</rich:column>
					<rich:column >
						<h:outputText value="#{list.montant_consultation}" />
					</rich:column>
					<rich:column >
						<h:outputText value="#{list.total_ticket_moderateur}" />
					</rich:column>
					<rich:column >
						<h:outputText value="#{list.montant_a_regler}" />
					</rich:column>
					<rich:column >
					
						<h:commandLink value="Modifier"
	                action="#{factureCtrl.editFacture}" ></h:commandLink>
                   
					</rich:column>
									
				</rich:extendedDataTable>
				
				</h:form>
			</rich:panel>
		
		</rich:panel>



</body>
</html>
</f:view>