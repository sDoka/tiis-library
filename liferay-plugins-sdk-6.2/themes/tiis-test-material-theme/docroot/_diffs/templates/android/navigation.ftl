 <!-- Navigation -->
<div class="android-navigation-container">
   <nav class="android-navigation mdl-navigation">
      <#list nav_items as nav_item>
         <#assign nav_item_attr_has_popup = "" />
         <#assign nav_item_attr_selected = "" />
         <#assign nav_item_css_class = "" />
   
         <#if nav_item.isSelected()>
            <#assign nav_item_attr_has_popup = "aria-haspopup='true'" />
            <#assign nav_item_attr_selected = "aria-selected='true'" />
            <#assign nav_item_css_class = "is-active" />
         <#else>
            <#if nav_item.isChildSelected()>
               <#assign nav_item_css_class = "is-active" />
            </#if>
         </#if>
   
         <a href="${nav_item.getURL()}" class="mdl-navigation__link mdl-typography--text-uppercase ${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" ${nav_item_attr_selected} ${nav_item_attr_has_popup} ${nav_item.getTarget()} role="menuitem">${nav_item.getName()}</a>
      </#list>
   </nav>
</div>