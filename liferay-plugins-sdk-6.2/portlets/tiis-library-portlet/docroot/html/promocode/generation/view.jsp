<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html; charset=utf-8" session="false" pageEncoding="utf-8" trimDirectiveWhitespaces="true" %>
<%@page import="ru.tiis.srv.model.Book"%>
<%@include file="/html/init.jsp"%>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<portlet:actionURL name="generatePromoCodes" var="generatePromoUrl"></portlet:actionURL>
<%
SimpleDateFormat dateFormat = new SimpleDateFormat( "dd-MM-yyyy hh-mm-ss");
%>

	<form action="<%=generatePromoUrl%>" method="POST"
		id="<portlet:namespace />fm" name="<portlet:namespace />fm"
		enctype="multipart/form-data">

		<aui:button-row>
			<input type="text" value = "0" name = "<portlet:namespace/>promoCodesNumber"/>
			<input type="submit" class="btn btn-success" value="Generate promo codes" />
		</aui:button-row>
		
		
		<div id="promoTabs">

		  <ul class="nav nav-tabs">
		    <li class="active"><a href="#tab-1">Active Codes</a></li>
		    <li><a href="#tab-2">Used Codes</a></li>
		  </ul>
		
		  <div class="tab-content">
		    <div id="tab-1" class="tab-pane">
		      <div class="table-responsive">          
			  <table id = "dataTable" class="table">
			    <thead>
			      <tr>
			        <th>#</th>
			        <th>Promo code</th>
			        <th>Created at</th>
			      </tr>
			    </thead>
			    <tbody>
			      	<c:forEach var="promoCode" items="${ promoCodes }" varStatus="iterator">
			      		<c:if test = "${ !promoCode.isUsed }">
							<tr>
								<td>${ iterator.index }</td>
								<td>${ promoCode.promoCodeContent }</td>
								<td><fmt:formatDate pattern="dd-MM-yyy" value="${ promoCode.createTime }" /></td>
							</tr>
						</c:if>
					</c:forEach>
			    </tbody>
			  </table>
		  </div>
		    </div>
		    <div id="tab-2">
		      <table id = "dataTable" class="table">
			    <thead>
			      <tr>
			        <th>#</th>
			        <th>Promo code</th>
			        <th>Created at</th>
			        <th>Used at</th>
			        <th>Used by</th>
			      </tr>
			    </thead>
			    <tbody>
			      	<c:forEach var="promoCode" items="${ promoCodes }" varStatus="iterator">
			      		<c:if test = "${ promoCode.isUsed }">
							<tr>
								<td>${ iterator.index }</td>
								<td>${ promoCode.promoCodeId }</td>
								<td><fmt:formatDate pattern="dd-MM-yyy" value="${ promoCode.createTime }" /></td>
								<td><fmt:formatDate pattern="dd-MM-yyy" value="${ promoCode.usedTime }" /></td>
								<td>${ promoCode.userId}</td>
							</tr>
						</c:if>
					</c:forEach>
			    </tbody>
			  </table>
		    </div>
		  </div>
		
		</div>
		
	</form>

<script>
	YUI().use('aui-tabview', function(Y) {
		new Y.TabView({
			srcNode : '#promoTabs'
		}).render();
	});
</script>