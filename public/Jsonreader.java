package main;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

public class Jsonreader {

	public static void main(String[] args) throws Exception{
		ArrayList<String> reviews = new ArrayList<String>();
		File rfile = new File(args[0]);
		FileInputStream rfis = new FileInputStream(rfile);
		BufferedInputStream rbis = new BufferedInputStream(rfis);
		BufferedReader rd= new BufferedReader(new InputStreamReader(rbis));		
		String rline = "";
		PrintWriter out5 = new PrintWriter(new FileWriter("../../reviewsparsed2.json")); 
		while((rline = rd.readLine())!=null)
		{	
				
				String business1 = rline += ",";
/*				String[] business2 = business1.split("\"votes\": ");
				String[] business3 = business2[1].split("\"user_id\":");
				String business4 = business2[0] + "\"user_id\":" + business3[1];
				String[] business5 = business4.split("\"type\": ");
				String[] business6 = business5[1].split("\"business_id\":");
				String business7 = business5[0] + "\"business_id\":" + business6[1];
				*/out5.println(business1);

			
		}	
		rfis.close();
		rbis.close();
		rd.close();
		

		out5.close();
			
			
		/*ArrayList<String> businesses = new ArrayList<String>();
		File file = new File("business.json");
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream bis = new BufferedInputStream(fis);
		BufferedReader d= new BufferedReader(new InputStreamReader(bis));		
		String line = "";
		while((line = d.readLine())!=null)
		{	
				businesses.add(line + ",");
			

			
		}	
		fis.close();
		bis.close();
		d.close(); 
		
		PrintWriter out4 = new PrintWriter(new FileWriter("business2.json")); 

		for(int i = 0; i < businesses.size(); i++){
			String business1 = businesses.get(i); 
			String[] business2 = business1.split("\"schools\": ");
			String[] business3 = business2[1].split("\"open\":");
			String business4 = business2[0] + "\"open\":" + business3[1];
			String[] business5 = business4.split("\"categories\": ");
			String[] business6 = business5[1].split("\"photo_url\":");
			String business7 = business5[0] + "\"photo_url\":" + business6[1];
			String[] business8 = business7.split("\"neighborhoods\": ");
			String[] business9 = business8[1].split("\"url\":");
			String business10 = business8[0] + "\"url\":" + business9[1];
			String business11 = business10.replace(", \"type\": \"business\"", "");
			out4.println(business11);

		}
		out4.close();
		
		ArrayList<String> business_category = new ArrayList<String>();
		Set<String> categories = new HashSet<String>();
		for(int i=0; i<businesses.size(); i++){
			String business=businesses.get(i);
			String[] biz = business.split(",");
			String bizid = biz[0].substring(16, biz[0].length()-1);
			String[] cat = business.split("\"categories\": ");
			String[] categoryset= cat[1].substring(1, cat[1].length()-1).trim().split("],");
			String[] category = categoryset[0].trim().split("\",");
			for(int j=0; j<category.length; j++){
				categories.add(category[j].trim().replace("\"", ""));
				String bizschool=  bizid.trim().replace("\"", "") + ", " + category[j].trim().replace("\"", "");
				business_category.add(bizschool);
			}
		}
		System.out.println("Categories:");

		PrintWriter out1 = new PrintWriter(new FileWriter("categories.txt")); 

		for(String s: categories){
			out1.println(s);

		}
		out1.close();
		PrintWriter out3 = new PrintWriter(new FileWriter("business_categories.txt")); 
		for(String s: business_category){
			out3.println(s);
		}
		out3.close();
		
		ArrayList<String> business_school = new ArrayList<String>();
		Set<String> schools = new HashSet<String>();
		for(int i=0; i<businesses.size(); i++){
			String business=businesses.get(i);
			String[] biz = business.split(",");
			String bizid = biz[0].substring(16, biz[0].length()-1);
			String[] sch = business.split("\"schools\": ");
			String[] schoolset= sch[1].substring(1, sch[1].length()-1).split("],");
			String[] school = schoolset[0].split(",");
			for(int j=0; j<school.length; j++){
				schools.add(school[j].trim().replace("\"", ""));
				String bizschool= bizid.trim().replace("\"", "") + ", " + school[j].trim().replace("\"", "");
				business_school.add(bizschool);
			}
		}
		System.out.println("Schools:");
		PrintWriter out = new PrintWriter(new FileWriter("schools.txt")); 
		for(String s: schools){
			out.println(s);
			//System.out.println(s);
		}
		out.close();
		PrintWriter out2 = new PrintWriter(new FileWriter("business_schools.txt")); 

		for(String s: business_school){
			out2.println(s);
		}
		out2.close();*/
	}
}


