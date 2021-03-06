package com.service;

import java.io.File;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dao.impl.CommonDaoImpl;
import com.entity.Department;
import com.entity.Document;
/**
 * 关于文档的逻辑处理
 * @author kone
 * 2017.4.19
 */
@Service
public class DocumentService {
	@Autowired
	private SessionFactory sessionFactory;
	private Session session;
	@Autowired
	private CommonDaoImpl commonDaoImpl;
	/**
	 * 上传相关文档
	 * @param file
	 * @param departmentId
	 * @param path
	 * @return
	 */
	public boolean uploadDocument(MultipartFile file, long departmentId, String path){
		try{
			Document document  = new Document();
			Department department = new Department();
			department.setId(departmentId);
			document.setDepartment(department);
			if(!file.isEmpty()) {
				String origName = file.getOriginalFilename();
				int newNameIndex = origName.lastIndexOf('.');
				String suffix = origName.substring(newNameIndex);
				long name = System.currentTimeMillis();
//				文件随机名称
				String fileName = String.valueOf(name)+suffix;
				File file2 = new File(path,fileName);
				
				document.setRandName(fileName);
				document.setDocumentName(origName);
				
				file.transferTo(file2);
			}
			
			session = sessionFactory.getCurrentSession();
			session.beginTransaction();
			commonDaoImpl.setSession(session);
			commonDaoImpl.save(document);
			session.getTransaction().commit();
			return true;
		} catch(Exception e) {
			session.getTransaction().rollback();;
			return false;
		}
	}
	/**
	 * 查看文档
	 * @param departmentId
	 * @return
	 */
	public List<Document> viewDocument(long departmentId){
		List<Document> documents = null;
		try{
			session = sessionFactory.getCurrentSession();
			session.beginTransaction();
			commonDaoImpl.setSession(session);
			documents = commonDaoImpl.findBy("Document", "departmentId", String.valueOf(departmentId));
			return documents;
		} catch(Exception e) {
			return documents;
		}  finally{
			session.getTransaction().commit();
		}
	}
	
}
