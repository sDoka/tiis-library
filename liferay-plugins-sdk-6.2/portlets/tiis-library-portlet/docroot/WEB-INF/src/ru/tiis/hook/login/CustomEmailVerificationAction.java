package ru.tiis.hook.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.liferay.portal.NoSuchTicketException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.struts.BaseStrutsAction;
import com.liferay.portal.kernel.struts.StrutsAction;
import com.liferay.portal.kernel.util.Constants;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.model.Ticket;
import com.liferay.portal.model.User;
import com.liferay.portal.service.TicketLocalServiceUtil;
import com.liferay.portal.service.UserLocalServiceUtil;


public class CustomEmailVerificationAction extends BaseStrutsAction {
	
	private static final Log LOG = LogFactoryUtil.getLog(CustomEmailVerificationAction.class);
	
	/**
	 * Override strut action for auto login after verifying account.
	 */
	@Override 
	public String execute(StrutsAction originalStrutsAction, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String responseFromSuperMethod = StringPool.BLANK;
		String cmd = ParamUtil.getString(request, Constants.CMD);
		String ticketKey = ParamUtil.getString(request, "ticketKey");

		if (cmd.equals(Constants.UPDATE) && !ticketKey.isEmpty()) {
			
			Ticket ticket = null;
			User user = null;

			try {
				ticket = TicketLocalServiceUtil.getTicket(ticketKey);
			} catch(NoSuchTicketException e) {
				//TODO process the exception as per your need
				LOG.error("No such ticket");
			}
			
			responseFromSuperMethod = originalStrutsAction.execute(request, response);
			
			if(ticket != null) {
				user = UserLocalServiceUtil.fetchUserById(ticket.getClassPK());
				if(user.isEmailAddressVerified()) {
					login(user,request);
				}
			}
		} else {
			responseFromSuperMethod = originalStrutsAction.execute(request, response);
		}
		
		return responseFromSuperMethod;
	}
	
	/**
	 * Set login information into user model
	 * @param user
	 * @param request
	 * @throws Exception
	 */
	 public static void login(User user, HttpServletRequest request)
			 throws Exception {
		 
		String username = String.valueOf(user.getUserId());
		String password = user.getPassword();
		HttpSession session = request.getSession();
		session.setAttribute("j_username", username);
		session.setAttribute("j_password", password);
		session.setAttribute("j_remoteuser", username);
	}
}
