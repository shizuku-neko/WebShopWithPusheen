//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package controller;

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
        List<PlushGoods> list = this.plushGoodsService.listSixPlushGoods();
        System.err.println(((PlushGoods) list.get(0)).getgId() + ((PlushGoods) list.get(0)).getgName() + ((PlushGoods) list.get(0)).getgPhoto() + ((PlushGoods) list.get(0)).getgPrice());
        model.addAttribute("list", list);
        return "main/index";
    }

    @RequestMapping({"portfolio-1-col"})
    public String Portfolio1() {
        return "main/portfolio-1-col";
    }

    @RequestMapping({"portfolio-2-col"})
    public String Portfolio2(@RequestParam(required = false, defaultValue = "1") Integer pageIndex, Model model) {
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
        String uEmail = (String) session.getAttribute("uEmail");
        if (uEmail == null || ("").equals(uEmail)) {
            return "loginPage/ErrorPageForShop";
        }
        Account account = this.accountService.SelectSessionUser(uEmail);
        if (0 == account.getVerify()) {
            model.addAttribute("uList", account);
            return "loginPage/NeedVerifyEmail";
        }
        if ("".equals(account.getuAddress()) || account.getuAddress() == null) {
            account.setuAddress("请填写收货地址");
        }
        PlushGoods plushGoods = this.plushGoodsService.selectOne(id);
        System.err.println(plushGoods.getgIntroduction());

        model.addAttribute("pList", plushGoods);
        model.addAttribute("uList", account);
        return "main/Settlement";
    }

    @RequestMapping("conformShop")
    public String ConformShop(String uAddress, String usEmail, String uName, String uCreditCard, Integer pId, Model model, HttpSession session) {
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
        String dateNow = df.format(new Date());

        Integer rNum = (int) (1 + Math.random() * (99999 - 10000 + 1));
        StringBuffer stringBuffer = new StringBuffer(dateNow);
        stringBuffer.append(rNum);

        Account account;
        if (("").equals(usEmail) || usEmail == null) {
            String userEmail = (String) session.getAttribute("uEmail");
            account = accountService.SelectSessionUser(userEmail);
        } else {
            account = accountService.SelectSessionUser(usEmail);
        }
        PlushGoods plushGoods = plushGoodsService.selectOne(pId);

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
        CreditCardVerify creditCardVerify = new CreditCardVerify();
        int num = creditCardVerify.CreditCard(Integer.parseInt(CardNumber));
        return num;
    }

//    @RequestMapping("ErrorPageForShop")
//    public String ErrorPageForShop(){
//
//        return "loginPage/ErrorPageForShop";
//    }
}
