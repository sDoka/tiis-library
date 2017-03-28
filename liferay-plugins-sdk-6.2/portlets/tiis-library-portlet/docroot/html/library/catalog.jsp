<%@include file="/html/init.jsp"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="com.liferay.portal.kernel.util.OrderByComparator"%>
<%@page import="com.liferay.portal.kernel.util.OrderedProperties"%>
<%@page import="com.liferay.portal.kernel.dao.orm.OrderFactory"%>
<%@page import="com.liferay.portal.kernel.dao.orm.OrderFactoryUtil"%>
<%@page import="com.liferay.portal.kernel.util.OrderByComparatorFactoryUtil"%>
<%@page import="com.liferay.portlet.asset.service.AssetCategoryLocalServiceUtil"%>
<%@page import="com.liferay.portlet.asset.model.AssetCategory"%>
<%@page import="com.liferay.portal.model.Role"%>
<%@page import="java.util.List"%>
<%@page import="com.liferay.portal.service.RoleLocalServiceUtil"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="com.liferay.portal.kernel.language.LanguageUtil"%>

<portlet:defineObjects />
<liferay-theme:defineObjects />

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/library/templates/book_grid_item.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/library/catalog.css">

<script type="text/html" id="tpl_books_grid">
	<%@include file="templates/book_grid_item.html" %>
</script>

<script type="text/javascript">
var portalURL = '<%=PortalUtil.getPortalURL(themeDisplay)%>';
AUI().ready(function () {
	var userIsAdmin = '<%=permissionChecker.isOmniadmin()%>';
	var userIsContentManager = true;
	var booksJSON = ${books};
	var	parentCategoryId = /* ${model.parentCategoryId} */0;
	var	namespace = '<portlet:namespace />';
	var booksNode = document.getElementById('<portlet:namespace />books');
	new BooksList(namespace, booksNode, booksJSON, userIsContentManager, parentCategoryId);
});
</script>

<jsp:include page="/html/library/init.jsp" ></jsp:include>

<div class="books-list">

	<%-- Top controls --%>
	<div class="row-fluid">
		<div class="span3">
			<h2><%=LanguageUtil.get(pageContext, "booklist-portlet-heading") %></h2>
		</div>
		<div class="span9 span8-padding">
		
			
			<form class="form-inline display-control">
	
				<div class="pull-left large-label">
					<%=LanguageUtil.get(pageContext, "books-found") %>:
					<span id="<portlet:namespace />bookFiltersResult"></span>
				</div>			
				
				<div class="pull-right">
					<label for="<portlet:namespace />viewBy">
						<liferay-ui:message key="booklist-portlet-view-by" />
					</label>
					<div class="select-div view-by-div">
						<select class="form-control" id="<portlet:namespace />viewBy">
							<option value="6">6</option>
							<option value="12">12</option>
							<option value="18">18</option>
							<option value="24">24</option>
							<option value="30">30</option>
							<option value="${books.size()}"> <liferay-ui:message key="all" /> </option>
						</select> 
					</div>
				</div>
			</form>	

			<form class="form-inline pull-right display-control" style="display: inline-block;">

				<label for="<portlet:namespace />sortBy">
					<%=LanguageUtil.get(pageContext, "booklist-portlet-sort-by") %>
				</label>
				<div class="select-div sort-by-div">				
					<select class="form-control" id="<portlet:namespace />sortBy" >
						<option value="by-date-desc">
							<%=LanguageUtil.get(pageContext, "booklist-sort-by-date-asc") %>
						</option>
						<option value="by-date-asc">
							<%=LanguageUtil.get(pageContext, "booklist-sort-by-date-desc") %>
						</option>
						<option value="by-name-asc">
							<%=LanguageUtil.get(pageContext, "booklist-sort-by-title-asc") %>
						</option>
						<option value="by-name-desc">
							<%=LanguageUtil.get(pageContext, "booklist-sort-by-title-desc") %>
						</option>
					</select>
				</div>
			</form>
				
		</div>
	</div>
	
	
	<%-- Left-side - controls, right-side - books list --%>
	
	<div class="row-fluid">
		
		<div class="span3">
			<div class="row-fluid">
				<div class="span12 search">
					<input id="<portlet:namespace />searchInput" class="search-input" 
							placeholder="<%=LanguageUtil.get(
							pageContext, "booklist-portlet-search-placeholder") %>">
					<i class="icon-search" ></i>
				</div>
			</div>
			
			<div class="clickable-block">
				<a id="<portlet:namespace />clearFilters" >
					<liferay-ui:message key="booklist-clear-all-filters" />
				</a>
			</div>
			
			<div class="sidebar">
				<h3><%=LanguageUtil.get(pageContext, "categories") %></h3>
				<ul class="clickable-list">
					<c:forEach items="${categories}" var="rootCategory">
						<li>
							<a class="category-link" data-cat-id="${rootCategory.categoryId}"
										id="cat${rootCategory.categoryId}">
										${rootCategory.getTitle(locale)}
									<span data-cat-count></span>
							</a>
						</li>
					</c:forEach>

					<%-- <c:forEach items="${model.rootCategories}" var="rootCategory">
						<li>
							<a class="category-link" data-cat-id="${rootCategory.categoryId}"
									id="cat${rootCategory.categoryId}">
								${rootCategory.getTitle(locale)}
								<span data-cat-count></span>
							</a>
						</li>
						<ul>
							<c:forEach items="${model.categories}" var="category">
								<c:if test="${rootCategory.categoryId == category.parentCategoryId}">
								<li>
									<a class="category-link" data-cat-id="${category.categoryId}"
											id="cat${category.categoryId}">
										${category.getTitle(locale)}
										<span data-cat-count></span>
									</a>
								</li>
								</c:if>
							</c:forEach>
						</ul>
					</c:forEach> --%>
				</ul>
			</div>
			<%-- <div class="sidebar">
				<h3><%=LanguageUtil.get(pageContext, "booklist-portlet-filters") %></h3>
				<c:forEach items="${model.filters}" var="filter">
					<h5>${filter.vocabulary.getTitle(locale)}:</h5>
					<c:forEach items="${filter.categories}" var="category">
						<div>				
							<input type="checkbox" class="filter-link" id="filter${category.categoryId}" 
								data-cat-id="${category.categoryId}" 
								data-vocab-id="${filter.vocabulary.vocabularyId}">
							<label for="filter${category.categoryId}">${category.getTitle(locale)}</label>
						</div>
					</c:forEach>
				</c:forEach>
			</div> --%>
		</div>
	
		<div class="span9">
			
			<div class="row-fluid" id="<portlet:namespace />books" ></div>

			<%-- <button class="long-button" id="<portlet:namespace />showMore">
				<liferay-ui:message key="booklist-portlet-show-more-books" />
			</button> --%>
			
		</div>
	</div>
</div>
