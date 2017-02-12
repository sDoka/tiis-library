package ru.tiis.srv.service.permission;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.security.auth.PrincipalException;
import com.liferay.portal.security.permission.PermissionChecker;

import ru.tiis.srv.model.Book;
import ru.tiis.srv.service.BookLocalServiceUtil;

/**
 * Test permission checker for {@code Book} entity.<br/>
 * Made in accordance with Liferay's dev-guide. Not supposed 
 * to be used as it is (static utility class).
 * 
 * @author User
 */
public class BookPermissions {
	
    public static void check(PermissionChecker permissionChecker, long bookId, String actionId) 
    		throws PortalException, SystemException {

        if (!contains(permissionChecker, bookId, actionId)) {
            throw new PrincipalException();
        }
    }

    public static boolean contains(PermissionChecker permissionChecker, long bookId, String actionId) 
    		throws PortalException, SystemException {

    	Book book = BookLocalServiceUtil.getBook(bookId);

        return permissionChecker
                .hasPermission(book.getGroupId(),
                        Book.class.getName(), book.getBookId(),
                        actionId);
    }
    
}
