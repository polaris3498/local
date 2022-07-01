package com.goodee.gdlibrary.util;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;
import java.util.regex.Matcher;

public class MyFileUtils {
		
		// 파일명을 UUID로 변환
	// . 은 모든 문자를 나타내므로 문자로 사용하려면 [.], \\. 으로 표기해야함
		public static String getUuidName(String filename) {
			// 확장자
			

			String extension = null;
			if(filename.endsWith("tar.gz")) {
				filename = "tar.gz";
			}else if(filename.endsWith("tar.bz2")) {
				filename = "tar.bz2";
			}else {
				String[] arr = filename.split("\\.");
				extension = filename.split("\\.")[arr.length - 1];
			}
			// 파일명(UUID) + 확장자
			return UUID.randomUUID().toString().replaceAll("-", "") + "." + extension;
		}
		
		
		// 오늘경로
		// 2022\\5\\31
		public static String getTodayPath() {
			Calendar calendar = Calendar.getInstance();
			int year = calendar.get(Calendar.YEAR);
			int month = calendar.get(Calendar.MONTH)+1;
			int day = calendar.get(Calendar.DAY_OF_MONTH);
			String sep = Matcher.quoteReplacement(File.separator);
			return "C:" + sep + "upload" + sep + year + sep + month + sep + day;
		}
		
		public static String getYesterdayPath() {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, -1);
			int year = calendar.get(Calendar.YEAR);
			int month = calendar.get(Calendar.MONTH)+1;
			int day = calendar.get(Calendar.DAY_OF_MONTH);
			String sep = Matcher.quoteReplacement(File.separator);
			return "C:" + sep + "upload" + sep + year + sep + month + sep + day;
		}
		
		
		
		
		
}
