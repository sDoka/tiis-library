<nav class="demo-navigation mdl-navigation mdl-color--blue-grey-800">
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

      <a href="${nav_item.getURL()}" class="mdl-navigation__link ${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" ${nav_item_attr_selected} ${nav_item_attr_has_popup} ${nav_item.getTarget()} role="menuitem">${nav_item.getName()}</a>
   </#list>

   <div class="mdl-layout-spacer"></div>
   <a class="mdl-navigation__link" href="${themeDisplay.getURLHome()}/help"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">help_outline</i> <span><@liferay.language key="help" /></span></a>
</nav>
