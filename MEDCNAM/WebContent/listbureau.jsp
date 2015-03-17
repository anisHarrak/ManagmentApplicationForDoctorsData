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
			<rich:extendedDataTable height="350px" width="675" value="#{bureauCtrl.bureau_regs}"
				var="b" id="table" sortMode="single" selectionMode="single"
				selection="#{bureauCtrl.selection}" binding="#{bureauCtrl.table}">


				<rich:column sortable="true" sortBy="#{b.nom_bureau}"
					filterBy="#{b.nom_bureau}" filterEvent="onkeyup" width="170px"
					label="nom bureau">
					
			<f:facet name="header">
						<h:outputText value="Nom bureau" />
					</f:facet>
					<h:outputText value="#{b.nom_bureau}" />
					
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.adresse}"
					width="170px"
					label="adresse">
					<f:facet name="header">
						<h:outputText value="Adresse" />
					</f:facet>
					<h:outputText value="#{b.adresse}" />
				</rich:column>

				<rich:column sortable="true" sortBy="#{b.num_tel}"
					 width="170px"
					label="numéro téléphone">
					<f:facet name="header">
						<h:outputText value="Numéro téléphone" />
					</f:facet>
					<h:outputText value="#{b.num_tel}">
						
					</h:outputText>
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.num_fax}"
					 width="170px"
					label="numéro fax">
					<f:facet name="header">
						<h:outputText value="Numéro fax" />
					</f:facet>
					<h:outputText value="#{b.num_tel}">
						
					</h:outputText>
				</rich:column>
				
				<a4j:support event="onselectionchange" reRender="restable"
					ajaxSingle="true" action="#{bureauCtrl.takeSelection}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable">
			<f:facet name="header">
				<h:outputText value="Bureau selected" />
			</f:facet>
			<rich:dataGrid columns="1" value="#{bureauCtrl.selectedBureau_regs}"
				var="cap" rendered="#{not empty bureauCtrl.selectedBureau_regs}">
				<h:outputText value="nom bureau: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.nom_bureau}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="adresse: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.adresse}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="numéro téléphone: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.num_tel}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="numéro fax:" styleClass="label"></h:outputText>
				<h:outputText value="#{cap.num_fax}" />
				<div class="div_near_spacer"></div>

				
			</rich:dataGrid>
			
</rich:panel>
</h:form>
</body>
</html>
</f:view>