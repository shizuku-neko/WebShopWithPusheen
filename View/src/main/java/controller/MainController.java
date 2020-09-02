//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package controller;

import com.alibaba.fastjson.JSONArray;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Account;
import pojo.PlushGoods;
import service.AccountService;
import service.PlushGoodsService;
import tools.CreditCardVerify;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class MainController {
    @Resource
    PlushGoodsService plushGoodsService;

    @Resource
    AccountService accountService;

    public MainController() {
    }

    @RequestMapping({"404"})
    public String ErrorPage() {
        return "main/404";
    }

    @RequestMapping({"about"})
    public String About() {
        return "main/about";
    }

    @RequestMapping({"blog-home-1"})
    public String BlogH1() {
        return "main/blog-home-1";
    }

    @RequestMapping({"blog-home-2"})
    public String BlogH2() {
        return "main/blog-home-2";
    }

    @RequestMapping({"blog-post"})
    public String BlogP() {
        return "main/blog-post";
    }

    @RequestMapping({"contact"})
    public String Contact() {
        return "main/contact";
    }

    @RequestMapping({"faq"})
    public String Faq() {
        return "main/faq";
    }

    @RequestMapping({"full-width"})
    public String FullW() {
        return "main/full-width";
    }

    @RequestMapping({"index"})
    public String ToIndex(Model model) {
        // 首页展示最新的六种商品
        List<PlushGoods> list = this.plushGoodsService.listSixPlushGoods();
//        System.err.println(((PlushGoods) list.get(0)).getgId() + ((PlushGoods) list.get(0)).getgName() + ((PlushGoods) list.get(0)).getgPhoto() + ((PlushGoods) list.get(0)).getgPrice());
        model.addAttribute("list", list);
        return "main/index";
    }

    @RequestMapping({"portfolio-1-col"})
    public String Portfolio1() {
        return "main/portfolio-1-col";
    }

    @RequestMapping({"portfolio-2-col"})
    public String Portfolio2(@RequestParam(required = false, defaultValue = "1") Integer pageIndex, Model model) {
        // 分页展示商品,数据库数据倒叙
        Integer size = 6;
        Integer count = this.plushGoodsService.getPlushGoodsCount();
        Integer pageTotal = count / size;
        pageTotal = count % size == 0 ? pageTotal : pageTotal + 1;
        pageIndex = pageIndex > pageTotal ? pageTotal : pageIndex;
        pageIndex = pageIndex < 1 ? 1 : pageIndex;
        List<PlushGoods> list = this.plushGoodsService.listPlushGoodsPage(pageIndex, size);
        model.addAttribute("list", list);
        model.addAttribute("pageIndex", pageIndex);
        model.addAttribute("pageTotal", pageTotal);
        model.addAttribute("count", count);
        return "main/portfolio-2-col";
    }

    @RequestMapping({"portfolio-3-col"})
    public String Portfolio3() {
        return "main/portfolio-3-col";
    }

    @RequestMapping({"portfolio-4-col"})
    public String Portfolio4() {
        return "main/portfolio-4-col";
    }

    @RequestMapping({"portfolio-item"})
    public String PortfolioItem() {
        return "main/portfolio-item";
    }

    @RequestMapping({"pricing"})
    public String Pricing() {
        return "main/pricing";
    }

    @RequestMapping({"services"})
    public String Services() {
        return "main/services";
    }

    @RequestMapping({"sidebar"})
    public String sidebar() {
        return "main/sidebar";
    }

    @RequestMapping({"details"})
    public String ToDetails(Integer id, Model model) {
        PlushGoods plushGoods = this.plushGoodsService.selectOne(id);
        model.addAttribute("list", plushGoods);
        return "main/details";
    }

    @RequestMapping({"shop"})
    public String WantToShop(Integer id, HttpSession session, Model model) {
        // 如果用户未登录则跳转Error页面并提示登录
        String uEmail = (String) session.getAttribute("uEmail");
        if (uEmail == null || ("").equals(uEmail)) {
            return "loginPage/ErrorPageForShop";
        }

        // 从session获取当前登录的用户邮箱,然后从数据库查询此邮箱是否通过邮箱验证,
        Account account = this.accountService.SelectSessionUser(uEmail);
        if (0 == account.getVerify()) {
            model.addAttribute("uList", account);
            return "loginPage/NeedVerifyEmail";
        }

        // 如果此用户为保存收货地址,则提示填写收货地址
        if ("".equals(account.getuAddress()) || account.getuAddress() == null) {
            account.setuAddress("请填写收货地址");
        }
        PlushGoods plushGoods = this.plushGoodsService.selectOne(id);
//        System.err.println(plushGoods.getgIntroduction());

        model.addAttribute("pList", plushGoods);
        model.addAttribute("uList", account);
        return "main/Settlement";
    }

    @RequestMapping("conformShop")
    public String ConformShop(String uAddress, String usEmail, String uName, String uCreditCard, Integer pId, Model model, HttpSession session) {
        // 设置日期格式
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateNow = df.format(new Date());
        // 生成随机数并拼接字符串
        Integer rNum = (int) (1 + Math.random() * (99999 - 10000 + 1));
        StringBuffer stringBuffer = new StringBuffer(dateNow);
        stringBuffer.append(rNum);

        Account account;
        // 判断用户是否输入收货人姓名,如果未输入,则以账户注册的用户名为收货人姓名
        if (("").equals(uName) || uName == null) {
            String userEmail = (String) session.getAttribute("uEmail");
            account = accountService.SelectSessionUser(userEmail);
        } else {
            account = accountService.SelectSessionUser(usEmail);
        }

        // 判断用户是否输入收货联系方式,如果未输入,则以账户注册的联系方式为收货人联系方式
        if (("").equals(usEmail) || usEmail == null) {
            String userEmail = (String) session.getAttribute("uEmail");
            account = accountService.SelectSessionUser(userEmail);
        } else {
            account = accountService.SelectSessionUser(usEmail);
        }
        PlushGoods plushGoods = plushGoodsService.selectOne(pId);
        account.setuAddress(uAddress);

        // 生成支付流水号
        String CodeForBuy = RandomStringUtils.randomAlphanumeric(20);

        model.addAttribute("uList", account);
        model.addAttribute("pList", plushGoods);
        model.addAttribute("pNum", stringBuffer);
        model.addAttribute("cFb", CodeForBuy);

        return "main/Print";
    }

    @ResponseBody
    @RequestMapping("CreditCardVerify")
    public Object CreditCard(String CardNumber) {
        // 信用卡验证是否合法
        CreditCardVerify creditCardVerify = new CreditCardVerify();
        Integer num = creditCardVerify.CreditCard(CardNumber);
        return JSONArray.toJSONString(num);
    }

//    @RequestMapping("ErrorPageForShop")
//    public String ErrorPageForShop(){
//
//        return "loginPage/ErrorPageForShop";
//    }
}
