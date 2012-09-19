/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.ibm.cn.db2.mytable.struts.action;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ibm.cn.db2.mytable.db.NativePmrDAO;

/** 
 * MyEclipse Struts
 * Creation date: 03-13-2008
 * 
 * XDoclet definition:
 * @struts.action
 */
public class VisibleSelectAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		Object o = request.getSession().getAttribute("custData");
		if( o == null )return mapping.findForward("initial");
		
		ArrayList a = (ArrayList)o;
		
		String[] ids = new String[ a.size() ];
		for( int i=0; i<a.size(); i++ ){
			HashMap map = (HashMap)a.get(i);
			String id = (String) map.get("pmrID");
			ids[i] = id;
		}
		
		String req = request.getParameter("v");
		boolean v = Boolean.parseBoolean(req);
		
		NativePmrDAO.getInstance().selectAll(ids, v);
		
		return mapping.findForward("pagination");
	}
}