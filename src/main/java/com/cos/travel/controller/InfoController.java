package com.cos.travel.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class InfoController {
    public static int PRETTY_PRINT_INDENT_FACTOR = 4;
	
	@GetMapping("/etc/vcinfo")
	@ResponseBody
	public String vaccineInfo() throws IOException {
		Calendar cal = Calendar.getInstance();
		String format ="yyyyMMdd";
		
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		cal.add(cal.DATE, -1);
		String yesterday = sdf.format(cal.getTime());
		
		Calendar cal2 = Calendar.getInstance();
		String format2 ="yyyyMMdd";
		SimpleDateFormat sdf2 = new SimpleDateFormat(format2);
		String today = sdf2.format(cal2.getTime());
		
        StringBuilder urlBuilder = new StringBuilder("https://nip.kdca.go.kr/irgd/cov19stats.do?list=sido"); /*URL*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        String result = sb.toString();
        JSONObject xmlJSONObj = XML.toJSONObject(result);
        String jsonPrettyPrintString = xmlJSONObj.toString(PRETTY_PRINT_INDENT_FACTOR);
        
		return jsonPrettyPrintString;
	}
	
	// 코로나 화면
	@GetMapping("/etc/info")
	public String corona() {
		return "etc/info";
	}
}