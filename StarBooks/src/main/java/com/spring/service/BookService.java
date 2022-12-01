package com.spring.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.net.ssl.HttpsURLConnection;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.spring.book.BookDTO;


@Service
public class BookService {
	final String client_id = "YHirZaawV8b4DiL5mh0u";
	final String client_secret = "ahOm4vsHZl";
	final String urladdr1= "https://openapi.naver.com/v1/search/book.xml?";
	final String urladdr2= "https://openapi.naver.com/v1/search/book_adv.xml?";
//	public String search(String Query) {					// json으로 할 경우
//		try {
//			String query = URLEncoder.encode(Query,"UTF-8");
//			 URL url = new URL(urladdr1+"query="+query);
//			 HttpsURLConnection con= (HttpsURLConnection) url.openConnection();
//			con.setDoOutput(true);
//			con.setRequestMethod("GET");
//			con.setRequestProperty("X-Naver-Client-Id", client_id);
//			con.setRequestProperty("X-Naver-Client-Secret", client_secret);
//			int code = con.getResponseCode();
//			System.out.println(code);
//			
//		      BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
//		      String readline = null;
//		      StringBuffer response = new StringBuffer();
//		      while ((readline = br.readLine()) != null) {
//		          response.append(readline);
//		      }
//		      br.close();
//	      con.disconnect();
//	      
//	      System.out.println(xmlToJson(response.toString()));
//	     
//	      return xmlToJson(response.toString());
//	      
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return null;		
//	}
	
//	public String xmlToJson(String str) {
//	
//	try {
//		String xml = str;
//		JSONObject jObject = XML.toJSONObject(xml);
//		ObjectMapper mapper = new ObjectMapper();
//		mapper.enable(SerializationFeature.INDENT_OUTPUT);
//		Object json=mapper.readValue(jObject.toString(), Object.class);
//		String output = mapper.writeValueAsString(json);
//		System.out.println(output);
//		return output;
//	} catch (Exception e) {
//		// TODO: handle exception
//	}
//	return null;
//	
//}
	
	public ArrayList<BookDTO> search(@RequestParam(value="Query") String Query, Integer start)  {
		ArrayList<BookDTO> array = null;
		try {
			String query = URLEncoder.encode(Query,"UTF-8");
			 URL url = new URL(urladdr1+"query="+query + "&display=20&start="+start);			// 한페이지에 보이는 목록 수 : 15
			 HttpsURLConnection con= (HttpsURLConnection) url.openConnection();
			con.setDoOutput(true);
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", client_id);
			con.setRequestProperty("X-Naver-Client-Secret", client_secret);
			int code = con.getResponseCode();
			System.out.println(code);
			
		      BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		      String readline = null;
		      StringBuffer response = new StringBuffer();
		      while ((readline = br.readLine()) != null) {
		          response.append(readline);
		      }
		      br.close();
		      con.disconnect();
		      System.out.println(response.toString());
		      
		      DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		      DocumentBuilder db = dbf.newDocumentBuilder();
		      Document doc = db.parse(new InputSource(new StringReader(response.toString())));
		      doc.getDocumentElement().normalize();
		      System.out.println("root : " + doc.getDocumentElement().getNodeName());
		      
		      //파싱할 태그
		      NodeList nlist = doc.getElementsByTagName("item");
		      NodeList total = doc.getElementsByTagName("total");
		      System.out.println("전체 결과 : " + total.item(0).getTextContent());
		      int count = Integer.parseInt(total.item(0).getTextContent());
		      
		      array = new ArrayList<BookDTO>();
		      if(count != 0) {
		      for(int i= 0; i < nlist.getLength(); i++) {
		    	  BookDTO dto = new BookDTO();
		    	  Node node = nlist.item(i);
		    	  
		    	  if(node.getNodeType() == Node.ELEMENT_NODE) {
		    		Element element = (Element) node;
	//	    		System.out.println("제목  : " + getTagValue("title", element));
	//				System.out.println("저자  : " + getTagValue("author", element));
					dto.setAuthor(getTagValue("author", element));
					dto.setDescription(getTagValue("description", element));
					dto.setPublisher(getTagValue("publisher",element));
//					dto.setDiscount(Integer.parseInt(getTagValue("discount", element)));			// 없는 경우가 종종 있어서 따로 처리 해주던지, 일단 제외
					dto.setImage(getTagValue("image", element));
					dto.setIsbn(getTagValue("isbn", element));
					dto.setLink(getTagValue("link", element));
					dto.setPrice(Integer.parseInt( getTagValue("discount", element)));
					dto.setPubdate(getTagValue("pubdate", element));
					dto.setTitle(getTagValue("title", element));
					dto.setCount(count);
		    	  }
		    	  array.add(dto);
		      }
		      return array;
	      }
	      
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		}

		return null;		
	}
	

	
	// tag값의 정보를 가져오는 메소드
			private static String getTagValue(String tag, Element eElement) {
			    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
			    Node nValue = (Node) nlList.item(0);
			    if(nValue == null) 
			        return null;
			    return nValue.getNodeValue();
			}
			
