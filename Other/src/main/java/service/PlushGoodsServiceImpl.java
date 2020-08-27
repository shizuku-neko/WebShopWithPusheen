//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package service;

import dao.PlushGoodsMapper;
import org.springframework.stereotype.Service;
import pojo.PlushGoods;

import javax.annotation.Resource;
import java.util.List;

@Service("plushGoodsService")
public class PlushGoodsServiceImpl implements PlushGoodsService {
    @Resource
    PlushGoodsMapper plushGoodsMapper;

    public PlushGoodsServiceImpl() {
    }

    public List<PlushGoods> listSixPlushGoods() {
        return this.plushGoodsMapper.listSixPlushGoods();
    }

    public PlushGoods selectOne(Integer id) {
        return this.plushGoodsMapper.selectOne(id);
    }

    public List<PlushGoods> listPlushGoodsPage(Integer pageIndex, Integer size) {
        return this.plushGoodsMapper.listPlushGoodsPage(pageIndex, size);
    }

    public int getPlushGoodsCount() {
        return this.plushGoodsMapper.getPlushGoodsCount();
    }

    public List<PlushGoods> listAllPlushGoods() {
        return this.plushGoodsMapper.listAllPlushGoods();
    }

    @Override
    public Integer insertPlushGoods(PlushGoods plushGoods) {
        return this.plushGoodsMapper.insertPlushGoods(plushGoods);
    }

    @Override
    public Integer updatePlushGoods(PlushGoods plushGoods) {
        return this.plushGoodsMapper.updatePlushGoods(plushGoods);
    }

    @Override
    public Integer deletePlushGoods(Integer var1) {
        return this.plushGoodsMapper.deletePlushGoods(var1);
    }
}
