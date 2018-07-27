package com.thinkgem.jeesite.common.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.utils.ExecutorServiceFactory;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.JsonUtil;
import com.thinkgem.jeesite.common.utils.SendMailUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class ValidateNumServlet extends HttpServlet {

    public static final String VALIDATE_NUM = "validataNum";
    private static final Logger LOGGER= LoggerFactory.getLogger(ValidateNumServlet.class);



    public static boolean validate(HttpServletRequest request, String validateCode){
        String code = (String)request.getSession().getAttribute(VALIDATE_NUM);
        return validateCode.toUpperCase().equals(code.toUpperCase());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String validateCode = request.getParameter(VALIDATE_NUM); // AJAX验证，成功返回true
        if (StringUtils.isNotBlank(validateCode)){
            response.getOutputStream().print(validate(request, validateCode)?"true":"false");
        }else{
            this.doPost(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        createValidateNum(request,response);
    }

    private void createValidateNum(HttpServletRequest request,HttpServletResponse response) throws IOException{
        String s = IdGen.uuid6();
        final String  email=request.getParameter("email");
        final String message=String.format("请在5分钟内完成验证，过期失效。<br/> 验证码：%s",s);
        ExecutorServiceFactory.getInstance().getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                LOGGER.info("启动发邮件线程====");
                SendMailUtil.sendCommonMail(email,"唐润珠宝验证码",message);
            }
        });

        LOGGER.info(message);

        request.getSession().setAttribute(VALIDATE_NUM, s);
        response.setCharacterEncoding("UTF-8");
        Map map= Maps.newHashMap();
        map.put("success",true);
        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json; charset=utf-8");
        response.getOutputStream().write(mapper.writeValueAsString(map).getBytes());
    }
}


