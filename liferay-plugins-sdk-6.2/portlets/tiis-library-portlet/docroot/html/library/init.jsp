<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- BreadCrumbs -->

<c:if test="${!isCourseInfoView }" >
	<liferay-ui:breadcrumb
		showGuestGroup="<%= false %>"
		showLayout="<%= true %>"
		showPortletBreadcrumb="<%= true %>"
	/>
</c:if>