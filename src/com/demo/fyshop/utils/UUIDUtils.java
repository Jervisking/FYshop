package com.demo.fyshop.utils;

import java.util.UUID;

/**
 * 随机字符串(UUID)工具类
 * 
 * @author wanghuanjie
 * 
 */
public class UUIDUtils {
	// 随机字符串
	public static String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
}
