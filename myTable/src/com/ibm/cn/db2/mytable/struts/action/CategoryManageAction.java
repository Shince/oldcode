/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.ibm.cn.db2.mytable.struts.action;

import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.ibm.cn.db2.mytable.db.CategoryDAO;
import com.ibm.cn.db2.mytable.util.Util;

/** 
 * MyEclipse Struts
 * Creation date: 03-04-2008
 * 
 * XDoclet definition:
 * @struts.action parameter="method"
 * @struts.action-forward name="categoryForm" path="CategoryForm"
 */
public class CategoryManageAction extends DispatchAction {

	public ActionForward showMain(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Util.log( "category.showMain" ,request );
		TreeMap mainMap = CategoryDAO.getInstance().getMainCategory();
		request.setAttribute("mainCategory", mainMap);
		
		return mapping.findForward("mainCategory");
	}
	
	public ActionForward showSub(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Util.log( "category.showSub",request);
		String ids = request.getParameter("MainCatID");
		
		int id = -1;
		try {
			id = Integer.parseInt(ids);
		} catch (NumberFormatException e) {
			System.out.println( "The param :" + ids + " , can't parse into int");
			return mapping.findForward("subCategory");
		}
		
		TreeMap subMap = CategoryDAO.getInstance().getSubCategory(id);
		request.setAttribute("subCategory", subMap);
		
		return mapping.findForward("subCategory");
	}
	
	public ActionForward addCategory(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Util.log( "category.addCategory",request );
		String categoryName = request.getParameter("CategoryName");
		CategoryDAO.getInstance().addCategory(categoryName);
		return null;
	}
	
	public ActionForward addSubCategory(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Util.log( "category.addSubCategory",request );
		String categoryName = request.getParameter("SubCategoryName");
		String ids = request.getParameter("MainCategoryID");
		int id = -1;
		try {
			id = Integer.parseInt(ids);
		} catch (NumberFormatException e) {
			System.out.println( "The param :" + ids + " , can't parse into int");
			return null;
		}
		
		CategoryDAO.getInstance().addSubCategory(id, categoryName);
		return null;
	}
	
	public ActionForward delCategory(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Util.log( "category.delCategory",request );
		String ids = request.getParameter("CategoryID");
		int id = -1;
		try {
			id = Integer.parseInt(ids);
		} catch (NumberFormatException e) {
			//e.printStackTrace();
			System.out.println( "The param :" + ids + " , can't parse into int");
			return null;
		}
		CategoryDAO.getInstance().delCategory(id);
		return null;
	}
	
	public ActionForward delSubCategory(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Util.log( "category.delSubCategory",request );
		String ids = request.getParameter("SubCategoryID");
		System.out.println( "The request parameter is:" + ids );
		int id = -1;
		try {
			id = Integer.parseInt(ids);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			System.out.println( "The param :" + ids + " , can't parse into int");
			return null;
		}
		
		CategoryDAO.getInstance().delSubCategory(id);
		return null;
	}
	
	public ActionForward updateCategory(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Util.log( "category.updateCategory",request );
		String categoryName = request.getParameter("CategoryName");
		String ids = request.getParameter("MainCategoryID");
		
		int id = -1;
		try {
			id = Integer.parseInt(ids);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			System.out.println( "The param :" + ids + " , can't parse into int");
			return null;
		}
		
		CategoryDAO.getInstance().updateCategory(id, categoryName);
		
		return null;
	}
	
	public ActionForward updateSubCategory(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Util.log( "category.updateSubCategory",request );
		String subCategoryName = request.getParameter("SubCategoryName");
		String ids = request.getParameter("SubCategoryID");
		
		int id = -1;
		try {
			id = Integer.parseInt(ids);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			System.out.println( "The param :" + ids + " , can't parse into int");
			return null;
		}
		
		CategoryDAO.getInstance().updateSubCategory(id, subCategoryName);
		
		return null;
	}
}