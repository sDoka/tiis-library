<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
   <#if is_signed_in>
      <@liferay.dockbar />
   </#if>
   
   <#include "${full_templates_path}/dashboard/header.ftl" />
   
   <main class="mdl-layout__content mdl-color--grey-100">
      <div class="mdl-grid demo-content">
   
         <div class="container-fluid" id="wrapper">
            <#if (theme_display.getThemeSetting('show-header-content') == 'true') >
               <div class="header-content">
                     ${theme.runtime('56_INSTANCE_HEADER', '', '<portlet-preferences><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>')}
               </div>
            </#if>
            
            <#if (theme_display.getThemeSetting('show-page-description')) == 'true' >
               <#assign layout_icon_url = "" />
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
         		<#if (theme_display.getThemeSetting('show-breadcrumb') == 'true') >
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
         	
            <#if (theme_display.getThemeSetting('show-footer-content') == 'true') >
               <div class="footer-content">
                     ${theme.runtime('56_INSTANCE_FOOTER', '', '<portlet-preferences><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>')}
               </div>
            </#if>
         </div>
         
      </div>
   </main>
   
   <#include "${full_templates_path}/dashboard/footer.ftl" />
</div>
