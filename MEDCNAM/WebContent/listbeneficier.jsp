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
			<rich:extendedDataTable height="350px" width="1170" value="#{beneficierCtrl.beneficiers}"
				var="b" id="table4" sortMode="single" selectionMode="single"
				selection="#{beneficierCtrl.selection}" binding="#{beneficierCtrl.table}">


				<rich:column sortable="true" sortBy="#{b.nom}"
					filterBy="#{b.nom}" filterEvent="onkeyup" width="170px"
					label="nom ">
					
			<f:facet name="header">
						<h:outputText value="Nom bénéficier" />
					</f:facet>
					<h:outputText value="#{b.nom}" />
					
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.prenom}"
					filterBy="#{b.prenom}" filterEvent="onkeyup" width="170px"
					label="prénom ">
					<f:facet name="header">
						<h:outputText value="Prénom bénéficier" />
					</f:facet>
					<h:outputText value="#{b.prenom}" />
				</rich:column>

				<rich:column sortable="true" sortBy="#{b.rang_malade}"
					 width="170px"
					label="rang malade">
					<f:facet name="header">
						<h:outputText value="Rang malade" />
					</f:facet>
					<h:outputText value="#{b.rang_malade}">
						
					</h:outputText>
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.lien_parente}"
					 width="170px"
					label="lien parenté">
					<f:facet name="header">
						<h:outputText value="Lien parenté" />
					</f:facet>
					<h:outputText value="#{b.lien_parente}">
						
					</h:outputText>
				</rich:column>
				
				<rich:column sortable="true" sortBy="#{b.adresse}"
					 width="170px"
					label="adresse">
					<f:facet name="header">
						<h:outputText value="Adresse bénéficier" />
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
					ajaxSingle="true" action="#{beneficierCtrl.takeSelection}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable4">
			<f:facet name="header">
				<h:outputText value="Bénéficier selected" />
			</f:facet>
			<rich:dataGrid columns="1" value="#{beneficierCtrl.selectedBeneficiers}"
				var="cap" rendered="#{not empty beneficierCtrl.selectedBeneficiers}">
				<h:outputText value="nom bénéficier: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.nom}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="prénom bénéficier: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.prenom}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="rang malde: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.rang_malade}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="lien parenté:" styleClass="label"></h:outputText>
				<h:outputText value="#{cap.lien_parente}" />
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