package com.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.common.QueryCondition;
import com.common.WorkbookTool;
import com.dao.impl.DaoImpl;
import com.entity.CourseAndGrade;
import com.entity.Direction;
import com.entity.Grade;
import com.entity.Teacher;
import com.entity.Topics;

@Service
public class CommonService <T> {
	@Autowired
	private DaoImpl<T> daoImpl;
	
	public String login(){
		
		return "yes";
	}
	/**
	 * close session
	 */
	public void closeSession(){
		daoImpl.closeSession();
	}
	/**
	 * save Entity
	 * @param T entitys
	 * @author kone
	 * @return boolean
	 */
	public boolean save(T entity){
		
		return daoImpl.save(entity);
	}
	
	/**
	 * view Entity
	 * @param table 
	 * @param page
	 * @param eachPage
	 * @author kone
	 * @return List<T> entitys
	 */
	public List<T> view(String table, int page, int eachPage) {
		
		
		return daoImpl.view(table, page, eachPage);
	}
	
	/**
	 * delete entity
	 * @param entity
	 * @author kone
	 * @return
	 */
	public boolean delete(T entity) {
		
		return daoImpl.delete(entity);
	}
	/**
	 * find entity
	 * @param id
	 * @param table
	 * @author kone
	 * @return
	 */
	public List<T> find(String table, String id) {
		
		return daoImpl.find(table, id);
	}
	/**
	 * update entity
	 * @param entity
	 * @return
	 */
	public boolean update(T entity) {
		return daoImpl.update(entity);
	}
	
	/**
	 * query by two conditions
	 * @param table
	 * @param col
	 * @param value
	 * @return
	 */
	public List<T> findBy(String table, String col, String value) {
		return daoImpl.findBy(table, col, value);
	}
	/**
	 * get count 
	 * @param table
	 * @return
	 */
	public int getCount(String table) {
		
		return daoImpl.getCount(table);
	}
	/**
	 * get count 
	 * @param table
	 * @return
	 */
	public int getCount(String table, String col, String value) {
		
		return daoImpl.getCount(table, col, value);
	}
	/**
	 * find by two conditions
	 * @param table
	 * @param col
	 * @param value
	 * @param col2
	 * @param value2
	 * @return
	 */
	public List<T> findByTwo(String table, String col, String value, String col2, String value2) {
		return daoImpl.findByTwo(table, col, value, col2, value2);
	}
	/**
	 * query by two conditions
	 * @param table
	 * @param col
	 * @param value
	 * @return
	 */
	public List<T> findBy(String table, String col, String value, int page, int eachPage ) {
		return daoImpl.findBy(table, col, value, page, eachPage);
	}
	/**
	 * view topics
	 * @param directions
	 * @return
	 */
	public List<Topics> viewTopic(String gradeId, Teacher teacher, String privilege) {
//		查找对应专业
		List<Topics> topics = (List<Topics>) findBy("Topics", "gradeId", gradeId);
		Set<Direction> set = null;
		if( "3".equals(privilege) ) {
			for(int i=0;i<topics.size();i++) {
				if( topics.get(i).getTeacher().getId() != teacher.getId() ) {
					topics.remove(i);
				}
			}
		}
		List<Direction> directions = null;
//		去掉重复的
		for(int i=0;i<topics.size();i++) {
			
			directions = new ArrayList<Direction>();
			set = new HashSet<Direction>();
			set.addAll(topics.get(i).getDirections());
			for(Direction direct: set) {
				directions.add(direct);
			}
			topics.get(i).setDirections(directions);
		}
		daoImpl.closeSession();
		return topics;
	}
	
	
	
	/**
	 * find use 1 to 4 condition
	 * @param queryCondition
	 * @return
	 */
	public List<T> findByFree(QueryCondition queryCondition) {
		
		return daoImpl.findByFree(queryCondition);
	}
	
	/**
	 * update use 1 to 4 condition
	 * @param queryCondition
	 * @return
	 */
	public boolean updateByFree(QueryCondition queryCondition) {
		
		return daoImpl.updateByFree(queryCondition);
	}
	/**
	 * check this grade student
	 * @param gradeId
	 * @return
	 */
	public List<T> viewStudents(String gradeId, int page, int eachPage) {
		return daoImpl.viewStudents(gradeId, page, eachPage);
	}
	
	/**
	 * batch import entity
	 * @param entitys
	 * @return
	 */
	public boolean batchImport(List<T> entitys) {
		return daoImpl.batchImport(entitys);
	}
	
	public boolean saveOrUpdate(T entity){
		return daoImpl.saveOrUpdate(entity);
	}
	
	/**
	 * save entity and get id
	 * @param entity
	 * @return
	 */
	public String saveGetId(T entity) {
		return daoImpl.saveGetId(entity);
	}
	
	/**
	 * insert into table use sql
	 * @param value1
	 * @param value2
	 * @return
	 */
	public boolean insertSql(String value1, String value2) {
		return daoImpl.insertSql(value1, value2);
	}
}
