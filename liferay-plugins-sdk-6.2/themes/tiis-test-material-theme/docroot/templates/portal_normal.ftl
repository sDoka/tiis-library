<!DOCTYPE html>

<#include init />

<#assign template = theme_display.getThemeSetting('template') />
<#assign show_search = theme_display.getThemeSetting('show-search') />
<#assign show_header_content = theme_display.getThemeSetting('show-header-content') />
<#assign show_page_description = theme_display.getThemeSetting('show-page-description') />
<#assign show_breadcrumb = theme_display.getThemeSetting('show-breadcrumb') />
<#assign show_footer_content = theme_display.getThemeSetting('show-footer-content') />
<#assign show_site_logo = theme_display.getThemeSetting('show-site-logo') />

<html class="mdldemo ${template} ${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	${theme.include(top_head_include)}
	
	<script src="${javascript_folder}/jquery.js" type="text/javascript"></script>
	<script src="${javascript_folder}/bootstrap.js" type="text/javascript"></script>
</head>

<body class="${css_class}">

<a href="#main-content" id="skip-to-content"><@liferay.language key="skip-to-content" /></a>

${theme.include(body_top_include)}

<#include "${full_templates_path}/${template}.ftl" />

${theme.include(body_bottom_include)}

${theme.include(bottom_include)}

<script src="${javascript_folder}/material.js" type="text/javascript"></script>

</body>

</html>