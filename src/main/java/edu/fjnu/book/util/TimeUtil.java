package edu.fjnu.book.util;

import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 时间相关工具类
 * @author hspcadmin
 *
 */
public class TimeUtil {
	//获取当前时间
	public static String getCurrentTime(){
		Date date = new Date();  
        SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//24小时制  
        String time = sdformat.format(date);  
        //System.out.println(LgTime);  
        return time;
	}
	
	public static void main(String[] args) {
		System.out.println(getCurrentTime());
	}
}
