package ru.tiis.library.service.constants;

public class LibraryConstants {
	public static enum GoogleDriveCredentials {
		TEST_CREDENTIALS(0, "baibousm@gmail.com", "89068260511cfif");
		
		private final long id;
		private final String accountName;
		private final String password;
		
		private GoogleDriveCredentials(long id, String accountName, String password) {
			this.id = id;
			this.accountName = accountName;
			this.password = password;
		}
		
		public long getId() {
			return id;
		}
		
		public String getAccountName() {
			return accountName;
		}
		
		public String getPassword() {
			return password;
		}
		
	}
}
