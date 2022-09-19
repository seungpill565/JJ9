package com.spring.jj9.add.controller;

import java.io.File;
import java.io.IOException;

public class Practice {
	
	public static void main(String[] args) {
		
		File f = new File("");
		
		System.out.println("ab : " + f.getAbsolutePath() + "\\src\\main\\webapp\\resources\\iamages");
		try {
			System.out.println("ca : " + f.getCanonicalPath());
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("get : " + f.getPath());
		
	}
}
