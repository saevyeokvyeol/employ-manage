package service;

import java.sql.SQLException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.EmployeeDao;
import lombok.RequiredArgsConstructor;
import vo.Employee;
import vo.Paging;

@Service
@Transactional
@RequiredArgsConstructor
public class EmployeeService {
	private final EmployeeDao employeeDao;

	/**
	 * 직원 등록
	 * @param: Employee(employeeId, employeeName, employeeTel, employeePosition, employeeEmail)
	 * */
	public void insertEmployee(Employee employee) throws Exception {
		this.validation(employee);
		if (employeeDao.findEmployeeByEmployeeNumber(employee.getEmployeeNumber()) != null)
			throw new Exception("직원번호가 중복되어 직원을 등록할 수 없습니다.");
		int result = employeeDao.insertEmployee(employee);
		if (result != 1) throw new SQLException("직원 등록을 실패했습니다.");
	}

	/**
	 * 직원 수정
	 * @param: Employee(employeeId, employeeName, employeeTel, employeePosition, employeeEmail)
	 * */
	public void updateEmployee(Employee employee) throws Exception {
		this.validation(employee);
		int result = employeeDao.updateEmployee(employee);
		if (result != 1) throw new SQLException("직원 수정을 실패했습니다.");
	}
	
	/**
	 * 직원 유효성 체크
	 * @param: Employee(employeeId, employeeName, employeeTel, employeePosition, employeeEmail)
	 * */
	public void validation(Employee employee) throws Exception {
		Pattern numberPattern = Pattern.compile("\\d{3}");
        Matcher numberMatcher = numberPattern.matcher(employee.getEmployeeNumber());
		Pattern telPattern = Pattern.compile("\\d{3}-\\d{4}-\\d{4}");
        Matcher telMatcher = telPattern.matcher(employee.getEmployeeTel());
		Pattern emailPattern = Pattern.compile("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$");
        Matcher emailMatcher = emailPattern.matcher(employee.getEmployeeEmail());
        
		if (!numberMatcher.matches()) throw new Exception("직원번호 형식이 잘못되었습니다.");
		
		if (employee.getEmployeeName() == null || employee.getEmployeeName().equals(""))
			throw new Exception("직원 이름이 입력되지 않았습니다.");
		
		if (!telMatcher.matches()) throw new Exception("전화번호 형식이 잘못되었습니다.");

		if (!emailMatcher.matches()) throw new Exception("이메일 형식이 잘못되었습니다.");
	}
	
	/**
	 * 직원 삭제
	 * @param: Long employeeId
	 * */
	public void deleteEmployee(Long employeeId) throws SQLException {
		int result = employeeDao.deleteEmployee(employeeId);
		
		if (result != 1) throw new SQLException("직원 삭제를 실패했습니다.");
	}
	
	/**
	 * 직원 목록 조회
	 * : 파라미터로 들어온 employee의 필드 값이 있을 경우 검색, 없을 경우 전체 조회
	 * @param: Employee(employeeId, employeeName, employeeTel, employeePosition, employeeEmail 중 입력된 값에 따라 동적으로 검색)
	 * 		   Paging(PageNum, pageSize에 맞춰 페이징 처리)
	 * @return: List<Employee>
	 * */
	public List<Employee> findEmployee(Employee employee, Paging paging) throws SQLException {
		return employeeDao.findEmployees(employee, paging);
	}
	
	/**
	 * 아이디로 직원 조회
	 * @param: Long employeeId
	 * @return: Employee
	 * */
	public Employee findEmployeeByEmployeeId(Long employeeId) throws SQLException {
		Employee employee = employeeDao.findEmployeeByEmployeeId(employeeId);
		
		if (employee == null) throw new SQLException("해당 직원이 존재하지 않습니다.");
		
		return employee;
	}
}
