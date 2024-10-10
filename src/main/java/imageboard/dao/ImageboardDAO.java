package imageboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import imageboard.bean.ImageboardDTO;

public class ImageboardDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds; // 커넥션풀을 관리하는 클래스

	public ImageboardDAO() {
		Context context;
		try {
			context = new InitialContext();
			// 톰캣인 경우, 자바에서 DataSource 객체를 찾을 경우,
			// 반드시 커넥션풀 설정 앞에, "java:comp/env/"를 붙여야한다.
			// 이것은 context.xml -> <Context> -> <Resource> -> name
			// 속성 까지를 나타낸다.
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// db 접속 끊기
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// insert
	public int imageboardWrite(ImageboardDTO dto) {
		int result = 0;
		String sql = "insert into imageboard values " + "(seq_imageboard.nextval, ?,?,?,?,?,?,sysdate)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getImageId());
			pstmt.setString(2, dto.getImageName());
			pstmt.setInt(3, dto.getImagePrice());
			pstmt.setInt(4, dto.getImageQty());
			pstmt.setString(5, dto.getImageContent());
			pstmt.setString(6, dto.getImage1());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 목록보기
	public List<ImageboardDTO> imageboardList(int startNum, int endNum) {
		List<ImageboardDTO> list = new ArrayList<ImageboardDTO>();
		String sql = "select * from " + " (select rownum rn, tt.* from "
				+ " (select * from imageboard order by seq desc) tt) " + " where rn >= ? and rn <=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ImageboardDTO dto = new ImageboardDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setImageId(rs.getString("imageId"));
				dto.setImageName(rs.getString("imageName"));
				dto.setImagePrice(rs.getInt("imagePrice"));
				dto.setImageQty(rs.getInt("imageQty"));
				dto.setImageContent(rs.getString("imageContent"));
				dto.setImage1(rs.getString("image1"));
				dto.setLogtime(rs.getString("logtime"));
				// 리스트에 저장
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) as cnt from imageboard";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				totalA = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return totalA;
	}

	// 상세보기 : 1줄데이터
	public ImageboardDTO imageboardView(int seq) {
		ImageboardDTO dto = null;
		String sql = "select * from imageboard where seq=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new ImageboardDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setImageId(rs.getString("imageId"));
				dto.setImageName(rs.getString("imageName"));
				dto.setImagePrice(rs.getInt("imagePrice"));
				dto.setImageQty(rs.getInt("imageQty"));
				dto.setImageContent(rs.getString("imageContent"));
				dto.setImage1(rs.getString("image1"));
				dto.setLogtime(rs.getString("logtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	// 삭제하기
	public int imageboardDelete(int seq) {
		int result = 0;
		String sql = "delete imageboard where seq=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 수정하기
	public int imageboardModify(ImageboardDTO dto) {
		int result = 0;
		String sql = " update imageboard set imageId=?, imageName=?, imagePrice=?, imageQty=?, " 
				   + " imagecontent=?, image1=? where seq=?" ;
		try {
	    	// 1. db 접속하기
		    conn = ds.getConnection();
	    	// 2. db 작업
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getImageId());
	        pstmt.setString(2, dto.getImageName());
	        pstmt.setInt(3, dto.getImagePrice());
	        pstmt.setInt(4, dto.getImageQty());
	        pstmt.setString(5, dto.getImageContent());
	        pstmt.setInt(6, dto.getSeq());
	        
	        result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 3. 접속끊기
			close();
		}
	    return result;
	}
	
	
    
}
