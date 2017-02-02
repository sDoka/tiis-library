<nav class="mdl-navigation">
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

      <a href="${nav_item.getURL()}" class="mdl-navigation__link ${nav_item_css_class}" id="drawer_${nav_item.getLayoutId()}" ${nav_item_attr_selected} ${nav_item_attr_has_popup} ${nav_item.getTarget()} role="menuitem">${nav_item.getName()}</a>
   </#list>
   <span class="mdl-navigation__link" href=""><@liferay.language key="about" /></span>
   <a class="mdl-navigation__link" href="${themeDisplay.getURLHome()}/help"><@liferay.language key="help" /></a>
   <a class="mdl-navigation__link" href="${themeDisplay.getURLHome()}/contact"><@liferay.language key="contact" /></a>
   <a class="mdl-navigation__link" href="${themeDisplay.getURLHome()}/terms"><@liferay.language key="terms" /></a>
</nav>
