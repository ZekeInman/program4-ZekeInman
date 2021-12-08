/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import business.EmpHourly;
import business.EmpSalary;
import business.Person;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedHashMap;

public class PersonDA {

    public static LinkedHashMap<Integer, Person> selectAll() throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM person";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            LinkedHashMap<Integer, Person> persons = new LinkedHashMap();

            //        ArrayList<Shape> shapes = new ArrayList<Shape>();
            //        String dbException = "";
            while (rs.next()) {
                int empID = rs.getInt("employeeID");
                String firstName = rs.getString("firstName");
                String middleName = rs.getString("middleName");
                String lastName = rs.getString("lastName");
                LocalDate birthDate = rs.getDate("birthDate").toLocalDate();
                LocalDate hireDate = rs.getDate("hireDate").toLocalDate();
                int salary = rs.getInt("salary");
                int rate = rs.getInt("rate");
                int avgWeeklyHours = rs.getInt("avgWeeklyHours");

                String employeeType = "";
                if (rs.getObject("salary") == null) {
                    if (rs.getObject("rate") == null && rs.getObject("avgWeeklyHours") == null) {
                        //Non existant employee
                        Person person = new Person(firstName, middleName, lastName, empID, birthDate, hireDate);
                        persons.put(person.getEmployeeID(), person);
                    } else {
                        //Hourly employee
                        EmpHourly tempEmpHourly = new EmpHourly();
                        tempEmpHourly.setEmployeeID(empID);
                        tempEmpHourly.setFirstName(firstName);
                        tempEmpHourly.setMiddleName(middleName);
                        tempEmpHourly.setLastName(lastName);
                        tempEmpHourly.setBirthDate(birthDate);
                        tempEmpHourly.setHireDate(hireDate);
                        tempEmpHourly.setRate(rate);
                        tempEmpHourly.setAvgWeeklyHours(avgWeeklyHours);
                        
                        persons.put(empID, tempEmpHourly);
                    }
                } else {
                    // Employee is Salaried
                    EmpSalary tempEmpSalary = new EmpSalary();
                    tempEmpSalary.setEmployeeID(empID);
                    tempEmpSalary.setFirstName(firstName);
                    tempEmpSalary.setMiddleName(middleName);
                    tempEmpSalary.setLastName(lastName);
                    tempEmpSalary.setBirthDate(birthDate);
                    tempEmpSalary.setHireDate(hireDate);
                    tempEmpSalary.setSalary(salary);

                    persons.put(empID, tempEmpSalary);
                }

//                Person person = new Person(firstName, middleName, lastName, empID, birthDate, hireDate);
//                persons.put(person.getEmployeeID(), person);
            }

            return persons;
        } catch (SQLException sqlEx) {
            throw sqlEx;
        } finally {
            try {
                rs.close();
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                throw e;
            }
        }
    }

}
