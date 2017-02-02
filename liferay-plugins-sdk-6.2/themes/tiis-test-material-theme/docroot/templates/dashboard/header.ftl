<header class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
  <div class="mdl-layout__header-row">
    <span class="mdl-layout-title">Home</span>
    <div class="mdl-layout-spacer"></div>
    <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
      <label class="mdl-button mdl-js-button mdl-button--icon" for="search">
        <i class="material-icons">search</i>
      </label>
      <div class="mdl-textfield__expandable-holder">
         <form action="${themeDisplay.getURLHome()}/search" method="get">
            <input name="p_p_id" type="hidden" value="3">
            <input name="p_p_lifecycle" type="hidden" value="0">
            <input name="p_p_state" type="hidden" value="maximized">
            <input name="p_p_mode" type="hidden" value="view">
            <input name="_3_struts_action" type="hidden" value="/search/search">
            <input name="_3_groupId" type="hidden" value="${group_id}">
            <input name="_3_keywords" placeholder="<@liferay.language key='search' />" title="<@liferay.language key='search' />" type="text" value="" id="search" class="mdl-textfield__input">
         </form>
      </div>
    </div>
    
    
    <#if is_signed_in >
       <a href="javascript:Liferay.Dockbar.toggleAddPanel();" title="<@liferay.language key="add-content" />" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="add">
          <i class="material-icons">add</i>
       </a>
    </#if>
    
    <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
      <i class="material-icons">more_vert</i>
    </button>
    <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
      <li class="mdl-menu__item"><a href="${themeDisplay.getURLHome()}/about"><@liferay.language key="about" /></a></li>
      <li class="mdl-menu__item"><a href="${themeDisplay.getURLHome()}/contact"><@liferay.language key="contact" /></a></li>
      <li class="mdl-menu__item"><a href="${themeDisplay.getURLHome()}/terms"><@liferay.language key="Terms" /></a></li>
    </ul>
  </div>
</header>
<div class="demo-drawer mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-50">
  <header class="demo-drawer-header">
    <#if (is_signed_in)>
       <img src="${user.getPortraitURL(themeDisplay)}" class="demo-avatar">
       <div class="demo-avatar-dropdown">
         <span>${user_name}</span>
         <div class="mdl-layout-spacer"></div>
         <button id="accbtn" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
           <i class="material-icons" role="presentation">arrow_drop_down</i>
           <span class="visuallyhidden">User</span>
         </button>
         <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="accbtn">
           <li class="mdl-menu__item">
              <a href="/web${user.getGroup().getFriendlyURL()}"><@liferay.language key="my-profile" /></a>
           </li>
           <li class="mdl-menu__item">
              <a href="/group${user.getGroup().getFriendlyURL()}"><@liferay.language key="my-dashboard" /></a>
           </li>
           <li class="mdl-menu__item">
               <a href="javascript:Liferay.Util.openWindow({dialog: {destroyOnHide: true}, title: '${my_account_text}', uri: '${my_account_url}'});"><i class="icon-user"></i> <span><@liferay.language key="my-account" /></span></a>
           </li>
           <li class="mdl-menu__item">
              <a href="${sign_out_url}" rel="nofollow"><i class="icon-off"></i> <span>${sign_out_text}</span></a>
           </li>
         </ul>
       </div>
    <#else>
       <img src="${site_logo}" class="demo-avatar">
       <div class="demo-avatar-dropdown">
         <span>${site_name}</span>
         <div class="mdl-layout-spacer"></div>
         <a id="main-sign-in" class="pull-right" href="${sign_in_url}" ><i class="icon-user"></i></a>
       </div>
    </#if>
  </header>
  
  <#include "${full_templates_path}/dashboard/navigation.ftl" />

</div>
