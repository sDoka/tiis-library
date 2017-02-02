<div class="android-header mdl-layout__header mdl-layout__header--waterfall">
  <div class="mdl-layout__header-row">
    <span class="android-title mdl-layout-title">
      <img class="android-logo-image" src="${site_logo}">
    </span>
    <!-- Add spacer, to align navigation to the right in desktop -->
    <div class="android-header-spacer mdl-layout-spacer"></div>
    <div class="android-search-box mdl-textfield mdl-js-textfield mdl-textfield--expandable mdl-textfield--floating-label mdl-textfield--align-right mdl-textfield--full-width">
      <label class="mdl-button mdl-js-button mdl-button--icon" for="search-field">
        <i class="material-icons">search</i>
      </label>
      <div class="mdl-textfield__expandable-holder">
         <form action="${themeDisplay.getURLHome()}/search" method="get" id="main-search-form">
            <input name="p_p_id" type="hidden" value="3">
            <input name="p_p_lifecycle" type="hidden" value="0">
            <input name="p_p_state" type="hidden" value="maximized">
            <input name="p_p_mode" type="hidden" value="view">
            <input name="_3_struts_action" type="hidden" value="/search/search">
            <input name="_3_groupId" type="hidden" value="${group_id}">
            <input name="_3_keywords" placeholder="<@liferay.language key='search' />" title="<@liferay.language key='search' />" type="text" value="" id="search-field" class="mdl-textfield__input">
         </form>
      </div>
    </div>
    
    <#include "${full_templates_path}/android/navigation.ftl" />

    <span class="android-mobile-title mdl-layout-title">
      <img class="android-logo-image" src="${site_logo}">
    </span>
    
    <button class="android-more-button mdl-button mdl-js-button mdl-button--icon mdl-js-ripple-effect" id="more-button">
      <i class="material-icons">more_vert</i>
    </button>
    <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right mdl-js-ripple-effect" for="more-button">
    
       <#if is_signed_in >
          <li class="mdl-menu__item">
             <a href="javascript:Liferay.Dockbar.toggleAddPanel();" title="${add_content_text}" id="add">
                <i class="icon-plus"></i> <span>${add_content_text}</span>
             </a>          
          </li>

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
       <#else>
          <#if show_sign_in>
             <li class="mdl-menu__item">
                <a href="${sign_in_url}" data-redirect="${is_login_redirect_required?string}" id="main-sign-in">${sign_in_text}</a>
             </li>
          </#if>
       </#if>
    </ul>
  </div>
</div>

<div class="android-drawer mdl-layout__drawer">
   <span class="mdl-layout-title">
      <img class="android-logo-image" src="${site_logo}">
   </span>
   <#include "${full_templates_path}/android/drawer.ftl" />
</div>


