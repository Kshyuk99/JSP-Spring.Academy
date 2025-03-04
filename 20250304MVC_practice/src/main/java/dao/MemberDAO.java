package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



import dto.Member;
import util.DBConnection;



public class MemberDAO {
	
	
	
	 public void insert(Member dto) {
	        String sql = "INSERT INTO Member (username, age) VALUES (?, ?)";
	        
	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            
	            pstmt.setString(1, dto.getUsername());
	            pstmt.setInt(2, dto.getAge());	            
	            pstmt.executeUpdate();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	 
	//  목록 조회
	    public List<Member> getList() {
	        List<Member> list = new ArrayList<>();
	        String sql = "SELECT * FROM member ORDER BY username";
	        
	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql);
	             ResultSet rs = pstmt.executeQuery()) {
	            
	            while (rs.next()) {
	            	Member dto = new Member(rs.getString("username"), rs.getInt("age"));      
	                list.add(dto);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	    }
	    
	    public void update(Member dto) {
	        String sql = "UPDATE member SET username=? WHERE age=?";
	        
	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            
	            pstmt.setString(1, dto.getUsername());	            
	            pstmt.setInt(2, dto.getAge());
	            pstmt.executeUpdate();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    public void delete(int age) {
	        String sql = "DELETE FROM member WHERE age=?";
	        
	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            
	            pstmt.setInt(1, age);
	            pstmt.executeUpdate();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

}
