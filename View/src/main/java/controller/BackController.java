//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.PlushGoods;
import service.PlushGoodsService;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class BackController {
    @Resource
    PlushGoodsService plushGoodsService;

    public BackController() {
    }

    @RequestMapping({"admin401"})
    public String Error401() {
        return "admin/401";
    }

    @RequestMapping({"admin404"})
    public String Error404() {
        return "admin/404";
    }

    @RequestMapping({"admin500"})
    public String Error500() {
        return "admin/500";
    }

    @RequestMapping({"admincharts"})
    public String charts() {
        return "admin/charts";
    }

    @RequestMapping({"adminindex"})
    public String index() {
        return "admin/index";
    }

    @RequestMapping({"adminlayout-sidenav-light"})
    public String layout_sidenav_light() {
        return "admin/layout-sidenav-light";
    }

    @RequestMapping({"adminlayout-static"})
    public String layout_static() {
        return "admin/layout-static";
    }

    @RequestMapping({"adminlogin"})
    public String login() {
        return "admin/login";
    }

    @RequestMapping({"adminpassword"})
    public String password() {
        return "admin/password";
    }

    @RequestMapping({"adminregister"})
    public String register() {
        return "admin/register";
    }

    @RequestMapping({"admintables"})
    public String tables(Model model) {
        List<PlushGoods> list = this.plushGoodsService.listAllPlushGoods();
        System.err.println(list.size() + ((PlushGoods) list.get(0)).getgIntroduction());
        model.addAttribute("list", list);
        return "admin/tables";
    }

    @RequestMapping({"toUpdate"})
    public String toUpdate(Integer gId, Model model) {
        PlushGoods plushGoods = this.plushGoodsService.selectOne(gId);
        model.addAttribute("list", plushGoods);
        return "admin/charts";
    }

    @RequestMapping({"update"})
    public String update(PlushGoods plushGoods) {
        this.plushGoodsService.updatePlushGoods(plushGoods);
        return "admin/tables";
    }

}
