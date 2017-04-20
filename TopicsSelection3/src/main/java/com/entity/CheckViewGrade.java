package com.entity;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 教师选择查看学生的课程成绩表
 * @author kone
 * 2017.3.28
 */
@Entity
@Table(name="checkViewGrade")
public class CheckViewGrade {
	@Id	
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	private String courseName;
	
//	和老师实现多对一，一个老师可以选择多个课程
	@ManyToOne
	@JoinColumn(name="teacherId")
	@Basic(fetch=FetchType.LAZY)
	private Teacher teacher;
	
	private String gradeId;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	
	
}
