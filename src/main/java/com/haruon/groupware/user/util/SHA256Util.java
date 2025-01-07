package com.haruon.groupware.user.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256Util {
	public static String encoding(String str) {
		String result = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(str.getBytes());
			StringBuffer sb = new StringBuffer();
			for(byte b : md.digest()) {
				sb.append(String.format("%02x",b));
			}
			result = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			new RuntimeException(e);
		}
	
	return result;
}

	
}
