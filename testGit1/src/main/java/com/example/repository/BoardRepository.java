package com.example.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.BoardVO;
import com.example.domain.BoardVO;
import com.example.domain.BoardVO;

@Repository
public class BoardRepository {

   private DataSource dataSource;

    @Autowired
    public BoardRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

 // 모든 글 목록 가져오기
    public List<BoardVO> getBoardList() throws Exception {
        List<BoardVO> boardList = new ArrayList<>();
        String sql = "SELECT * FROM board ORDER BY title DESC";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                BoardVO board = new BoardVO();
                board.setTitle(rs.getString("title"));
                board.setThumbnail(rs.getString("thumbnail"));
                board.setNickname(rs.getString("nickname"));
                board.setText(rs.getString("text"));
                board.setGrade(rs.getString("grade"));
                boardList.add(board);
            }
        }

        return boardList;
    }

    // 글 작성
    public void insertBoard(BoardVO board) throws Exception {
        String sql = "INSERT INTO BOARD (num, NICKNAME, TITLE, TEXT, GRADE) VALUES(board_seq.NEXTVAL, ?, ?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
           
           pstmt.setString(1, board.getNickname());
            pstmt.setString(2, board.getTitle());
            pstmt.setString(3, board.getText());
            pstmt.setString(4, board.getGrade());
            
            pstmt.executeUpdate();
        }
    }
    
    //티켓 페이지
    public List<BoardVO> board(String title) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardVO> list = new ArrayList<BoardVO>();

        try {
            conn = dataSource.getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM Board WHERE title = ?");
            pstmt.setString(1, title);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                BoardVO BoardVO = new BoardVO();
                BoardVO.setNickname(rs.getString("nickname"));
                BoardVO.setText(rs.getString("text"));
                BoardVO.setGrade(rs.getString("grade"));
                BoardVO.setTitle(rs.getString("title"));
                BoardVO.setNum(rs.getInt("num"));
                list.add(BoardVO);
            }
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
        
        return list; 
    }
    
    
    

 // 글 상세보기
    public BoardVO getBoard(String id) throws Exception {
        String sql = "SELECT * FROM board WHERE title = ?";
        BoardVO board;
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, Integer.parseInt(id));
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    board = new BoardVO();
                    board.setTitle(rs.getString("title"));
                    board.setThumbnail(rs.getString("thumbnail"));
                    board.setNickname(rs.getString("nickname"));
                    board.setText(rs.getString("text"));
                    board.setGrade(rs.getString("grade"));
                    return board;
                }
            }
        }
        return null;
    }

 // 글 수정
    public void updateBoard(BoardVO board) throws Exception {
        String sql = "UPDATE board SET title = ?, thumbnail = ?, nickname= ?, text = ? WHERE id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
           pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getThumbnail());
            pstmt.setString(3, board.getNickname());
            pstmt.setString(4, board.getText());
            pstmt.setString(5, board.getGrade());
            pstmt.executeUpdate();
        }
    }

 // 글 삭제
    public void deleteBoard(String id) throws Exception {
        String sql = "DELETE FROM board WHERE title = ?";
        try (Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        }
    }


}