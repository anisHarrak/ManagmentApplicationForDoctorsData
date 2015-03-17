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
			<rich:extendedDataTable height="350px" width="340" value="#{apciCtrl.APCIs}"
				var="b" id="table6" sortMode="single" selectionMode="single"
				selection="#{apciCtrl.selection}" binding="#{apciCtrl.table}">


				<rich:column sortable="true" sortBy="#{b.nom}"
					filterBy="#{b.nom}" filterEvent="onkeyup" width="170px"
					label="nom apci ">
					
			<f:facet name="header">
						<h:outputText value="Nom APCI" />
					</f:facet>
					<h:outputText value="#{b.nom}" />
					
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.code}"
					filterBy="#{b.code}" filterEvent="onkeyup" width="170px"
					label="code apci ">
					<f:facet name="header">
						<h:outputText value="Code APCI" />
					</f:facet>
					<h:outputText value="#{b.code}" />
				</rich:column>

				
				
				<a4j:support event="onselectionchange" reRender="restable"
					ajaxSingle="true" action="#{apciCtrl.takeSelection}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable6">
			<f:facet name="header">
				<h:outputText value="APCI selected" />
			</f:facet>
			<rich:dataGrid columns="1" value="#{apciCtrl.selectedAPCIs}"
				var="cap" rendered="#{not empty apciCtrl.selectedAPCIs}">
				<h:outputText value="nom apci: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.nom}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="code apci: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.code}" />
				<div class="div_near_spacer"></div>

				

				

			</rich:dataGrid>
			
</rich:panel>
</h:form>
</body>
</html>
</f:view>