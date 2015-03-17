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
			<rich:extendedDataTable height="350px" width="1170" value="#{assureCtrl.assures}"
				var="b" id="table3" sortMode="single" selectionMode="single"
				selection="#{assureCtrl.selection}" binding="#{assureCtrl.table}">


				<rich:column sortable="true" sortBy="#{b.nom_assure}"
					filterBy="#{b.nom_assure}" filterEvent="onkeyup" width="170px"
					label="nom assuré">
					
			<f:facet name="header">
						<h:outputText value="Nom assuré" />
					</f:facet>
					<h:outputText value="#{b.nom_assure}" />
					
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.prenom_assure}"
					filterBy="#{b.prenom_assure}" filterEvent="onkeyup" width="170px"
					label="prénom assuré">
					<f:facet name="header">
						<h:outputText value="Prénom assuré" />
					</f:facet>
					<h:outputText value="#{b.prenom_assure}" />
				</rich:column>

				<rich:column sortable="true" sortBy="#{b.code_caisse}"
					filterBy="#{b.code_caisse}" filterEvent="onkeyup" width="170px"
					label="code caisse">
					<f:facet name="header">
						<h:outputText value="Code caisse" />
					</f:facet>
					<h:outputText value="#{b.code_caisse}">
						
					</h:outputText>
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.matricule_assure}"
					 width="170px"
					label="matricule assuré">
					<f:facet name="header">
						<h:outputText value="Matricule assuré" />
					</f:facet>
					<h:outputText value="#{b.matricule_assure}">
						
					</h:outputText>
				</rich:column>
				
				<rich:column sortable="true" sortBy="#{b.adresse}"
					 width="170px"
					label="adresse">
					<f:facet name="header">
						<h:outputText value="Adresse assuré" />
					</f:facet>
					<h:outputText value="#{b.adresse}">
						
					</h:outputText>
				</rich:column>
				
				<rich:column sortable="true" sortBy="#{b.num_tel}"
					width="170px"
					label="num tel assuré">
					<f:facet name="header">
						<h:outputText value="Numéro téléphone" />
					</f:facet>
					<h:outputText value="#{b.num_tel}">
						
					</h:outputText>
				</rich:column>
				
				<rich:column sortable="true" sortBy="#{b.date_naissance}"
					 width="170px"
					label="date de naissance">
					<f:facet name="header">
						<h:outputText value="Date de naissance" />
					</f:facet>
					<h:outputText value="#{b.date_naissance}">
						<f:convertDateTime dateStyle="default" />
					</h:outputText>
				</rich:column>
				
				<a4j:support event="onselectionchange" reRender="restable"
					ajaxSingle="true" action="#{assureCtrl.takeSelection}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable3">
			<f:facet name="header">
				<h:outputText value="Assuré selected" />
			</f:facet>
			<rich:dataGrid columns="1" value="#{assureCtrl.selectedAssures}"
				var="cap" rendered="#{not empty assureCtrl.selectedAssures}">
				<h:outputText value="nom assuré: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.nom_assure}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="prénom assuré: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.prenom_assure}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="code caisse: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.code_caisse}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="matricule assuré:" styleClass="label"></h:outputText>
				<h:outputText value="#{cap.matricule_assure}" />
				<div class="div_near_spacer"></div>
				
				<h:outputText value="adresse:" styleClass="label"></h:outputText>
				<h:outputText value="#{cap.adresse}" />
				<div class="div_near_spacer"></div>
				
				<h:outputText value="num tel assuré:" styleClass="label"></h:outputText>
				<h:outputText value="#{cap.num_tel}" />
				<div class="div_near_spacer"></div>
				
				<h:outputText value="Date de naissance: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.date_naissance}" />
				<div class="div_near_spacer"></div>
				
				
				

				

			</rich:dataGrid>
			
</rich:panel>
</h:form>
</body>
</html>
</f:view>