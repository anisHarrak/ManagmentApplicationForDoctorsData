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
    
     <title>Add Facture</title>
     
    </head>
<body>
<rich:panel>
		        <f:facet name="header" ><h:outputText value="Saisir Une Facture"></h:outputText></f:facet>
     
   <h:panelGrid>
   <h:form> 
   <rich:layout> 
       <rich:layoutPanel position="left">
	        <h:panelGrid>
	              
        <h:outputText  value="Ordre de la facture:" />
			<h:inputText id="ordrefacture" value="#{factureCtrl.newFacture.ordre_facture}"
				required="false"  />
				
				<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValordrefacture}"></h:outputLabel>
			<h:outputText />
        <div class="div_near_spacer"></div>
        
         <h:outputText value="Nom du malade:" />
			<h:inputText id="nommalade" value="#{factureCtrl.newFacture.nom}"
				required="false"  />
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValnom}"></h:outputLabel>
			<h:outputText />
        <div class="div_near_spacer"></div>
        
        <h:outputText value="Prénom du malade:" />
			<h:inputText id="prénommalade" value="#{factureCtrl.newFacture.prenom}"
				required="false"  />
				<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValprenom}"></h:outputLabel>
			<h:outputText />
			        <div class="div_near_spacer"></div>
        
        <h:outputText value="Montant à régler avec la CNAM:" />
        <h:inputText id="montàregleraveclacnam" value="#{factureCtrl.newFacture.montant_a_regler}"
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
			<h:inputText id="codemedecin" value="#{factureCtrl.newFacture.code_medecin_famille}"
				required="false"  />
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValcodeconv}"></h:outputLabel>
			<h:outputText />
        <div class="div_near_spacer"></div>
        
		<h:outputText value="Date de naissance du malade:" />
			<a4j:outputPanel id="birthDay" layout="block">
                    <rich:calendar value="#{factureCtrl.newFacture.date_naissance_malade}"
                        locale="fr/FR"
                        popup="true"
                        datePattern="d/MMM/y"
                        showApplyButton="true" cellWidth="24px" cellHeight="22px" style="width:200px"/>
            </a4j:outputPanel>
            <h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValdatenaissance}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
			
		
		<h:outputText value="Date de prescription:" />
			<a4j:outputPanel id="dateprescr" layout="block">
                    <rich:calendar value="#{factureCtrl.newFacture.date_prescription}"
                        locale="fr/FR"
                        popup="true"
                        datePattern="d/MMM/y"
                        showApplyButton="true" cellWidth="24px" cellHeight="22px" style="width:200px"/>
            </a4j:outputPanel>
            <h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValdatepresc}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
			
			
			
		</h:panelGrid>
		
		</rich:layoutPanel>
		
		<rich:layoutPanel position="right">
		
		<h:panelGrid>
		
		<h:outputText value="Total de facture:" />
			
			<h:inputText id="totalfacture" value="#{factureCtrl.newFacture.total_facture}"
				required="false" >
		
				</h:inputText>
			
			<h:outputText />
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValtotalfacture}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
		
		<h:outputText value="Montant de consultation:" />
			
			<h:inputText id="montantconsl" value="#{factureCtrl.newFacture.montant_consultation}"
				required="false" >
				
				</h:inputText>
			
			
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValMontantCnsultation}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
		
		<h:outputText value="Total ticket modérateur:" />
			
			<h:inputText id="totalticketmod" value="#{factureCtrl.newFacture.total_ticket_moderateur}"
				required="false" >
			</h:inputText>
			<h:outputText />
			
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValticketmoderateur}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
			<br></br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
		  <h:commandButton  value="Ajouter" action="#{factureCtrl.createFacture}" />
    
			
			</h:panelGrid>
		 </rich:layoutPanel>
		 

	
	</rich:layout>
	</h:form>
  </h:panelGrid>
  
</rich:panel>
     
</body>
</html>
</f:view>