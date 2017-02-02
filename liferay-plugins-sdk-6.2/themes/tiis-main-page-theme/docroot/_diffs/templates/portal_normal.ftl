<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<link href="${themeDisplay.getPortalURL()}/it-deutsch-no-header-and-footer-theme/images/favicon.ico"
		rel="Shortcut Icon">
	<#assign seo_description = "${themeDisplay.getLayout().getDescriptionCurrentValue()}" />
	<title>${the_title} - ${company_name}</title>
    <meta charset="UTF-8">
	<meta name="description" content="${seo_description}" />
	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<script type="text/javascript" src="/tiis-main-page-theme/js/jquery-3.1.1.min.js"></script>
    <link href="//fonts.googleapis.com/css?family=Open+Sans:100,200,300,400,600,700&amp;subset=cyrillic,latin" rel="stylesheet" type="text/css">
    <link href="//fonts.googleapis.com/css?family=PT+Sans:400&amp;subset=latin,cyrillic" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/tiis-main-page-theme/css/additional.css" type="text/css">
    <link rel="stylesheet" href="/tiis-main-page-theme/css/animate.min.css" type="text/css">
    <link rel="stylesheet" href="/tiis-main-page-theme/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/tiis-main-page-theme/css/jquery.fullPage.css" type="text/css">
    <link rel="stylesheet" href="/tiis-main-page-theme/css/style.css" type="text/css">
    <script type="text/javascript" src="/tiis-main-page-theme/js/jquery.fullPage.min.js"></script>
	
    

	
</head>

<body class="">
	<div id="content">
		<#if selectable>
			${theme.include(content_include)}
		<#else>
			${theme.wrapPortlet("portlet.ftl", content_include)}
		</#if>
	</div>
</body>

</html>