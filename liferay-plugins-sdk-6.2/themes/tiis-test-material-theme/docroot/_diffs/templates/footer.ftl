<footer class="mdl-mega-footer">
   <div class="mdl-mega-footer--middle-section">
   
      <#list nav_items as nav_item>
   
         <div class="mdl-mega-footer--drop-down-section">
            <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
            <h1 class="mdl-mega-footer--heading">${nav_item.getName()}</h1>

            <#if nav_item.hasChildren() >
               <ul class="mdl-mega-footer--link-list">
                  <#list nav_item.getChildren() as nav_child>
                     <li>
                        <a href="${nav_child.getURL()}" ${nav_child.getTarget()} >${nav_child.getName()}</a>
                     </li>
                  </#list>
               </ul>
            </#if>            
         </div>
      </#list>
      
   </div>
   <div class="mdl-mega-footer--bottom-section">
      <div class="mdl-logo"><@liferay.language key="more" /></div>
      <ul class="mdl-mega-footer--link-list">
         <li>
            <a href="${themeDisplay.getURLHome()}/about"><@liferay.language key="about" /></a>
         </li>
         <li>
            <a href="${themeDisplay.getURLHome()}/help"><@liferay.language key="help" /></a>
         </li>
         <li>
            <a href="${themeDisplay.getURLHome()}/terms"><@liferay.language key="Terms" /></a>
         </li>
      </ul>
   </div>
</footer> 
   