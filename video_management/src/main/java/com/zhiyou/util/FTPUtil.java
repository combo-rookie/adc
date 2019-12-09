/**
 * 
 */
package com.zhiyou.util;

import java.io.IOException;
import java.io.InputStream;
import java.net.SocketException;

import org.apache.commons.net.ftp.FTPClient;

/**
 * @ClassName: FTPUtil
 * @Description: TODO
 * @author Administrator
 * @date 2019年11月28日
 *
 */
public class FTPUtil {

	public static String upload(InputStream input, String fileName) {
		fileName = System.currentTimeMillis() + fileName;
		// 1:实例化ftpClient
		FTPClient ftp = new FTPClient();
		String url = "ftp://192.168.124.81/";
		// 2:连接服务器
		try {
			ftp.connect("192.168.124.81");
			// 3:根据账号密码登录服务器，
			ftp.login("admin", "123");
			// 4：更改客户端模式
			ftp.enterLocalPassiveMode();
			// 5:设置文件上传到服务器的位置
			ftp.changeWorkingDirectory("/");
			// 6:设置文件的类型
			ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
			// 7:长传文件
			ftp.storeFile(fileName, input);
			return url + fileName;
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				ftp.logout();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
}
