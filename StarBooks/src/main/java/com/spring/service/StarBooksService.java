package com.spring.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.spring.book.StarBookDTO;
import com.spring.book.StarBooksDAO;

@Service
public class StarBooksService {

	@Autowired private StarBooksDAO dao;
	private String key = "14932CE9F0C4FA4F4FB88DDAAF8AD2B93FD65DD9663AB56FE4C294134EA543E5";
	public String testDB() {
		return dao.test();
	}

	
	public List<StarBookDTO> bestSeller() {				// 베스트셀러
		String url = "http://book.interpark.com/api/bestSeller.api?key=" + key +"&categoryId=100&output=xml";
		return getList(url, 1);
	}
	
	public List<StarBookDTO> newBook() {				// 신간도서
		String url = "https://book.interpark.com/api/newBook.api?key=" + key +"&categoryId=100&output=xml";
		return getList(url, 0);
	}
	
	public List<StarBookDTO> recommend() {				// 추천도서
		String url = "https://book.interpark.com/api/recommend.api?key=" + key +"&categoryId=100&output=xml";
		return getList(url, 0);
	}
	
	public List<StarBookDTO> weekPick(int num) {						// 역사 베스트셀러
		String url = "http://book.interpark.com/api/bestSeller.api?key=" + key +"&categoryId=" + num + "&output=xml";
		return getList(url, 1);
	}
	
	public List<StarBookDTO> getList(String url, int num) {
		ArrayList<StarBookDTO> array = new ArrayList<StarBookDTO>();

		try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db;
			db = dbf.newDocumentBuilder();
			Document doc = db.parse(url);
			
			// root tag
			doc.getDocumentElement().normalize();
//			System.out.println("root : " + doc.getDocumentElement().getNodeName());
			
			//파싱할 tag
			NodeList nlist = doc.getElementsByTagName("item");
			for(int i = 0;  i < nlist.getLength(); i++) {
				StarBookDTO dto = new StarBookDTO();
				Node node = nlist.item(i);
				if(node.getNodeType() == Node.ELEMENT_NODE) {
					Element element = (Element) node;
					dto.setAuthor(getTagValue("author", element));
					dto.setCoverSmallUrl(getTagValue("coverSmallUrl", element));
					dto.setCoverLargeUrl(getTagValue("coverLargeUrl", element));
					dto.setDescription(getTagValue("description", element));
					dto.setPriceStandard(Integer.parseInt( getTagValue("priceStandard", element)));
					dto.setPubDate(getTagValue("pubDate", element));
					dto.setPublisher(getTagValue("publisher", element));
					if(num == 1) {			// rank가 있는 경우에만 set
					dto.setRank(Integer.parseInt( getTagValue("rank", element)));
					}
					dto.setTitle(getTagValue("title", element));
				}
				array.add(dto);
			}
			return array;
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
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


			

			

			
}
