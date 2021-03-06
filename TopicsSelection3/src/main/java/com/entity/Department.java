package com.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.common.BaseEntity;

@Entity
@Table(name="department")
/**
 * 系实体类
 * @author kone
 * 2017-1-7
 */
public class Department extends BaseEntity{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	private String departmentName;
	
////	和年级实现多对一
//	@ManyToOne
//	@JoinColumn(name="gradeId")
//	@Basic(fetch=FetchType.EAGER)
//	private Grade grade;
//和学院实现多对一
	@ManyToOne
	@JoinColumn(name="collegeId")
	@Basic(fetch=FetchType.LAZY)
	private College college;
	
//	和年级实现一对多
	@OneToMany(mappedBy="department",cascade={CascadeType.REMOVE,CascadeType.DETACH,CascadeType.ALL})
	private List<Grade> grades = new ArrayList<Grade>();
	
////	和专业实现一对多
//	@OneToMany(mappedBy="department",cascade={CascadeType.ALL})
//	private List<Specialty> spceialtys = new ArrayList<Specialty>();
	
//	和老师是实现一对多
	@OneToMany(mappedBy="department",cascade={CascadeType.ALL})
	private List<Teacher> teachers = new ArrayList<Teacher>();
//	和文档是实现一对多
	@OneToMany(mappedBy="department",cascade={CascadeType.REFRESH})
	private List<Document> documents = new ArrayList<Document>();	
	
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	
	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}


	public List<Teacher> getTeachers() {
		return teachers;
	}

	public void setTeachers(List<Teacher> teachers) {
		this.teachers = teachers;
	}

	public College getCollege() {
		return college;
	}

	public void setCollege(College college) {
		this.college = college;
	}

	public List<Grade> getGrades() {
		return grades;
	}

	public void setGrades(List<Grade> grades) {
		this.grades = grades;
	}

	public List<Document> getDocuments() {
		return documents;
	}

	public void setDocuments(List<Document> documents) {
		this.documents = documents;
	}
	
}
