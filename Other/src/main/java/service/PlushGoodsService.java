//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package service;

import pojo.PlushGoods;

import java.util.List;

public interface PlushGoodsService {
    List<PlushGoods> listSixPlushGoods();

    PlushGoods selectOne(Integer var1);

    List<PlushGoods> listPlushGoodsPage(Integer var1, Integer var2);

    int getPlushGoodsCount();

    List<PlushGoods> listAllPlushGoods();

    Integer insertPlushGoods(PlushGoods plushGoods);

    Integer updatePlushGoods(PlushGoods plushGoods);

    Integer deletePlushGoods(Integer var1);
}
