package com.example.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.BuyDTO;
import com.example.domain.MemberDTO;

@Repository
public class BuyRepository {

    @Autowired
    private DataSource dataSource;

    public MemberDTO findByUserIdAndPassword(String id, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO member = null;

        try {
            conn = dataSource.getConnection();

            pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=? AND password=?");
            pstmt.setString(1, id);
            pstmt.setString(2, password);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                member = new MemberDTO();
                member.setId(rs.getString("id"));
                member.setPassword(rs.getString("password"));
            }

            return member;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public void buy(HttpSession session, BuyDTO buy) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = dataSource.getConnection();

            MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
            String memberId = loginUser.getId();

            pstmt = conn.prepareStatement("INSERT INTO BUY(id, adult, child, title) VALUES(?, ?, ?, ?)");
            pstmt.setString(1, memberId);
            pstmt.setString(2, buy.getAdult());
            pstmt.setString(3, buy.getChild());
            pstmt.setString(4, buy.getTitle());

            pstmt.executeUpdate();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                }
            }
        }
    }
}
