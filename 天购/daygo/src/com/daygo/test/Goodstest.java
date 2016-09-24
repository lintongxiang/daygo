package com.daygo.test;

import java.util.List;

import org.junit.Test;

import com.daygo.dao.GoodsDao;
import com.daygo.entity.Goods;


public class Goodstest {
	@Test
	public void  AddGoods()
	{
		Goods goods=new Goods();
		goods.setG_category("ssssssssss");
		goods.setG_describe("aaaaaaaaaaaaa");
		goods.setG_name("aaa");
		goods.setG_number(1000);
		goods.setG_price(50.6);
		goods.setG_size("xx");
		goods.setG_picture("sdfdsfsdfsfdfefs");
		GoodsDao goodsdao=new GoodsDao();
		goodsdao.AddGoods(goods);
	}
	@Test
	public void DeleteGoodsById()
	{
		GoodsDao goodsdao=new GoodsDao();
		goodsdao.DeleteGoodsById(1);
	}
	@Test
	public void UpdateGoods()
	{
		Goods goods=new Goods();
		goods.setG_id(2);
		goods.setG_category("bbbbbbbbbbbbbbbbbbbb");
		goods.setG_describe("ccccccccc");
		goods.setG_name("aaa");
		goods.setG_number(1000);
		goods.setG_price(50.6);
		goods.setG_size("xx");
		goods.setG_picture("sdfdsfsdfsfdfefs");
		GoodsDao goodsdao=new GoodsDao();
		goodsdao.UpdateGoods(goods);
	}
	@Test
	public void GetGoodsByKey()
	{
		GoodsDao goodsdao=new GoodsDao();
		List<Goods> list=goodsdao.GetGoodsByKey("aa");
		for (Goods obj : list) {
		System.out.println(obj.getG_name());	
		}
	}
}
