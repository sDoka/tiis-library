package ru.tiis.managment.portlet.util;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.portlet.PortletRequest;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.upload.FileItem;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.ResourceConstants;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.RoleConstants;
import com.liferay.portal.security.permission.ActionKeys;
import com.liferay.portal.service.ResourcePermissionLocalServiceUtil;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portlet.documentlibrary.model.DLFileEntry;
import com.liferay.portlet.documentlibrary.model.DLFolder;
import com.liferay.portlet.documentlibrary.model.DLFolderConstants;
import com.liferay.portlet.documentlibrary.service.DLAppServiceUtil;
import com.liferay.portlet.documentlibrary.service.DLFileEntryLocalServiceUtil;

public class LibraryManagmentUtil {
	private static final Log log = LogFactoryUtil.getLog(LibraryManagmentUtil.class);

	private static String ROOT_FOLDER_NAME = "Library Uploads";
	private static String ROOT_FOLDER_DESCRIPTION = "Folder, created to store books logos and other stuff";
	private static long PARENT_FOLDER_ID = DLFolderConstants.DEFAULT_PARENT_FOLDER_ID;

	public static DLFileEntry storeBookImageToDocumentLibrary(PortletRequest request, FileItem bookLogoFileItem)
			throws IOException, PortalException, SystemException {

		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		Folder folder = getLibraryUploadsFolder(themeDisplay, request);
		long repositoryId = themeDisplay.getScopeGroupId();
		String mimeType = bookLogoFileItem.getContentType();
		File file = bookLogoFileItem.getStoreLocation();
		ServiceContext serviceContext = ServiceContextFactory.getInstance(request);
		String title = new Date().getTime() + "logo";
		String description = "Logo for book";
		FileEntry fileEntry = DLAppServiceUtil.addFileEntry(repositoryId, folder.getFolderId(), title, mimeType, title,
				description, "", file, serviceContext);
		long companyId = themeDisplay.getCompanyId();
		setFileEntryPermissions(companyId, fileEntry);
		return DLFileEntryLocalServiceUtil.getDLFileEntry(fileEntry.getFileEntryId());
	}

	public static Folder getLibraryUploadsFolder(ThemeDisplay themeDisplay, PortletRequest request) {
		Folder folder = null;
		if (isFolderExist(themeDisplay)) {
			try {
				folder = DLAppServiceUtil.getFolder(themeDisplay.getScopeGroupId(), PARENT_FOLDER_ID, ROOT_FOLDER_NAME);
			} catch (PortalException | SystemException e) {
				log.error(e.getMessage());
			}
		} else {
			folder = createFolder(request, themeDisplay);
		}
		return folder;
	}

	private static Folder createFolder(PortletRequest request, ThemeDisplay themeDisplay) {
		boolean folderExist = isFolderExist(themeDisplay);
		Folder folder = null;
		if (!folderExist) {
			long repositoryId = themeDisplay.getScopeGroupId();
			try {
				ServiceContext serviceContext = ServiceContextFactory.getInstance(DLFolder.class.getName(), request);
				folder = DLAppServiceUtil.addFolder(repositoryId, PARENT_FOLDER_ID, ROOT_FOLDER_NAME,
						ROOT_FOLDER_DESCRIPTION, serviceContext);
				long companyId = themeDisplay.getCompanyId();
				setFolderPermissions(companyId, folder);
			} catch (PortalException | SystemException e1) {
				log.error(e1.getMessage());
			}
		}
		return folder;
	}

	private static boolean isFolderExist(ThemeDisplay themeDisplay) {
		boolean folderExist = false;
		try {
			DLAppServiceUtil.getFolder(themeDisplay.getScopeGroupId(), PARENT_FOLDER_ID, ROOT_FOLDER_NAME);
			folderExist = true;
			log.info("Folder is already exist");
		} catch (SystemException | PortalException e) {
			log.error(e.getMessage());
		}
		return folderExist;
	}

	private static void setFolderPermissions(long companyId, Folder folder) throws SystemException, PortalException {
		Role userRole = RoleLocalServiceUtil.getRole(companyId, RoleConstants.USER);
		ResourcePermissionLocalServiceUtil.setResourcePermissions(folder.getCompanyId(), DLFolder.class.getName(),
				ResourceConstants.SCOPE_INDIVIDUAL, String.valueOf(folder.getPrimaryKey()), userRole.getRoleId(),
				new String[] { ActionKeys.VIEW });
	}

	private static void setFileEntryPermissions(long companyId, FileEntry fileEntry) throws SystemException,
			PortalException {
		Role userRole = RoleLocalServiceUtil.getRole(companyId, RoleConstants.USER);
		ResourcePermissionLocalServiceUtil.setResourcePermissions(fileEntry.getCompanyId(), DLFileEntry.class.getName(),
				ResourceConstants.SCOPE_INDIVIDUAL, String.valueOf(fileEntry.getPrimaryKey()), userRole.getRoleId(),
				new String[] { ActionKeys.VIEW });
	}

}
