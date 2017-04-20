package com.guo.service;

import java.util.List;

import com.entity.Student;

public interface IStudentService {
	public Student gets(String no);
	public List<Student> getStudents(String name,String queryBy); 
	public Student get(int id);
	public int update(Student  stu);
	public int updateInfo(Student stu,long clazzId);
	public void closeSession();
}
