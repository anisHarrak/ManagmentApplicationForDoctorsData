<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<f:view>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<h:form>

		<rich:panel>
			<rich:extendedDataTable height="350px" width="1000" value="#{factureCtrl.factures}"
				var="b" id="table8" sortMode="single" selectionMode="single"
				selection="#{factureCtrl.selection}" binding="#{factureCtrl.table}">


				<rich:column sortable="true" sortBy="#{b.nom}"
					filterBy="#{b.nom}" filterEvent="onkeyup" width="170px"
					label="nom malade ">
					
			<f:facet name="header">
						<h:outputText value="Nom malade" />
					</f:facet>
					<h:outputText value="#{b.nom}" />
					
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.prenom}"
					filterBy="#{b.prenom}" filterEvent="onkeyup" width="170px"
					label="prénom malade ">
					<f:facet name="header">
						<h:outputText value="Prénom malade" />
					</f:facet>
					<h:outputText value="#{b.prenom}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.ordre_facture}"
					width="170px"
					label="ordre facture ">
					<f:facet name="header">
						<h:outputText value="Ordre facture" />
					</f:facet>
					<h:outputText value="#{b.ordre_facture}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.date_naissance_malade}"
					 width="170px"
					label="date naissance ">
					<f:facet name="header">
						<h:outputText value="Date naissance" />
					</f:facet>
					<h:outputText value="#{b.date_naissance_malade}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.code_medecin_famille}"
					 width="170px"
					label="code médecin famille ">
					<f:facet name="header">
						<h:outputText value="Code medecin" />
					</f:facet>
					<h:outputText value="#{b.code_medecin_famille}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.date_prescription}"
					width="170px"
					label="date prescription ">
					<f:facet name="header">
						<h:outputText value="Date prescription" />
					</f:facet>
					<h:outputText value="#{b.date_prescription}" />
				</rich:column>

				<a4j:support event="onselectionchange" reRender="restable"
					ajaxSingle="true" action="#{factureCtrl.takeSelection}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable8" >
			<f:facet name="header" >
				<h:outputText value="Facture selected"  />
			</f:facet>
			<rich:dataGrid columns="1" value="#{factureCtrl.selectedFactures}"
				var="cap" rendered="#{not empty factureCtrl.selectedFactures}">
				<h:outputText value="nom malade: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.nom}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="prénom malade: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.prenom}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="ordre facture: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.ordre_facture}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="date naissance: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.date_naissance_malade}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="code médecin famille: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.code_medecin_famille}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="date prescription: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.date_prescription}" />
				<div class="div_near_spacer"></div>

				<h:commandButton value="Modifier" type="submit"
	 				action="#{factureCtrl.editFacture}" /> 
				
				<h:commandButton value="supprimer" type="submit"
	 				action="#{factureCtrl.deleteFacture}" />

			</rich:dataGrid>
			
</rich:panel>
</h:form>
</body>
</html>
</f:view>