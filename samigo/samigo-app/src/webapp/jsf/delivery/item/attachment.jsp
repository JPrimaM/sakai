<!--
* $Id: attachment.jsp 6874 2006-03-22 17:01:47Z hquinn@stanford.edu $
<%--
***********************************************************************************
*
* Copyright (c) 2006 The Sakai Foundation.
*
* Licensed under the Educational Community License, Version 1.0 (the"License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*      http://www.opensource.org/licenses/ecl1.php
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License. 
*
***********************************************************************************/
--%>
-->
<!-- ATTACHMENTS -->
  <h:dataTable value="#{question.itemData.itemAttachmentList}" var="attach">
    <h:column rendered="#{!attach.isMedia}">
      <%@ include file="/jsf/shared/mimeicon.jsp" %>
    </h:column>
    <h:column>
      <f:verbatim>&nbsp;&nbsp;&nbsp;&nbsp;</f:verbatim>
	  <h:outputText escape="false" value="
	    <embed src=\"#{delivery.protocol}/samigo/servlet/ShowAttachmentMedia?resourceId=#{attach.resourceId}&mimeType=#{attach.mimeType}&filename=#{attach.filename}\" volume=\"50\" height=\"25\" width=\"300\" autostart=\"false\"/>" rendered="#{attach.isAudio}"/>
      <h:outputText escape="false" value="
	    <embed src=\"#{delivery.protocol}/samigo/servlet/ShowAttachmentMedia?resourceId=#{attach.resourceId}&mimeType=#{attach.mimeType}&filename=#{attach.filename}\" volume=\"50\" height=\"350\" width=\"400\" autostart=\"false\"/>" rendered="#{attach.isVideo}"/>
	  <h:outputText escape="false" value="
	    <img src=\"#{delivery.protocol}/samigo/servlet/ShowAttachmentMedia?resourceId=#{attach.resourceId}&mimeType=#{attach.mimeType}&filename=#{attach.filename}\" />" rendered="#{attach.isImage}"/>

	  <h:outputLink value="#{attach.filename}" target="new_window" rendered="#{attach.isLink && !attach.isMedia}">
        <h:outputText escape="false" value="#{attach.filename}" />
      </h:outputLink>
      <h:outputLink value="#{attach.location}" target="new_window" rendered="#{!attach.isLink && !attach.isMedia}">
        <h:outputText escape="false" value="#{attach.filename}" />
      </h:outputLink>
    </h:column>
    <h:column>
      <f:verbatim>&nbsp;&nbsp;&nbsp;&nbsp;</f:verbatim>
      <h:outputText escape="false" value="#{attach.fileSize} kb" rendered="#{!attach.isLink && !attach.isMedia}"/>
    </h:column>
  </h:dataTable>
  
