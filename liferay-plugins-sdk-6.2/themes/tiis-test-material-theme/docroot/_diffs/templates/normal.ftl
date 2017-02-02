<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
   <#if is_signed_in>
      <@liferay.dockbar />
   </#if>

   <#include "${full_templates_path}/header.ftl" />
   
   <main class="mdl-layout__content">
      <div class="container-fluid" id="wrapper">
         <#if (show_header_content == 'true') >
            <div class="header-content">
                  ${theme.runtime('56_INSTANCE_HEADER', '', '<portlet-preferences><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>')}
            </div>
         </#if>
         
         <#if (show_page_description == 'true') >
            <#assign layout_icon_url = '' />
            <#if (layout.getIconImage()) >
               <#assign layout_icon_url = "/image/layout_icon?img_id=$layout.getIconImageId()" />
            </#if>
         
            <div class="page-description">
               <div class="page-image" style="background-image: url(${layout_icon_url});" >
                   <div class="wrapper">
                        ${layout.getDescription(language_id,true)}
                   </div>
               </div>
            </div>
         </#if>
      
      	<div id="content">
      		<#if (show_breadcrumb == 'true') >
         	   <nav id="breadcrumbs"><@liferay.breadcrumbs /></nav>
            </#if>
      
      		<#if selectable>
      			${theme.include(content_include)}
      		<#else>
      			${portletDisplay.recycle()}
      
      			${portletDisplay.setTitle(the_title)}
      
      			${theme.wrapPortlet("portlet.ftl", content_include)}
      		</#if>
      	</div>
      	
         <#if (show_footer_content == 'true') >
            <div class="footer-content">
                  ${theme.runtime('56_INSTANCE_FOOTER', '', '<portlet-preferences><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>')}
            </div>
         </#if>
      </div>
   
      <#include "${full_templates_path}/footer.ftl" />
   </main>
</div>

<#if show_sign_in>
   <a href="${sign_in_url}" data-redirect="${is_login_redirect_required?string}" id="main-sign-in" class="view-source mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-color--accent mdl-color-text--accent-contrast">${sign_in_text}</a>
</#if>

