package vo;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Employee {
	private Long employeeId;
	private String employeeNumber;
	private String employeeName;
	private String employeeTel;
	private String employeePosition;
	private String employeeEmail;
	private Timestamp employeeInsertDate;
	private Timestamp employeeUpdateDate;
	
	@Builder
	public Employee(Long employeeId, String employeeNumber, String employeeName, String employeeTel,
			String employeePosition, String employeeEmail, Timestamp employeeInsertDate, Timestamp employeeUpdateDate) {
		super();
		this.employeeId = employeeId;
		this.employeeNumber = employeeNumber;
		this.employeeName = employeeName;
		this.employeeTel = employeeTel;
		this.employeePosition = employeePosition;
		this.employeeEmail = employeeEmail;
		this.employeeInsertDate = employeeInsertDate;
		this.employeeUpdateDate = employeeUpdateDate;
	}
	
}
