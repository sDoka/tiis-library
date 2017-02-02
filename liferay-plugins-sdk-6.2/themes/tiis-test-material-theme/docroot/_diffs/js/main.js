/* Liferay theme */
AUI().ready('liferay-hudcrumbs', 'liferay-navigation-interaction', 'liferay-sign-in-modal', function(A) {
   var navigation = A.one('#navigation');
   if (navigation) {
      navigation.plug(Liferay.NavigationInteraction);
   }

   var siteBreadcrumbs = A.one('#breadcrumbs');
   if (siteBreadcrumbs) {
      siteBreadcrumbs.plug(A.Hudcrumbs);
   }

   var signIn = A.one('li.sign-in a');
   if (signIn && signIn.getData('redirect') !== 'true') {
      signIn.plug(Liferay.SignInModal);
   }

   var mainSignIn = A.one('#main-sign-in');
   if (mainSignIn && mainSignIn.getData('redirect') !== 'true') {
      mainSignIn.plug(Liferay.SignInModal);
   }
   
});

$(window).load(function() {

   $("#dockbar-toggle").click(function() {
      $("#p_p_id_145_").toggle();
   });

   $("#main-toggle-controls").click(function() {
      $("#main-toggle-controls i").toggleClass("icon-eye-close").toggleClass("icon-eye-open");
      $("body").toggleClass("controls-visible").toggleClass("controls-hidden");
   });

});