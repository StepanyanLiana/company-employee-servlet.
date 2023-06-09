package com.example.companyemployeeservlet.manager;



import com.example.companyemployeeservlet.db.DBConnectionProvider;
import com.example.companyemployeeservlet.model.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeManager {
   private Connection connection = DBConnectionProvider.getInstance().getConnection();
    private CompanyManager companyManager = new CompanyManager();
    public void save(Employee employee) {
        try(Statement statement = connection.createStatement()) {
            String sql = "INSERT INTO employee(name,surname,email,company_id) VALUES('%s','%s','%s',%d)";
            statement.executeUpdate(String.format(sql, employee.getName(), employee.getSurname(),
                    employee.getEmail(), employee.getCompany().getId(), Statement.RETURN_GENERATED_KEYS));
            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                employee.setId(generatedKeys.getInt(1));
            }
            System.out.println("employee inserted into DB");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Employee getById(int id) {
        String sql = "SELECT * FROM employee where id = " + id;
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            if (resultSet.next()) {
                return getEmployeeFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Employee getEmployeeFromResultSet(ResultSet resultSet) throws SQLException {
        Employee employee = new Employee();
        employee.setId(resultSet.getInt("id"));
        employee.setName(resultSet.getString("name"));
        employee.setSurname(resultSet.getString("surname"));
        employee.setEmail(resultSet.getString("email"));
        int companyId = resultSet.getInt("company_id");
        employee.setCompany(companyManager.getById(companyId));
        return employee;
    }
    public List<Employee> getAll() {
        List<Employee> employees = new ArrayList<>();
        String sql = "SELECT * FROM employee";

        try(Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                employees.add(getEmployeeFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }
    public List<Employee> getAllByCompanyId(int companyId) {
        List<Employee> employees = new ArrayList<>();
        String sql = "SELECT * FROM employee WHERE company_id= " + companyId;
        try(Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                employees.add(getEmployeeFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }
    public void removeById(int employeeId) {
        String sql = "DELETE FROM employee WHERE id = " + employeeId;
        try(Statement statement = connection.createStatement()) {
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Employee employee) {
        String sql = "UPDATE employee SET name=?,surname=?,email=?,company=? WHERE id = ?";
        try(PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, employee.getName());
            ps.setString(2, employee.getSurname());
            ps.setString(3, employee.getEmail());
            ps.setInt(4, employee.getCompany().getId());
            ps.setInt(5, employee.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
