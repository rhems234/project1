package com.example.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

@Controller
public class ApiController {

	@GetMapping("/")
	public String home() {
		return "home3";
	}

    @GetMapping(value = "/test2", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getExhibitionInfoWithImages() throws IOException, ParserConfigurationException, SAXException{
        String key = "0OhBU7ZCGIobDVKDeBJDpmDRqK3IRNF6jlf/JB2diFAf/fR2czYO9A4UTGcsOwppV6W2HVUeho/FPwXoL6DwqA==";
        StringBuilder response = new StringBuilder();

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

                byte[] imageBytes = loadImageFromUrl(thumbnailUrl);

                response.append("전시회명 : ").append(title).append("<br/>");
                response.append("장소 : ").append(place).append("<br/>");
                response.append("시작일 : ").append(startDate).append("<br/>");
                response.append("종료일 : ").append(endDate).append("<br/>");
                response.append("분류 : ").append(realmName).append("<br/>");
                response.append("썸네일 이미지 : ").append(Base64.getEncoder().encodeToString(imageBytes)).append("<br/>");
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

    // 이미지 URL로부터 이미지 bytes를 로드하는 함수
    public byte[] loadImageFromUrl(String imageUrl) {
        byte[] imageBytes = null;
        try {
            URL url = new URL(imageUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setDoInput(true);
            connection.connect();
            InputStream inputStream = connection.getInputStream();
            BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream);
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            int bytesRead;
            byte[] buffer = new byte[1024];
            while ((bytesRead = bufferedInputStream.read(buffer)) != -1) {
                byteArrayOutputStream.write(buffer, 0, bytesRead);
            }
            imageBytes = byteArrayOutputStream.toByteArray();
            connection.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return imageBytes;
    }

}