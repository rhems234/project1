package com.example.controller;

import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@Controller
public class BuyController {
    
    @PostMapping("/buy")
    public String buy(HttpSession session,
                      @RequestParam("adult") int adult,
                      @RequestParam("child") int child,
                      @RequestParam("title") String title,
                      Model model) {

        String sessionId = (String) session.getAttribute("sessionId");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DataSourceUtils.getConnection(dataSource);
            pstmt = conn.prepareStatement("INSERT INTO BUY (ID, ADULT, CHILD, TITLE) VALUES(?, ?, ?, ?)");
            pstmt.setString(1, sessionId);
            pstmt.setInt(2, adult);
            pstmt.setInt(3, child);
            pstmt.setString(4, title);
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                model.addAttribute("msg", "0");
                return "redirect:/resultbuy.jsp";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            DataSourceUtils.releaseConnection(conn, dataSource);
        }

        // DB insert 실패 시 예외 처리
        model.addAttribute("msg", "-1");
        return "redirect:/resultbuy.jsp";
    }
}
