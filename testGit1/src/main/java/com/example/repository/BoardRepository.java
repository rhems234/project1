package com.example.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
        String sql = "SELECT * FROM board ORDER BY id DESC";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                BoardVO board = new BoardVO();
                board.setId(rs.getString("id"));
                board.setNickname(rs.getString("nickname"));
                board.setTitle(rs.getString("title"));
                board.setGrade(rs.getString("grade"));
                board.setText(rs.getString("text"));
                boardList.add(board);
            }
        }

        return boardList;
    }

    // 글 작성
    public void insertBoard(BoardVO board) throws Exception {
        String sql = "INSERT INTO board(nickname, title, grade, text) VALUES (?, ?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, board.getNickname());
            pstmt.setString(2, board.getTitle());
            pstmt.setString(3, board.getGrade());
            pstmt.setString(4, board.getText());
            pstmt.executeUpdate();
        }
    }

 // 글 상세보기
    public BoardVO getBoard(String id) throws Exception {
        String sql = "SELECT * FROM board WHERE id = ?";
        BoardVO board;
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, Integer.parseInt(id));
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    board = new BoardVO();
                    board.setId(rs.getString("id"));
                    board.setNickname(rs.getString("nickname"));
                    board.setTitle(rs.getString("title"));
                    board.setGrade(rs.getString("grade"));
                    board.setText(rs.getString("text"));
                    return board;
                }
            }
        }
        return null;
    }

 // 글 수정
    public void updateBoard(BoardVO board) throws Exception {
        String sql = "UPDATE board SET nickname = ?, title = ?, garde = ?, text = ? WHERE id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, board.getNickname());
            pstmt.setString(2, board.getTitle());
            pstmt.setString(3, board.getGrade());
            pstmt.setString(4, board.getText());
            pstmt.setString(5, board.getId());
            pstmt.executeUpdate();
        }
    }

 // 글 삭제
    public void deleteBoard(String id) throws Exception {
        String sql = "DELETE FROM board WHERE id = ?";
        try (Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        }
    }


}
