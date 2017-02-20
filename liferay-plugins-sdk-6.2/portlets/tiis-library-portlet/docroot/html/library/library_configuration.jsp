<%@include file="/html/init.jsp"%>
<%@page import="ru.tiis.library.portlet.LibraryConfiguration"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<portlet:defineObjects />

<liferay-portlet:actionURL portletConfiguration="true" var="saveSetup" />

<aui:form method="POST" action="<%=saveSetup %>">
    <label class="radio">
        <input type="radio" id="<portlet:namespace/>isCatalogView"
        	name="<portlet:namespace/><%=LibraryConfiguration.LIBRARY_VIEW_MODE %>"
        		value="<%=LibraryConfiguration.CATALOG_MODE %>" ${ isCatalogView ? "checked" : ""}>
        <liferay-ui:message key="is-catalog-page" />
    </label>
    <hr>
    <label class="radio">
        <input type="radio" id="<portlet:namespace/>isPopularBooksView"
        	name="<portlet:namespace/><%=LibraryConfiguration.LIBRARY_VIEW_MODE %>"
        		value="<%=LibraryConfiguration.POPULAR_BOOKS_MODE %>" ${ isPopularBooksView ? "checked" : ""}>
        <liferay-ui:message key="is-popular-books-page" />
    </label>
    <liferay-ui:message key="set-popular-books-count-msg" />
    <br>
    <select name="<portlet:namespace/>popularBooksAmount">
        <option value="6" ${popularBooksAmount==6 ? "selected" : ""}>6</option>
        <option value="9" ${popularBooksAmount==9 ? "selected" : ""}>9</option>
        <option value="12" ${popularBooksAmount== 12 ? "selected" : ""}>12</option>
    </select>
    <br>
    <aui:button name="saveButton" type="submit" value="save" />
</aui:form>