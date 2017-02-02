<footer class="android-footer mdl-mega-footer">
   <div class="mdl-mega-footer--top-section">
      <div class="mdl-mega-footer--left-section">
         <button class="mdl-mega-footer--social-btn"></button>
         &nbsp;
         <button class="mdl-mega-footer--social-btn"></button>
         &nbsp;
         <button class="mdl-mega-footer--social-btn"></button>
      </div>
      <div class="mdl-mega-footer--right-section">
         <a class="mdl-typography--font-light" href="#top">
            <@liferay.language key="top" /><i class="material-icons">expand_less</i>
         </a>
      </div>
   </div>

   <div class="mdl-mega-footer--middle-section">
      <p class="mdl-typography--font-light">${site_name}</p>
   </div>

   <div class="mdl-mega-footer--bottom-section">
      <#list nav_items as nav_item>
         <#if nav_item.hasChildren() >
            <a class="android-link android-link-menu mdl-typography--font-light" id="footer_${nav_item.getLayoutId()}">
               ${nav_item.getName()}<i class="material-icons">arrow_drop_up</i>
            </a>
            <ul class="mdl-menu mdl-js-menu mdl-menu--top-left mdl-js-ripple-effect" for="footer_${nav_item.getLayoutId()}">
            <#list nav_item.getChildren() as nav_child>
               <li class="mdl-menu__item">
                  <a href="${nav_child.getURL()}" ${nav_child.getTarget()} >${nav_child.getName()}</a>
               </li>
            </#list>
            </ul>
         <#else>
            <a class="android-link mdl-typography--font-light" id="footer_${nav_item.getLayoutId()}">
               ${nav_item.getName()}
            </a>
         </#if>            
      </#list>
   </div>

</footer>