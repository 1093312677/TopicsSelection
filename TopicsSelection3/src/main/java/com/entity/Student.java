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

import com.common.BaseEntity;

@Entity
@Table(name="student")
/**
 * 学生实体类
 * @author kone
 * 2017-1-7
 */
public class Student extends BaseEntity{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String no;//学号
	private String name;
	private String sex;
	private String age;
	private String qq;
	private String telephone;
	private String email;
	private int swapInDepa;//是否允许在系内调配
//	学生和班级之间实现多对一
	@ManyToOne
	@JoinColumn(name="clazzId")
	@Basic(fetch=FetchType.LAZY)
	private Clazz clazz;
	
	
//	学生和选题之间实现一对一关系
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="topicsId")
	private Topics topics;
	
//	和成绩实现一对一关系
	@OneToOne(mappedBy="student")
	private Score score;
	
//	和意向题目实现一对多关系
	@OneToMany(mappedBy="student",cascade={CascadeType.ALL},fetch=FetchType.LAZY)
	private List<IntentionTopic> intentionTopics = new ArrayList<IntentionTopic>();
	
//	和课程成绩实现一对多
	@OneToMany(mappedBy="student",cascade={CascadeType.ALL},fetch=FetchType.LAZY)
	private List<CourseGrade> courseGrades = new ArrayList<CourseGrade>();
	
//	和登录表一对一
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="userId")
	private User user;
	
//	学生和子题目实现一对一
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="subTopicId")
	private SubTopic subTopic;
//	和学生教师分组表实现一对多
	@OneToOne(mappedBy="student")
	private StuTeachGroup stuTeachGroup;
	
//	和文档实现一对一关系
	@OneToOne(mappedBy="student")
	private Form form;
	
	public long getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}


	public Topics getTopics() {
		return topics;
	}

	public void setTopics(Topics topics) {
		this.topics = topics;
	}

	public Score getScore() {
		return score;
	}

	public void setScore(Score score) {
		this.score = score;
	}

	public Clazz getClazz() {
		return clazz;
	}

	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}

	public List<IntentionTopic> getIntentionTopics() {
		return intentionTopics;
	}

	public void setIntentionTopics(List<IntentionTopic> intentionTopics) {
		this.intentionTopics = intentionTopics;
	}

	public List<CourseGrade> getCourseGrades() {
		return courseGrades;
	}

	public void setCourseGrades(List<CourseGrade> courseGrades) {
		this.courseGrades = courseGrades;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getSwapInDepa() {
		return swapInDepa;
	}

	public void setSwapInDepa(int swapInDepa) {
		this.swapInDepa = swapInDepa;
	}

	public SubTopic getSubTopic() {
		return subTopic;
	}

	public void setSubTopic(SubTopic subTopic) {
		this.subTopic = subTopic;
	}

	public StuTeachGroup getStuTeachGroup() {
		return stuTeachGroup;
	}

	public void setStuTeachGroup(StuTeachGroup stuTeachGroup) {
		this.stuTeachGroup = stuTeachGroup;
	}

	public Form getForm() {
		return form;
	}

	public void setForm(Form form) {
		this.form = form;
	}
	
	
}
