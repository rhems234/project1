package com.example.controller;

import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

@RestController
public class ApiController {

	@ResponseBody
	@GetMapping(value = "/test2", produces = "application/html; charset=UTF-8")
    public String getExhibitionInfoWithImages() throws IOException, ParserConfigurationException, SAXException, JSONException {
        String key = "0OhBU7ZCGIobDVKDeBJDpmDRqK3IRNF6jlf/JB2diFAf/fR2czYO9A4UTGcsOwppV6W2HVUeho/FPwXoL6DwqA==";
        JSONArray jsonArray = new JSONArray();

        try {
            String url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period"
                    + "?ServiceKey=" + key;

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
                String thumbnailUrl = getTagValue("thumbnail", eElement);

                JSONObject jsonObj = new JSONObject();
                jsonObj.put("title", title);
                jsonObj.put("place", place);
                jsonObj.put("startDate", startDate);
                jsonObj.put("endDate", endDate);
                jsonObj.put("realmName", realmName);
                jsonObj.put("thumbnail", thumbnailUrl);
                jsonArray.put(jsonObj);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return jsonArray.toString();
    }

    // tag값의 정보를 가져오는 함수
    public static String getTagValue(String tag, Element eElement) {
        String result = "";
        NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
        result = nlList.item(0).getTextContent();
        return result;
    }
}