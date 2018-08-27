package com.liz.controller;

import com.liz.utils.PicCodeUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/login",name = "登陆功能")
public class LoginController {

    private final Logger logger = Logger.getLogger(this.getClass());


    @RequestMapping(name = "登陆页")
    public String index(){
        return "/login";
    }

    /**
     * 登录
     * @param account
     * @param password
     * @param verifyCode
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "doLogin",name = "登陆操作")
    public Map<String,Object> login(String account, String password, String verifyCode, HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","登陆成功");
        return map;

//        if(StringUtils.isBlank(account) || StringUtils.isBlank(password) || StringUtils.isBlank(verifyCode)){
//            return new ResponseBean(-1,"参数为空");
//        }
//
//        /* 查询已失败的次数 */
//        String loginRedisKey = Constant.LOGIN_FAIL_KEY + account;
//        String loginFailCountStr = jedisClientIService.get(loginRedisKey);
//        int loginFailCount = 0;
//        if(StringUtil.isValid(loginFailCountStr)){
//            loginFailCount = Integer.parseInt(loginFailCountStr);
//        }
//        if(loginFailCount >= 5 ){
//            return  new ResponseBean(-1,"帐号被锁定,请在30分钟后再试!");
//        }
//
//        HttpSession session = request.getSession();
//        if(!StringUtils.equalsIgnoreCase(verifyCode, (String) session.getAttribute("pCode"))){
//            return new ResponseBean(-1,"验证码不正确");
//        }
//
//        Admin admin = new Admin();
//        admin.setAccount(account);
//        admin.setPassword(MDUtil.sha1(password));
//        List<Admin> list = null;
//        try {
//            list = adminService.search(admin);
//            if(list != null && list.size() == 1){
//                if(!SystemStatusEnum.USING.getStatus().equals(list.get(0).getStatus())){
//                    return new ResponseBean(-1,"帐号已被禁用");
//                }
//            }else{
//                /* 记录失败次数，锁定半小时 */
//                jedisClientIService.set(loginRedisKey,loginFailCount+1,30);
//                return new ResponseBean(-1,"用户名或密码错误");
//            }
//        } catch (Exception e) {
//            logger.error("登录失败,admin:" + admin + ",errorMsg:" + e.getMessage(), e);
//            return new ResponseBean(-1,"登陆异常！");
//        }
//
//        session.setAttribute(Constant.LOGIN_SESSION_USERNAME,list.get(0).getAccount());
//        session.setAttribute(Constant.LOGIN_SESSION_ID,list.get(0).getId());
//        session.setAttribute(Constant.LOGIN_SESSION_TYPE,list.get(0).getType());
//        return new ResponseBean();
    }

    @RequestMapping(value = "logOut",name = "退出系统")
    public String logOut(HttpServletRequest request){
//        request.getSession().removeAttribute(Constant.LOGIN_SESSION_USERNAME);
//        request.getSession().removeAttribute(Constant.LOGIN_SESSION_ID);
//        request.getSession().removeAttribute(Constant.LOGIN_SESSION_TYPE);
        return "login";
    }

    /**
     * 响应验证码页面
     */
    @RequestMapping(value="/picCode")
    public void validateCode(HttpServletRequest request,HttpServletResponse response) throws Exception{
        // 设置响应的类型格式为图片格式
        response.setContentType("image/png");
        //禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        HttpSession session = request.getSession();

        PicCodeUtil pCode = new PicCodeUtil(100,35,4,10);
        session.setAttribute("pCode", pCode.getCode());
        pCode.write(response.getOutputStream());
    }

}
