package com.example.mini.mapper;

import java.rmi.registry.Registry;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.PdImage;
import com.example.mini.model.Product;
import com.example.mini.model.UserImage;

@Mapper
public interface ProductTemporaryMapper {

	//상품상세 
	Product selectProductTemporaryInfo(HashMap<String, Object> map);
	
	//제품이미지들
	List <PdImage> productImages(HashMap<String, Object> map);

	void updateProduct(HashMap<String, Object> map);
	void insertProduct(HashMap<String, Object> map);
	
	
}
