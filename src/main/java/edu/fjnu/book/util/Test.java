package edu.fjnu.book.util;

public class Test {
	public static void main(String[] args) {
		String text = "http://10.24.1.106:8080/Book/admin/login.action";
		try {
			QRCodeUtil.encode(text, "D:\\testUpdate\\dico.png", "D:/testUpdate/img", true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
