package com.altersis.demo.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.altersis.demo.entities.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
	void deleteEmployeeById(Long id);

	Optional<Employee> findEmployeeById(Long id);
}
