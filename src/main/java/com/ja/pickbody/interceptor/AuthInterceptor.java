package com.ja.pickbody.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

public class AuthInterceptor extends WebContentInterceptor {

   public boolean preHandle(
         HttpServletRequest request,
         HttpServletResponse response,
         Object handler
         ) throws ModelAndViewDefiningException {
      
      
      
      if(request.getSession().getAttribute("sessionAdmin") == null) {
         ModelAndView adminMv = new ModelAndView("admin/loginPage");
         throw new ModelAndViewDefiningException(adminMv);
      }
      
      return true;
   }
   
}
