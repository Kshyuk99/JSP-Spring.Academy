package chap03.spring;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class MemberDao {
	
	
	private JdbcTemplate jdbcTemplate;
	
	public MemberDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public MemberDao() {
		// TODO Auto-generated constructor stub
	}

	public Member selectByEmail(String email) {
		String sql = "select * from MEMBER where email =?";
		List<Member> results = jdbcTemplate.query("select * from MEMBER where email=?",
				new RowMapper<Member>() {

					@Override
					public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
						Member member = new Member(rs.getString("email"), rs.getString("password"), rs.getString("name"), rs.getTimestamp("regdate").toLocalDateTime());
						member.setId(rs.getLong("ID"));
						return member;
					}
			
		},
				email);
		return results.isEmpty() ? null : results.get(0);
		
	}

	public void insert(Member member) {
		String sql = "insert into MEMBER(email, password, name, regdate) values (?,?,?, now())";
		jdbcTemplate.update(sql, member.getEmail(), member.getPassword(), member.getName());

	}

	public void update(Member member) {
		String sql = "update set name=?, email =?, password=?, regdate=now() where id=?";
		jdbcTemplate.update(sql, member.getName(), member.getEmail(), member.getPassword(), member.getId() );

	}

	public List<Member> selectAll() {
		String sql = "select * from MEMBER";
//		List<Member> results = jdbcTemplate.query(sql, new RowMapper<Member>() {
//
//			@Override
//			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
//				Member member = new Member(rs.getString("email"), rs.getString("password"), rs.getString("name"), rs.getTimestamp("regdate").toLocalDateTime());
//				return member;
//			}
//			
//		});
		List<Member> results = jdbcTemplate.query(sql, ( rs, rowNum) -> {
				Member member = new Member(rs.getString("email"), rs.getString("password"), rs.getString("name"), rs.getTimestamp("regdate").toLocalDateTime());
				return member;			
		});
		return results;		
		
	}
//	public int count() {
//		Integer count = jdbcTemplate.queryForObject("select count(*) from MEMBER", Integer.class);
//		return count;
//	}
}