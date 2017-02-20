<%@include file="/html/init.jsp"%>

<%-- BreadCrumbs --%>
<c:if test="${!isCourseInfoView}" >
	<liferay-ui:breadcrumb
		showGuestGroup="<%= false %>"
		showLayout="<%= true %>"
		showPortletBreadcrumb="<%= true %>"
	/>
</c:if>