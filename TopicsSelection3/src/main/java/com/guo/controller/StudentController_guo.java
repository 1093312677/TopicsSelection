package com.guo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.hibernate.sql.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.support.odps.udf.JSONArrayAdd;
import com.dto.DealData;
import com.entity.Clazz;
import com.entity.Student;
import com.entity.User;
import com.fasterxml.jackson.annotation.JsonFormat.Value;
import com.guo.service.IClazzService;
import com.guo.service.IStudentService;
import com.guo.service.impl.StudentService;



@Controller
@RequestMapping("/student")
public class StudentController_guo {
	@Autowired
	private DealData dealData;
	public DealData getDealData() {
		return dealData;
	}

	public void setDealData(DealData dealData) {
		this.dealData = dealData;
	}
	@Resource(name="studentService1")
	IStudentService studentService;
	@Resource(name="clazzService1")
	IClazzService clazzService;
	public IStudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(IStudentService studentService) {
		this.studentService = studentService;
	}

	@RequestMapping(value="findStudent1By.do")
	public String infoManege(HttpServletRequest request,HttpServletResponse response,int studentID,String type){
		Student student=studentService.get(studentID);
		try {
			JSONObject json = new JSONObject();
			json.put("student", student);
			response.getWriter().println(json.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			studentService.closeSession();
		}
		return null;
	}
	@RequestMapping(value="updateInfo.do")
	public String UpdateInfo_guo(long classId,Student student,HttpServletRequest request,HttpServletResponse response){
		studentService.updateInfo(student, classId);
		if(student.getId()>0){
			try {
				response.getWriter().println(1);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	@RequestMapping(value="findStudentInfo.do")
	public String UpdateInfo_guo(String queryBy,String primary,HttpServletRequest request,HttpServletResponse response){
		List<Student>students=new ArrayList<Student>();
		students=studentService.getStudents(primary,queryBy);	
		//JSONArray jsonArray = JSONArray.fromObject(students);
		JSONObject json = new JSONObject();
		json.put("students", dealData.dealStudent(students));
		try {
			response.getWriter().println(json.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			studentService.closeSession();
		}
		return null;
	}
	
	/*@RequestMapping(value="viewStudent.do")
	public String update(HttpServletRequest resquest,HttpServletResponse response,Model model) throws IOException{
		HttpSession session=resquest.getSession();
		String no=session.getAttribute("username").toString();
		Student student=studentService.get(no);
		System.out.println(student.getUser().getPassword());
		model.addAttribute("student", student);
		return "student/information_guo";
	}
	@RequestMapping(value="update.do",method=RequestMethod.POST)
	public String update(@ModelAttribute(value="student") Student stu,HttpServletRequest request){
		studentService.update(stu);
		request.setAttribute("temp",1);
		return "student/information_guo";
	}*/
}
