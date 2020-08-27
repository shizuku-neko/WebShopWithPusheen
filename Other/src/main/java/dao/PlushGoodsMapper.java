//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import pojo.PlushGoods;

import java.util.List;

public interface PlushGoodsMapper {
    List<PlushGoods> listSixPlushGoods();

    List<PlushGoods> listPlushGoodsPage(@Param("pageIndex") Integer var1, @Param("size") Integer var2);

    List<PlushGoods> listAllPlushGoods();

    int getPlushGoodsCount();

    PlushGoods selectOne(@Param("id") Integer var1);

    Integer insertPlushGoods(PlushGoods plushGoods);

    Integer updatePlushGoods(PlushGoods plushGoods);

    @Delete("DELETE FROM webShop.plushGoods WHERE GId = #{ id } ")
    Integer deletePlushGoods(@Param("id") Integer var1);
}
