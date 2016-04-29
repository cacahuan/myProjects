package com.tz.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

/**
 * 闊充箰姝岃瘝瑙ｆ瀽宸ュ叿绫�
 * @author arry
 * @version v1.0
 * 
 */
public class MusicUtil{

	/**
	 * 鑾峰彇闊充箰姝岃瘝
	 * @param request 鏈嶅姟鍣ㄨ姹�
	 * @return String 姝岃瘝
	 *  
	 */
	public static String getLrc(HttpServletRequest request){
		
		// 瀛樺偍姝岃瘝鐨勫鍣�
		StringBuffer buffer = new StringBuffer();
		
		// 鑾峰彇闊充箰鍚嶇О
		String name = request.getParameter("name");
		// 鑾峰彇闊充箰瀵瑰簲鐨勬瓕璇嶈矾寰�
		String filePath = request.getSession().getServletContext().getRealPath("/mp3")+"/"+name+".lrc"; 
		
		FileInputStream ins = null;
		InputStreamReader isr = null;
		BufferedReader bf = null;
		
		try{
			// 寮�璇诲彇姝岃瘝鏂囦欢
			ins = new FileInputStream(filePath);
			isr = new InputStreamReader(ins, "utf-8");
			// 鑾峰彇姝岃瘝缂撳啿娴侊紝杩涜璇诲彇
			bf = new BufferedReader(isr);
			String temp = null;
			while((temp = bf.readLine()) != null){
				buffer.append(temp+"\n");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			if(bf != null){
				try {
					bf.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(ins != null){
				try {
					ins.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}
		return buffer.toString();
	}
	
	
	public static void main(String[] args){
		
		System.out.println("浜茬埍鐨勫悓瀛︿滑锛屽ぇ瀹舵櫄涓婂ソ锛�鎴戠埍浣犱滑 ^_^");
		
	}
	
}
