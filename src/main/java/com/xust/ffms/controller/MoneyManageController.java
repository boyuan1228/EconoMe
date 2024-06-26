package com.xust.ffms.controller;


import com.xust.ffms.entity.MoneyManage;
import com.xust.ffms.entity.UserInfo;
import com.xust.ffms.service.MoneyManageService;
import com.xust.ffms.utils.*;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/moneymanage")
public class MoneyManageController {

    @Resource
    private MoneyManageService moneyManageService;



    @RequestMapping("/getBillsByWhere/{pageNo}/{pageSize}")
    public Result<MoneyManage> getBillsByWhere(MoneyManage moneyManage, @PathVariable int pageNo, @PathVariable int pageSize, HttpSession session){
        moneyManage = getHouseBill(moneyManage,session);
        PageModel model = new PageModel<>(pageNo,moneyManage);
        model.setPageSize(pageSize);
        return moneyManageService.findByWhere(model);
    }



    private MoneyManage getHouseBill(MoneyManage bill, HttpSession session) {
        UserInfo currentUser = Config.getSessionUser(session);
        //When the logged-in user is the head of the household, the query defaults to the whole family's billing status.
        //When the logged-in user is a regular user, only the current user's bill will be queried.
        if (currentUser.getRoleid() == 2){
            bill.setHouseid(currentUser.getHouseid());
        }else if (currentUser.getRoleid() == 3){
            bill.setUserid(currentUser.getId());
        }
        bill.setHouseid(currentUser.getHouseid());
        bill.setUserid(currentUser.getId());
        return bill;
    }

    @RequestMapping(value = "/addBill",method = RequestMethod.POST)
    public Result add(MoneyManage moneyManage, HttpSession session){
        if (Config.getSessionUser(session)!=null){
            moneyManage.setUserid(Config.getSessionUser(session).getId());
            moneyManage.setHouseid(Config.getSessionUser(session).getHouseid());
        }
        Utils.log(moneyManage.toString());
        try {
            int num = moneyManageService.add(moneyManage);
            if(num>0){
                int billid = moneyManage.getId();
                moneyManage = new MoneyManage();
                moneyManage.setId(billid);
                return ResultUtil.success("记录成功！",moneyManageService.findByWhereNoPage(moneyManage));
//                return ResultUtil.success("记账成功！",bill);
            }else {
                return ResultUtil.unSuccess();
            }
        }catch (Exception e){
            return ResultUtil.error(e);
        }
    }

    @RequestMapping("/updateBill")
    public Result update(MoneyManage moneyManage, HttpSession session){
        if (Config.getSessionUser(session)!=null){
            moneyManage.setUserid(Config.getSessionUser(session).getId());
            moneyManage.setHouseid(Config.getSessionUser(session).getHouseid());
        }
        Utils.log(moneyManage.toString());
            int num = moneyManageService.update(moneyManage);
            if(num>0){
                return ResultUtil.success("Modified successfully!",null);
            }else {
                return ResultUtil.unSuccess();
            }
    }

    @RequestMapping("/delBill")
    public Result del(int id){
        try {
            int num = moneyManageService.del(id);
            if(num>0){
                return ResultUtil.success("Deleted successfully!",null);
            }else {
                return ResultUtil.unSuccess();
            }
        }catch (Exception e){
            return ResultUtil.error(e);
        }
    }


}
