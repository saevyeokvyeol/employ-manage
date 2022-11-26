package controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import service.EmployeeService;
import vo.Employee;
import vo.Paging;

@Controller
@RequiredArgsConstructor
public class EmployeeController {
	private final EmployeeService employeeService;
	
	/**
	 * 직원 등록 폼 이동
	 * */
	@RequestMapping("insert")
	public void insert() {}
	
	/**
	 * 직원 등록
	 * @param: Employee(employeeName, employeeTel, employeePosition, employeeEmail)
	 * @throws Exception 
	 * */
	@RequestMapping("insert-complete")
	public String insertComplete(Employee employee) throws Exception {
		employeeService.insertEmployee(employee);
		return "redirect:/main";
	}
	
	/**
	 * 직원 수정 폼 이동
	 * @throws SQLException 
	 * */
	@RequestMapping("update/{employeeId}")
	public ModelAndView update(@PathVariable Long employeeId) throws SQLException {
		Employee employee = employeeService.findEmployeeByEmployeeId(employeeId);
		ModelAndView modelAndView = new ModelAndView("update");
		modelAndView.addObject("employee", employee);
		return modelAndView;
	}
	
	/**
	 * 직원 수정
	 * @param: Employee(employeeId, employeeName, employeeTel, employeePosition, employeeEmail)
	 * @throws Exception 
	 * */
	@RequestMapping("update-complete")
	public String updateComplete(Employee employee) throws Exception {
		employeeService.updateEmployee(employee);
		return "redirect:/update/" + employee.getEmployeeId();
	}
	
	/**
	 * 직원 삭제
	 * @param: Long employeeId
	 * */
	@RequestMapping("delete/{employeeId}")
	public String delete(@PathVariable Long employeeId, Model model, HttpServletRequest request) throws SQLException {
		employeeService.deleteEmployee(employeeId);
		return "redirect:" + (String)request.getHeader("REFERER");
	}
	
	/**
	 * 직원 목록 조회
	 * : 전체 직원 조회
	 * @param: int page(페이징 처리를 위한 현재 페이지 수)
	 * 		   Model model(뷰로 정보를 넘기기 위한 모델)
	 * */
	@RequestMapping("main")
	public void main(@RequestParam(defaultValue = "1") int page, Model model) throws SQLException {
		List<Employee> employees = employeeService.findEmployee(new Employee(), new Paging(page));
		model.addAttribute("employees", employees);
		
		int temp = (page - 1) % Paging.blockCount;
		int startPage = page - temp;
		int totalPage = Paging.totalCount / 10;
		totalPage += Paging.totalCount % 10 > 0 ? 1 : 0;
		
		model.addAttribute("blockCount", Paging.blockCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("page", page);
		model.addAttribute("totalPage", totalPage);
	}
	
	/**
	 * 직원 검색
	 * : 전체 직원 조회
	 * @param: int page(페이징 처리를 위한 현재 페이지 수)
	 * 		   Model model(뷰로 정보를 넘기기 위한 모델)
	 * */
	@RequestMapping("search")
	public void search(@RequestParam(defaultValue = "1") int page, String keyfield, String keyword, Model model) throws SQLException {
		Employee employee = new Employee();
		
		if (keyfield.equals("employeeNumber")) {
			employee.setEmployeeNumber(keyword);
		} else if (keyfield.equals("employeeName")) {
			employee.setEmployeeName(keyword);
		} else if (keyfield.equals("employeeTel")) {
			employee.setEmployeeTel(keyword);
		} else if (keyfield.equals("employeePosition")) {
			employee.setEmployeePosition(keyword);
		} else if (keyfield.equals("employeeEmail")) {
			employee.setEmployeeEmail(keyword);
		}
		
		List<Employee> employees = employeeService.findEmployee(employee, new Paging(page));
		model.addAttribute("employees", employees);
		
		int temp = (page - 1) % Paging.blockCount;
		int startPage = page - temp;
		int totalPage = Paging.totalCount / 10;
		totalPage += Paging.totalCount % 10 > 0 ? 1 : 0;
		
		model.addAttribute("blockCount", Paging.blockCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("page", page);
		model.addAttribute("totalPage", totalPage);
	}

	@ExceptionHandler(Exception.class)
	public ModelAndView error(Exception e) {
		ModelAndView modelAndView = new ModelAndView("exception");
		modelAndView.addObject("exception", e);
		e.printStackTrace();
		
		return modelAndView; 
	}

}
