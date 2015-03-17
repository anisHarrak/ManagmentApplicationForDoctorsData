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
    
     <title>edit Facture</title>
     
    </head>
<body>
<rich:panel>
		        <f:facet name="header" ><h:outputText value="Modifier Une Facture"></h:outputText></f:facet>
     
   <h:panelGrid>
   <h:form> 
   <rich:layout> 
       <rich:layoutPanel position="left">
	        <h:panelGrid>
	              
        <h:outputText  value="Ordre de la facture:" />
			<h:inputText id="ordrefacture" value="#{factureCtrl.editFacture.ordre_facture}"
				required="false"  />
				
        <div class="div_near_spacer"></div>
        
         <h:outputText value="Nom du malade:" />
			<h:inputText id="nommalade" value="#{factureCtrl.editFacture.nom}"
				required="true"  />
			<h:message for="nommalade" />
        <div class="div_near_spacer"></div>
        
        <h:outputText value="Prénom du malade:" />
			<h:inputText id="prénommalade" value="#{factureCtrl.editFacture.prenom}"
				required="false"  />
			        <div class="div_near_spacer"></div>
        
        <h:outputText value="Montant à régler avec la CNAM:" />
        <h:inputText id="montàregleraveclacnam" value="#{factureCtrl.editFacture.montant_a_regler}"
				required="false" >
			
				</h:inputText>
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValMontcnam}"></h:outputLabel>
			
			<h:outputText />
			<div class="div_near_spacer"></div>
        </h:panelGrid>
		</rich:layoutPanel>
        
        <rich:layoutPanel position="center">
		<h:panelGrid>
        <h:outputText value="Code médecin de la famille:" />
			<h:inputText id="codemedecin" value="#{factureCtrl.editFacture.code_medecin_famille}"
				required="false"  />
			
        <div class="div_near_spacer"></div>
        
		<h:outputText value="Date de naissance du malade:" />
			<a4j:outputPanel id="birthDay" layout="block">
                    <rich:calendar value="#{factureCtrl.editFacture.date_naissance_malade}"
                        locale="fr/FR"
                        popup="true"
                        datePattern="d/MMM/y"
                        showApplyButton="true" cellWidth="24px" cellHeight="22px" style="width:200px"/>
            </a4j:outputPanel>
			<div class="div_near_spacer"></div>
			
		
		<h:outputText value="Date de prescription:" />
			<a4j:outputPanel id="dateprescr" layout="block">
                    <rich:calendar value="#{factureCtrl.editFacture.date_prescription}"
                        locale="fr/FR"
                        popup="true"
                        datePattern="d/MMM/y"
                        showApplyButton="true" cellWidth="24px" cellHeight="22px" style="width:200px"/>
            </a4j:outputPanel>
			<div class="div_near_spacer"></div>
			
			
			
		</h:panelGrid>
		
		</rich:layoutPanel>
		
		<rich:layoutPanel position="right">
		
		<h:panelGrid>
		
		<h:outputText value="Total de facture:" />
			
			<h:inputText id="totalfacture" value="#{factureCtrl.editFacture.total_facture}"
				required="false" >
		
				</h:inputText>
			
			<h:outputText />
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValtotalfacture}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
		
		<h:outputText value="Montant de consultation:" />
			
			<h:inputText id="montantconsl" value="#{factureCtrl.editFacture.montant_consultation}"
				required="false" >
				
				</h:inputText>
			
			
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValMontantCnsultation}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
		
		<h:outputText value="Total ticket modérateur:" />
			
			<h:inputText id="totalticketmod" value="#{factureCtrl.editFacture.total_ticket_moderateur}"
				required="false" >
			</h:inputText>
			<h:outputText />
			
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValticketmoderateur}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
			<br></br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
		  <h:commandButton  value="Mettre à jour" action="#{factureCtrl.updateFacture}" />
    
			
			</h:panelGrid>
		 </rich:layoutPanel>
		 

	
	</rich:layout>
	</h:form>
  </h:panelGrid>
  
</rich:panel>
     
</body>
</html>
</f:view>