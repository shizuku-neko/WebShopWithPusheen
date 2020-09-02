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
    // 主页展示6件商品,倒叙,展示最近添加的6份
    List<PlushGoods> listSixPlushGoods();

    // 分页展示商品,倒叙
    List<PlushGoods> listPlushGoodsPage(@Param("pageIndex") Integer var1, @Param("size") Integer var2);

    // 一次性展示所有商品
    List<PlushGoods> listAllPlushGoods();

    // 查询所有商品总数量
    int getPlushGoodsCount();

    // 查询单个商品详情
    PlushGoods selectOne(@Param("id") Integer var1);

    // 新增商品
    Integer insertPlushGoods(PlushGoods plushGoods);

    // 修改商品
    Integer updatePlushGoods(PlushGoods plushGoods);

    // 删除商品
    @Delete("DELETE FROM webShop.plushGoods WHERE GId = #{ id } ")
    Integer deletePlushGoods(@Param("id") Integer var1);
}
