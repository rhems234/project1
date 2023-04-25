package com.example.controller;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class ApiExTest {

	// tag값의 정보를 가져오는 함수
	public static String getTagValue(String tag, Element eElement) {

		// 결과를 저장할 result 변수 선언
		String result = "";

		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

		result = nlList.item(0).getTextContent();

		return result;
	}

	// tag값의 정보를 가져오는 함수
	public static String getTagValue(String tag, String childTag, Element eElement) {

		// 결과를 저장할 result 변수 선언
		String result = "";

		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

		for (int i = 0; i < eElement.getElementsByTagName(childTag).getLength(); i++) {

			// result += nlList.item(i).getFirstChild().getTextContent() + " ";
			result += nlList.item(i).getChildNodes().item(0).getTextContent() + " ";
		}

		return result;
	}

	public static void main(String[] args) {

		// 본인이 받은 api키를 추가
		String key = "0OhBU7ZCGIobDVKDeBJDpmDRqK3IRNF6jlf/JB2diFAf/fR2czYO9A4UTGcsOwppV6W2HVUeho/FPwXoL6DwqA==";

		try {
			// parsing할 url 지정(API 키 포함해서)
			String url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period"
					+ "?ServiceKey=" + key; // 수정된 부분: 전시회 API URL에 서비스 키 추가

			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// 제일 첫번째 태그
			doc.getDocumentElement().normalize();

			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("perforList"); // 수정된 부분: 전시회 정보가 담긴 태그명 변경

			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);

				Element eElement = (Element) nNode;

				System.out.println("전시회명 : " + getTagValue("title", eElement)); // 수정된 부분: 필요한 정보에 맞게 태그명 변경
				System.out.println("장소 : " + getTagValue("place", eElement)); // 수정된 부분: 필요한 정보에 맞게 태그명 변경
				System.out.println("시작일 : " + getTagValue("startDate", eElement)); // 수정된 부분: 필요한 정보에 맞게 태그명 변경
				System.out.println("종료일 : " + getTagValue("endDate", eElement));
				System.out.println("분류 : " +getTagValue("realmName", eElement));
				System.out.println("썸네일 URL : " +getTagValue("thumbnail", "http://www.culture.go.kr/upload/rdf/20/12/rdf_202012311432049249.jpg" ,eElement));
				System.out.println();
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}