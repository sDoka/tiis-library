<header class="mdl-layout__header mdl-layout__header--scroll mdl-color--primary">
   <div class="mdl-layout--large-screen-only mdl-layout__header-row"></div>
   <div class="mdl-layout--large-screen-only mdl-layout__header-row">
   
      <h3>
         <#if (show_site_logo == 'true') >
            <a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
               <img alt="${logo_description}" height="${site_logo_height}" src="${site_logo}" width="${site_logo_width}" />
            </a>
         </#if>
         <#if show_site_name>
            <span class="mdl-site-name">
               ${site_name}
            </span>
         </#if>
      </h3>

   </div>
   <div class="mdl-layout--large-screen-only mdl-layout__header-row"></div>
   
   <#include "${full_templates_path}/navigation.ftl" />
   
</header>
