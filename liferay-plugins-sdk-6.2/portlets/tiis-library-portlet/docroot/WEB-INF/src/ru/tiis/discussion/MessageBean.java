package ru.tiis.discussion;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.model.User;
import com.liferay.portal.model.UserConstants;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portlet.messageboards.model.MBMessage;
import com.liferay.portlet.messageboards.service.MBMessageLocalServiceUtil;

public class MessageBean {
	long messageId, userId, threadId, rootMessageId, createDateISO;
	String userName, subject, body, userPortraitURL;
	Date createDate;
	
	public MessageBean(long messageId) {
		this.messageId = messageId;
		try {
			MBMessage message = null;		
			message = MBMessageLocalServiceUtil.getMessage(messageId);		
			userId = message.getUserId();
			threadId = message.getThreadId();
			rootMessageId = message.getRootMessageId();
			userName = message.getUserName();
			subject = message.getSubject();
			body = message.getBody();
		    DateFormat df = new SimpleDateFormat("yyyy MM dd HH mm");
		    df.setTimeZone(TimeZone.getTimeZone("UTC-3"));		  
			createDate = message.getCreateDate();
		    createDateISO = message.getCreateDate().getTime();  		    
			User user = UserLocalServiceUtil.getUser(userId);
			userPortraitURL = UserConstants.getPortraitURL("/image", user.isMale(), user.getPortraitId());			
		} catch (PortalException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public long getMessageId() {
		return messageId;
	}
	public String getUserName() {
		return userName;
	}
	public String getSubject() {
		return subject;
	}
	public String getBody() {
		return body;
	}
	public String getUserPortraitURL() {
		return userPortraitURL;
	}
	
	public long getCreateDateISO() {
		return createDateISO;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public long getUserId() {
		return userId;
	}

	public long getThreadId() {
		return threadId;
	}

	public long getRootMessageId() {
		return rootMessageId;
	}
}
