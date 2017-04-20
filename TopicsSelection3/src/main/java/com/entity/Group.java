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
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * 分组表
 * @author kone
 * 2017.3.29
 */
@Entity
@Table(name="groupp")
public class Group {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String groupName;//分组名称
	private int isAnswer;//是否已经分配答辩组
	private int answerGroup;//答辩组
	
//	实现自己关联，作为对方答辩组
	@OneToOne
	private Group ansGroup;
//	和年级实现多对一
	@ManyToOne
	@JoinColumn(name="gradeId")
	@Basic(fetch=FetchType.LAZY)
	private Grade grade;
	
//	和教师分组实现一对多
	@OneToMany(mappedBy="group",cascade={CascadeType.ALL})
	private List<TeacherGroup> teacherGroup = new ArrayList<TeacherGroup>();
//	和时间地点表实现一对一
	@OneToOne(mappedBy="group")
	private TimeAndPlace timeAndPlace;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public int getIsAnswer() {
		return isAnswer;
	}
	public void setIsAnswer(int isAnswer) {
		this.isAnswer = isAnswer;
	}
	public int getAnswerGroup() {
		return answerGroup;
	}
	public void setAnswerGroup(int answerGroup) {
		this.answerGroup = answerGroup;
	}
	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	public List<TeacherGroup> getTeacherGroup() {
		return teacherGroup;
	}
	public void setTeacherGroup(List<TeacherGroup> teacherGroup) {
		this.teacherGroup = teacherGroup;
	}
	public Group getAnsGroup() {
		return ansGroup;
	}
	public void setAnsGroup(Group ansGroup) {
		this.ansGroup = ansGroup;
	}
	public TimeAndPlace getTimeAndPlace() {
		return timeAndPlace;
	}
	public void setTimeAndPlace(TimeAndPlace timeAndPlace) {
		this.timeAndPlace = timeAndPlace;
	}
	
	
}
