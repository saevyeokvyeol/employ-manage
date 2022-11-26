package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;
import vo.Employee;
import vo.Paging;

@Component
@RequiredArgsConstructor
public class EmployeeDao {
	private final SqlSession sqlSession;
	
	/**
	 * 직원 등록
	 * @param: Employee(employeeName, employeeTel, employeePosition, employeeEmail)
	 * @return: int(insert 결과)
	 * */
	public int insertEmployee(Employee employee) throws SQLException {
		return sqlSession.insert("employeeMapper.insertEmployee", employee);
	}
	
	/**
	 * 직원 수정
	 * @param: Employee(employeeId, employeeName, employeeTel, employeePosition, employeeEmail)
	 * @return: int(update 결과)
	 * */
	public int updateEmployee(Employee employee) throws SQLException {
		return sqlSession.update("employeeMapper.updateEmployee", employee);
	}
	
	/**
	 * 직원 삭제
	 * @param: Long employeeId
	 * @return: int(delete 결과)
	 * */
	public int deleteEmployee(Long employeeId) throws SQLException {
		return sqlSession.delete("employeeMapper.deleteEmployee", employeeId);
	}
	
	/**
	 * 직원 목록 조회
	 * : 파라미터로 들어온 employee의 필드 값이 있을 경우 검색, 없을 경우 전체 조회
	 * @param: Employee(employeeId, employeeName, employeeTel, employeePosition, employeeEmail) 중 입력된 값에 따라 동적으로 검색
	 * @return: List<Employee>
	 * */
	public List<Employee> findEmployees(Employee employee, Paging paging) throws SQLException {
		Paging.totalCount = this.getTotalCount(employee);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employee", employee);
		
		int start = (paging.getPageNum() - 1) * paging.pageSize + 1;
		int end = paging.getPageNum() * paging.pageSize;
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("employeeMapper.findEmployees", map);
	}
	
	/**
	 * 페이징 처리를 위한 전체 레코드 수 가져오기
	 * @param: Employee(employeeId, employeeName, employeeTel, employeePosition, employeeEmail) 중 입력된 값에 따라 동적으로 검색
	 * @return: int(페이지 수)
	 * */
	private int getTotalCount(Employee employee) throws SQLException {
		return sqlSession.selectOne("employeeMapper.getTotalCount", employee);
	}
	
	/**
	 * 아이디로 직원 조회
	 * @param: Long employeeId
	 * @return: Employee
	 * */
	public Employee findEmployeeByEmployeeId(Long employeeId) throws SQLException {
		return sqlSession.selectOne("employeeMapper.findEmployeeByEmployeeId", employeeId);
	}
	
	/**
	 * 직원 번호로 직원 조회
	 * @param: String employeeNumber
	 * @return: Employee
	 * */
	public Employee findEmployeeByEmployeeNumber(String employeeNumber) throws SQLException {
		return sqlSession.selectOne("employeeMapper.findEmployeeByEmployeeNumber", employeeNumber);
	}
}
