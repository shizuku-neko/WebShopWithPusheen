//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.PlushGoods;
import service.PlushGoodsService;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class MainController {
    @Resource
    PlushGoodsService plushGoodsService;

    public MainController() {
    }

    @RequestMapping({"404"})
    public String ErrorPage() {
        return "404";
    }

    @RequestMapping({"about"})
    public String About() {
        return "about";
    }

    @RequestMapping({"blog-home-1"})
    public String BlogH1() {
        return "blog-home-1";
    }

    @RequestMapping({"blog-home-2"})
    public String BlogH2() {
        return "blog-home-2";
    }

    @RequestMapping({"blog-post"})
    public String BlogP() {
        return "blog-post";
    }

    @RequestMapping({"contact"})
    public String Contact() {
        return "contact";
    }

    @RequestMapping({"faq"})
    public String Faq() {
        return "faq";
    }

    @RequestMapping({"full-width"})
    public String FullW() {
        return "full-width";
    }

    @RequestMapping({"index"})
    public String ToIndex(Model model) {
        List<PlushGoods> list = this.plushGoodsService.listSixPlushGoods();
        System.err.println(((PlushGoods) list.get(0)).getgId() + ((PlushGoods) list.get(0)).getgName() + ((PlushGoods) list.get(0)).getgPhoto() + ((PlushGoods) list.get(0)).getgPrice());
        model.addAttribute("list", list);
        return "index";
    }

    @RequestMapping({"portfolio-1-col"})
    public String Portfolio1() {
        return "portfolio-1-col";
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
        return "portfolio-2-col";
    }

    @RequestMapping({"portfolio-3-col"})
    public String Portfolio3() {
        return "portfolio-3-col";
    }

    @RequestMapping({"portfolio-4-col"})
    public String Portfolio4() {
        return "portfolio-4-col";
    }

    @RequestMapping({"portfolio-item"})
    public String PortfolioItem() {
        return "portfolio-item";
    }

    @RequestMapping({"pricing"})
    public String Pricing() {
        return "pricing";
    }

    @RequestMapping({"services"})
    public String Services() {
        return "services";
    }

    @RequestMapping({"sidebar"})
    public String sidebar() {
        return "sidebar";
    }

    @RequestMapping({"details"})
    public String ToDetails(Integer id, Model model) {
        PlushGoods plushGoods = this.plushGoodsService.selectOne(id);
        model.addAttribute("list", plushGoods);
        return "details";
    }
}
