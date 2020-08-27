//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package controller;

import com.alibaba.fastjson.JSONArray;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import pojo.PlushGoods;
import service.PlushGoodsService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
        System.err.println(plushGoods.getgIntroduction());
        model.addAttribute("list", plushGoods);
        return "admin/charts";
    }

    @RequestMapping("/updateCouponState")
    @ResponseBody
    public String updateCoupon(PlushGoods goods, @RequestParam("files") MultipartFile multipartFile, HttpServletRequest request) {
        // 判断是否为空
        if (multipartFile.isEmpty()) {
            request.setAttribute("msg", "您没有指定上传文件");
        }

        // 设置上传文件存放的路径
        String path = request.getSession().getServletContext().getRealPath("static" + File.separator + "image");
        // 设置允许上传文件的类型
        String[] allowExt = {"jpg", "png", "gif", "jpeg"};
        // 设置允许上传文件的最大字节数
        long allowSize = 10 * 1024 * 1024;

        // 获取上传文件的文件名
        String oldFileName = multipartFile.getOriginalFilename();
        // 获取上传文件的扩展名
        String oldFileExt = FilenameUtils.getExtension(oldFileName);
        // 获取上传文件的字节数
        long oldFileSize = multipartFile.getSize();

        // 生成新文件
        String newFileName = System.currentTimeMillis() + new Random().nextInt(1000000) + "." + oldFileExt;
        File newFile = new File(path, newFileName);

        System.err.println(newFileName);

        // 创建服务器目录
        if (!newFile.exists()) {
            newFile.mkdirs();
        }
        // 迁移新文件
        try {
            multipartFile.transferTo(newFile);
            request.setAttribute("msg", "上传文件成功：" + newFileName);
        } catch (IOException e) {
            request.setAttribute("msg", "上传文件失败");
            e.printStackTrace();
        }

        Integer countNum;
        goods.setgPhoto(newFileName);
        countNum = this.plushGoodsService.updatePlushGoods(goods);
        System.err.println(goods.getgId() + "_" + goods.getgName() + "_" + goods.getgIntroduction() + "_" + goods.getgPrice());
        System.err.println(countNum);
        Map<String, Object> data = new HashMap<>();
        data.put("countNum", countNum);

        return JSONArray.toJSONString(data);
    }

}