	public ArrayList<BookDTO>bookList(String str, int cate, Integer start){
		
		ArrayList<BookDTO> array = null;
		//String url2 = "&d_catg="+cate+ "&display=20&start="+start;
		String url2 =  "&display=20&start="+start;
		array = naverBook(str,url2);
		return array;		
	}
	
	public ArrayList<BookDTO>bookListC(String str, int cate, Integer start){	
		//String url2 = "&d_catg="+cate+ "&sort=count&display=20&start="+start;
		String url2 = "&sort=sim&display=20&start="+start;
		return naverBook(str,url2);	
	}

	public ArrayList<BookDTO>bookListNew(String str, int cate, Integer start){		
		//String url2 = "&d_catg="+cate+ "&sort=date&display=20&start="+start;
		String url2 = "&sort=date&display=20&start="+start;
		return naverBook(str,url2);	
	}
	
	public ArrayList<BookDTO> naverBook(String str, String url2){
		ArrayList<BookDTO> array = null;
		try {
			String query = URLEncoder.encode(str,"UTF-8");
			URL url = new URL(urladdr2+"d_titl="+query + url2);			// 한페이지에 보이는 목록 수 : 15
			HttpsURLConnection con= (HttpsURLConnection) url.openConnection();
			con.setDoOutput(true);
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", client_id);
			con.setRequestProperty("X-Naver-Client-Secret", client_secret);
			int code = con.getResponseCode();
			System.out.println(code);
			
		     BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		     String readline = null;
		     StringBuffer response = new StringBuffer();
		     while ((readline = br.readLine()) != null) {
		          response.append(readline);
		     }
		     br.close();
		     con.disconnect();
		      
		     DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		     DocumentBuilder db = dbf.newDocumentBuilder();
		     Document doc = db.parse(new InputSource(new StringReader(response.toString())));
		     doc.getDocumentElement().normalize();
		      
		      //파싱할 태그
		      NodeList nlist = doc.getElementsByTagName("item");
		      NodeList total = doc.getElementsByTagName("total");
		      int count = Integer.parseInt(total.item(0).getTextContent());
		      array = new ArrayList<BookDTO>();
		     
		      if(count != 0) {
			      for(int i= 0; i < nlist.getLength(); i++) {
			    	  BookDTO dto = new BookDTO();
			    	  Node node = nlist.item(i);
			    	  
			    	  if(node.getNodeType() == Node.ELEMENT_NODE) {
			    		Element element = (Element) node;
		//	    		System.out.println("제목  : " + getTagValue("title", element));
		//				System.out.println("저자  : " + getTagValue("author", element));
						dto.setAuthor(getTagValue("author", element));
						dto.setDescription(getTagValue("description", element));
						dto.setPublisher(getTagValue("publisher",element));
		//				dto.setDiscount(Integer.parseInt(getTagValue("discount", element)));			// 없는 경우가 종종 있어서 따로 처리 해주던지, 일단 제외
						dto.setImage(getTagValue("image", element));
						dto.setIsbn(getTagValue("isbn", element));
						dto.setLink(getTagValue("link", element));
						dto.setPrice(Integer.parseInt( getTagValue("discount", element)));
						dto.setPubdate(getTagValue("pubdate", element));
						dto.setTitle(getTagValue("title", element));
						dto.setCount(count);
			    	  }
			    	  array.add(dto);
			      }
			      return array;
		    }
	      
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ParserConfigurationException e) {
				e.printStackTrace();
			} catch (SAXException e) {
				e.printStackTrace();
			}									
		return array;
	}
	

}

