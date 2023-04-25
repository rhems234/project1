package com.example.controller;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

@Controller
@RequestMapping("/api")
public class ApiController {

    @GetMapping(value = "/test2", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String getExhibitionInfo() {
        String key = "0OhBU7ZCGIobDVKDeBJDpmDRqK3IRNF6jlf/JB2diFAf/fR2czYO9A4UTGcsOwppV6W2HVUeho/FPwXoL6DwqA==";
        StringBuilder response = new StringBuilder();

        try {
            int numOfRows=10;
            int pageNo = 1;

            String url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period"
                    + "?ServiceKey=" + key
                    + "&numOfRows=" + numOfRows
                    + "&pageNo=" + pageNo;

            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(url);

            doc.getDocumentElement().normalize();

            NodeList nList = doc.getElementsByTagName("perforList");

            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);
                Element eElement = (Element) nNode;

                String title = getTagValue("title", eElement);
                String place = getTagValue("place", eElement);
                String startDate = getTagValue("startDate", eElement);
                String endDate = getTagValue("endDate", eElement);
                String realmName = getTagValue("realmName", eElement);
                String thumbnailUrl = getTagValue("thumbnail","http://www.culture.go.kr/upload/rdf/20/12/rdf_202012311432049249.jpg", eElement);

                response.append("전시회명 : ").append(title).append("<br/>");
                response.append("장소 : ").append(place).append("<br/>");
                response.append("시작일 : ").append(startDate).append("<br/>");
                response.append("종료일 : ").append(endDate).append("<br/>");
                response.append("분류 : ").append(realmName).append("<br/>");
                response.append("썸네일 URL : ").append(thumbnailUrl).append("<br/>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return response.toString();
    }

    // tag값의 정보를 가져오는 함수
    public static String getTagValue(String tag, Element eElement) {
        String result = "";
        NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
        result = nlList.item(0).getTextContent();
        return result;
    }

    // tag값의 정보를 가져오는 함수
    public static String getTagValue(String tag, String childTag, Element eElement) {
        String result = "";
        NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
        for (int i = 0; i < eElement.getElementsByTagName(childTag).getLength(); i++) {
            result += eElement.getElementsByTagName(childTag).item(i).getTextContent();
            if (i < eElement.getElementsByTagName(childTag).getLength() - 1) {
                result += ", ";
            }
        }
        return result;
    }
}
