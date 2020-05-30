import java.util.*;

public class HRDepartment {

	ArrayList<Employee> employeeList = new ArrayList<Employee>();

	public void addEmployee(int employeeId, String name, int role) {
		Employee newEmployee = new Employee(employeeId, name, role);
		employeeList.add(newEmployee);
	}

	public void printAllEmployees() {
		for (int index = 0; index < employeeList.size(); index++) {
			System.out.println(employeeList.get(index).toString());
		}
	}

	public Employee findEmployee(int employeeId) {
		for (int index = 0; index < employeeList.size(); index++) {
			if (employeeList.get(index).getEmployeeId() == employeeId) {
				return employeeList.get(index);
			}
		}
		return null;
	}

	public boolean recordEmployeeAppraisal(int employeeId, Date appraisalDate, int score) {
		Employee employee = findEmployee(employeeId);
		if (employee != null) {
			EmployeeAppraisal appraisal = new EmployeeAppraisal(appraisalDate, score);
			ArrayList<EmployeeAppraisal> history = employee.getAppraisalHistory();
			history.add(appraisal);
			employee.setAppraisalHistory(history);
			return true;
		} else {
			return false;
		}
	}

	public boolean promoteEmployee(int employeeId) {
		Employee employee = findEmployee(employeeId);
		if (employee != null) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			calendar.add(Calendar.YEAR,-1);
			Date date = calendar.getTime();
			ArrayList<EmployeeAppraisal> history = employee.getAppraisalHistory();
			if (history.get(0).getAppraisalScore() == 1 && history.get(1).getAppraisalScore() == 1) {
				if (!(employee.getPromotionDate().compareTo(date) > 0)) {
					int role = employee.getRole();
					if (role > HRCodes.EXECUTIVE) {
						role++;
						employee.setRole(role);
					}
					calendar = Calendar.getInstance();
					calendar.setTime(new Date());
					Date today = calendar.getTime();
					employee.setPromotionDate(today);
				}
			}
			return true;
		} else {
			return false;
		}
	}
}