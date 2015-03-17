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
        <title></title>
    </head>
    <body>
                 
                <rich:panel>
   <h:panelGrid width="60%">
      <rich:layout>
         <rich:layoutPanel position="top" width="100">
		<h1>RichFaces Application</h1>
	  </rich:layoutPanel>
	  <rich:layoutPanel position="left">
	     <rich:panelMenu style="width:200px" mode="ajax"
	        iconExpandedGroup="disc" iconCollapsedGroup="disc"
		iconExpandedTopGroup="chevronUp" iconGroupTopPosition="right"
		iconCollapsedTopGroup="chevronDown"	>
	        <rich:panelMenuGroup label="Group 1">
		   <rich:panelMenuItem label="Item 1.1" />
		   <rich:panelMenuItem label="Item 1.2" />
		   <rich:panelMenuItem label="Item 1.3" />
	        </rich:panelMenuGroup>
	        <rich:panelMenuGroup label="Group 2">
		   <rich:panelMenuItem label="Item 2.1" />
		   <rich:panelMenuItem label="Item 2.2" />
		   <rich:panelMenuItem label="Item 2.3" />
		   <rich:panelMenuGroup label="Group 2.4">
		       <rich:panelMenuItem label="Item 2.4.1" />
		       <rich:panelMenuItem label="Item 2.4.2" />
		       <rich:panelMenuItem label="Item 2.4.3" />
		   </rich:panelMenuGroup>
		   <rich:panelMenuItem label="Item 2.5" />
	        </rich:panelMenuGroup>
		<rich:panelMenuGroup label="Group 3">
		   <rich:panelMenuItem label="Item 3.1" />
		   <rich:panelMenuItem label="Item 3.2" />
		   <rich:panelMenuItem label="Item 3.3" />
		   </rich:panelMenuGroup>
		</rich:panelMenu>
	     </rich:layoutPanel>
	     <rich:layoutPanel position="center">
	        <h:panelGrid>
		   <h:outputText value="Favorite Joke:" />
		   <rich:editor />
<h:form>
		   <h:commandButton value="Save" />
</h:form>
		</h:panelGrid>
	     </rich:layoutPanel>
	     <rich:layoutPanel position="right">
	        <rich:layout>
		   <rich:layoutPanel position="top">
			Top
		   </rich:layoutPanel>
		   <rich:layoutPanel position="right">
			Right
		   </rich:layoutPanel>
		   <rich:layoutPanel position="center">
			Center
		   </rich:layoutPanel>
		   <rich:layoutPanel position="left">
			Left
		   </rich:layoutPanel>
		   <rich:layoutPanel position="bottom">
		   <h:outputLink value="list.jsf">
		<h:outputText value="Lister" />
	</h:outputLink>
		   </rich:layoutPanel>
		</rich:layout>		
	     </rich:layoutPanel>
	  <rich:layoutPanel position="bottom">
	      <div style="text-align: center">
                 <a href="http://richfaces.org">http://richfaces.org </a>
              </div>
	    </rich:layoutPanel>
	 </rich:layout>
      </h:panelGrid>
</rich:panel>
            
        
    </body> 
</html>
</f:view>