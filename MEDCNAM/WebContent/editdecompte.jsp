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
    
     <title>edit Décompte</title>
     
    </head>
<body>
  <rich:panel>
		        <f:facet name="header" ><h:outputText value="Modifier un Décompte"/></f:facet>
     <h:panelGrid>
     <h:form>
     <rich:layout>
      
      <rich:layoutPanel position="left">
      <h:panelGrid>           
        <h:outputText value="Numéro du décompte:" />
			<h:inputText id="numdecompte" value="#{decompteCtrl.editDecompte.num_decompte}"
				required="false"  />
			
        <div class="div_near_spacer"></div>
       
       <h:outputText value="Réference du décompte:" />
			<h:inputText id="refdecompte" value="#{decompteCtrl.editDecompte.ref_decompte}"
				required="false"  />
			
        <div class="div_near_spacer"></div>
        
        <h:outputText value="Nombre de factures:" />
			<h:inputText id="nombrefactures" value="#{decompteCtrl.editDecompte.nb_factures}"
				required="false"  />
			
        <div class="div_near_spacer"></div>
        
        
          </h:panelGrid>
          </rich:layoutPanel>
          <rich:layoutPanel position="center">
          <h:panelGrid>
          <h:outputText value="Date de fin période:" />
			<a4j:outputPanel id="datefinperiode" layout="block">
                    <rich:calendar value="#{decompteCtrl.editDecompte.date_fin_periode}"
                        locale="fr/FR"
                        popup="true"
                        datePattern="d/MMM/y"
                        showApplyButton="true" cellWidth="24px" cellHeight="22px" style="width:200px"/>
            </a4j:outputPanel>
			<div class="div_near_spacer"></div>
			
			<h:outputText value="Date du dépot:" />
			<a4j:outputPanel id="datedepot" layout="block">
                    <rich:calendar value="#{decompteCtrl.editDecompte.date_depot}"
                        locale="fr/FR"
                        popup="true"
                        datePattern="d/MMM/y"
                        showApplyButton="true" cellWidth="24px" cellHeight="22px" style="width:200px"/>
            </a4j:outputPanel>
			<div class="div_near_spacer"></div>
        
        <h:outputText value="Montant avec la CNAM:" />
			
			<h:inputText id="montàregler" value="#{decompteCtrl.editDecompte.montant_a_regler_CNAM}"
				required="false" >
				
				</h:inputText>
			<h:outputText />
			<div class="div_near_spacer"></div>
         
			
		
		</h:panelGrid>
		</rich:layoutPanel>
		<rich:layoutPanel position="right">
		<h:panelGrid>	
		<h:outputText value="Total décompte:" />
			
			<h:inputText id="totaldecompte" value="#{decompteCtrl.editDecompte.total_decompte}"
				required="false" >
				
				</h:inputText>
			
			<h:outputText />
			<div class="div_near_spacer"></div>
			
			<h:outputText value="Total ticket modérateur:" />
			
			<h:inputText id="totalticketmod" value="#{decompteCtrl.editDecompte.total_ticket_moderateur}"
				required="false" >
				
				</h:inputText>
				<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValticketmoderateur}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
			
			<h:outputText value="Date du début période:" />
			<a4j:outputPanel id="datedebutperiode" layout="block">
                    <rich:calendar value="#{decompteCtrl.editDecompte.date_debut_periode}"
                        locale="fr/FR"
                        popup="true"
                        datePattern="d/MMM/y"
                        showApplyButton="true" cellWidth="24px" cellHeight="22px" style="width:200px"/>
            </a4j:outputPanel>
			<div class="div_near_spacer"></div>
			<br></br>
				
         <h:commandButton value="Mettre à jour" action="#{decompteCtrl.updateDecompte}" /> 
      
			
		</h:panelGrid>
		</rich:layoutPanel>			
		
		
      </rich:layout>
      </h:form>
      </h:panelGrid>
  </rich:panel>    
</body>
</html>
</f:view>