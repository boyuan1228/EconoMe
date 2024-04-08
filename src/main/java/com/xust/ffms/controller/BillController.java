package com.xust.ffms.controller;


import com.xust.ffms.entity.*;
import com.xust.ffms.service.BillService;
import com.xust.ffms.utils.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * description: TODO
 *
 * @author zhangsihai
 * @date 2020/3/24 15:24
 */
@RestController
@RequestMapping("/bills")
public class BillController {

    @Resource
    private BillService billService;

    @RequestMapping("/getBillsToChart")
    public Result<Bill> findByWhereNoPage(Bill bill, HttpSession session) {
        bill = getHouseBill(bill, session);
        bill.setStartTime(bill.getStartTime() + " 00:00:00");
        bill.setEndTime(bill.getEndTime() + " 23:59:00");
        return billService.findByWhereNoPage(bill);
    }

    @RequestMapping("/getBillsByWhere/{type}/{pageNo}/{pageSize}")
    public Result<Bill> getBillsByWhere(Bill bill, @PathVariable String type, @PathVariable int pageNo, @PathVariable int pageSize, HttpSession session) {
        if(!StringUtils.isEmpty(bill.getStartTime())){
            bill.setStartTime(bill.getStartTime()+" 00:00:00");
        }
        if(!StringUtils.isEmpty(bill.getEndTime())){
            bill.setEndTime(bill.getEndTime()+" 23:59:59");
        }
        if ("-1".equals(bill.getPayway())) {
            bill.setPayway(null);
        }
        bill.setType(type);
        bill = getHouseBill(bill, session);
        System.out.println(bill);
        PageModel model = new PageModel<>(pageNo, bill);
        model.setPageSize(pageSize);
        return billService.findByWhere(model);
    }

    @RequestMapping("/getProducts/{pageNo}/{pageSize}/{level}")
    public Result<Product> getProducts(@PathVariable String level, @PathVariable int pageNo, @PathVariable int pageSize, HttpSession session) {
        Product product = new Product();
        product.setLevel(level == null || "".equals(level) || "null".equals(level) ? null : level);
        PageModel model = new PageModel<>(pageNo, product);
        model.setPageSize(pageSize);
        return billService.getProducts(model);
    }

    @RequestMapping("/getBillsByUserid/{userid}/{pageNo}/{pageSize}/{year}/{month}")
    public Result getBillsByUserid(@PathVariable Integer userid, @PathVariable int pageNo, @PathVariable int pageSize, @PathVariable int year, @PathVariable int month) {
        Bill bill = new Bill();
        bill.setUserid(userid);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        bill.setStartTime(year + "-0" + month + "-01");
        try {
            Date date = sdf.parse(year + "-0" + (month + 1) + "-01");
            date.setDate(date.getDate() - 1);
            bill.setEndTime(sdf.format(date));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        PageModel model = new PageModel<>(pageNo, bill);
        model.setPageSize(pageSize);
        Result result = billService.findByWhere(model);
        List<Map<String, String>> r = billService.getMonthlyInfo(model);
        Map<String, String> map = new HashMap<>();
        for (Map<String, String> m : r) {
            map.put(m.get("typeid"), String.format("%.2f", m.get("sum(money)")));
        }
        result.setData(map);
        return result;
    }

    private Bill getHouseBill(Bill bill, HttpSession session) {
        UserInfo currentUser = Config.getSessionUser(session);
        //When the logged-in user is the head of the household, the query defaults to the whole family's billing status.
        //When the logged-in user is a regular user, only the current user's bill will be queried.
        if (currentUser.getRoleid() == 2) {
            bill.setHouseid(currentUser.getHouseid());
        } else if (currentUser.getRoleid() == 3) {
            bill.setUserid(currentUser.getId());
        }
        return bill;
    }

    @RequestMapping(value = "/addBillJudge", method = RequestMethod.GET)
    public Result addBillJudge(Bill bill, HttpSession session, HttpServletResponse response) {

        Integer sumPayMoney = billService.getExpensesBill();
        return ResultUtil.success("", sumPayMoney);

    }

    @RequestMapping(value = "/addBill", method = RequestMethod.POST)
    public Result add(Bill bill, HttpSession session, HttpServletResponse response) {

        if (Config.getSessionUser(session)!=null){
            bill.setUserid(Config.getSessionUser(session).getId());
            bill.setHouseid(Config.getSessionUser(session).getHouseid());
        }
        Utils.log(bill.toString());
        int num = billService.add(bill);
        if (num > 0) {
            int billid = bill.getId();
            bill = new Bill();
            bill.setId(billid);
            return ResultUtil.success("The bookkeeping was successful!", billService.findByWhereNoPage(bill));
        }
        return ResultUtil.unSuccess("Failed to post!");
    }

    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    public Result addProduct(Product product, HttpSession session) {
        try {
            int num = billService.addProduct(product);
            if (num > 0) {
                return ResultUtil.success("Added successfully!", billService.findProductfPage(product));
            } else {
                return ResultUtil.unSuccess();
            }
        } catch (Exception e) {
            return ResultUtil.error(e);
        }
    }

    @RequestMapping("/updateBill")
    public Result update(Bill bill, HttpSession session) {
        if (Config.getSessionUser(session) != null) {
            bill.setUserid(Config.getSessionUser(session).getId());
        }
        Utils.log(bill.toString());
        try {
            int num = billService.update(bill);
            if (num > 0) {
                return ResultUtil.success("Modified successfully!", null);
            } else {
                return ResultUtil.unSuccess();
            }
        } catch (Exception e) {
            return ResultUtil.error(e);
        }
    }

    @RequestMapping("/updateProduct")
    public Result updateProduct(Product product, HttpSession session) {
        Utils.log(product.toString());
        try {
            int num = billService.updateProduct(product);
            if (num > 0) {
                return ResultUtil.success("The modification was successful!", null);
            } else {
                return ResultUtil.unSuccess();
            }
        } catch (Exception e) {
            return ResultUtil.error(e);
        }
    }

    @RequestMapping("/delBill")
    public Result del(int id) {
        try {
            int num = billService.del(id);
            if (num > 0) {
                return ResultUtil.success("Deleted successfully!", null);
            } else {
                return ResultUtil.unSuccess();
            }
        } catch (Exception e) {
            return ResultUtil.error(e);
        }
    }

    @RequestMapping("/delProduct")
    public Result delProduct(int id) {
        try {
            billService.delProduct(id);
            return ResultUtil.success("Deleted successfully!", null);
        } catch (Exception e) {
            return ResultUtil.error(e);
        }
    }

    @RequestMapping("/getPayways")
    public Result<Payway> getAllPayways() {

        try {
            List<Payway> payways = billService.getAllPayways();
            if (payways != null && payways.size() > 0) {
                return ResultUtil.success(payways);
            } else {
                return ResultUtil.unSuccess();
            }
        } catch (Exception e) {
            return ResultUtil.error(e);
        }
    }

    @RequestMapping("/getAllWays")
    public Result<ProductType> getAllWays() {
        List<ProductType> list = new ArrayList<>();
        list.add(new ProductType("R1", "cautious"));
        list.add(new ProductType("R2", "robust"));
        list.add(new ProductType("R3", "balanced"));
        list.add(new ProductType("R4", "aggressive"));
        list.add(new ProductType("R5", "radicalized"));
        return ResultUtil.success(list);
    }
}
