package com.xust.ffms.controller;

import com.xust.ffms.entity.Debt;
import com.xust.ffms.entity.UserInfo;
import com.xust.ffms.service.DebtService;
import com.xust.ffms.utils.*;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/debt")
public class DebtController {

    @Resource
    private DebtService debtService;


    @RequestMapping("/getBillsByWhere/{pageNo}/{pageSize}")
    public Result<Debt> getBillsByWhere(Debt debt, @PathVariable int pageNo, @PathVariable int pageSize, HttpSession session){
        debt = getHouseBill(debt,session);
        PageModel model = new PageModel<>(pageNo,debt);
        model.setPageSize(pageSize);
        return debtService.findByWhere(model);
    }



    private Debt getHouseBill(Debt bill, HttpSession session) {
        UserInfo currentUser = Config.getSessionUser(session);
        //When the logged-in user is the head of the household, the query defaults to the whole family's billing status.
        //When the logged-in user is a regular user, only the current user's bill will be queried.
        if (currentUser.getRoleid() == 2){
            bill.setHouseid(currentUser.getHouseid());
        }else if (currentUser.getRoleid() == 3){
            bill.setUserid(currentUser.getId());
        }
        return bill;
    }

    @RequestMapping(value = "/addBill",method = RequestMethod.POST)
    public Result add(Debt debt, HttpSession session){
        if (Config.getSessionUser(session)!=null){
            debt.setUserid(Config.getSessionUser(session).getId());
            debt.setHouseid(Config.getSessionUser(session).getHouseid());
        }
        Utils.log(debt.toString());
        try {
            int num = debtService.add(debt);
            if(num>0){
                int billid = debt.getId();
                debt = new Debt();
                debt.setId(billid);
                return ResultUtil.success("Record success!",debtService.findByWhereNoPage(debt));
//               
            }else {
                return ResultUtil.unSuccess();
            }
        }catch (Exception e){
            return ResultUtil.error(e);
        }
    }

    @RequestMapping("/updateBill")
    public Result update(Debt debt, HttpSession session){
        if (Config.getSessionUser(session)!=null){
            debt.setUserid(Config.getSessionUser(session).getId());
            debt.setHouseid(Config.getSessionUser(session).getHouseid());
        }
        Utils.log(debt.toString());
        int num = debtService.update(debt);
        if(num>0){
            return ResultUtil.success("Modified successfully!",null);
        }else {
            return ResultUtil.unSuccess();
        }
    }

    @RequestMapping("/delBill")
    public Result del(int id){
        try {
            int num = debtService.del(id);
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

