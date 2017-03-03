//
//  DataTool.swift
//  MeiTuan
//
//  Created by 李军 on 2017/2/26.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

class DataTool: NSObject {

    // 提供分类的数据源
    class func getCategoryData(result: ([CategoryModel])->()){
        // 1. 获取categories.plist
        let path = Bundle.main.path(forResource: "categories.plist", ofType: nil);
        
        // 1.1 读取里面的内容
        guard let cateArr = NSArray(contentsOfFile: path!) else {
            result([CategoryModel]());
            return;
        };
        
        // 2. 转换成模型
        var models = [CategoryModel]();
        for dic in cateArr {
            // 字典转模型
            let model = CategoryModel(dic: dic as! [String : AnyObject]);
            models.append(model);
        }
        result(models);
    }
    
    // 提供位置的数据源
    class func getAddressData(result: ([AddressModel])->()){
        // 1. 获取categories.plist
        let path = Bundle.main.path(forResource: "gz.plist", ofType: nil);
        
        // 1.1 读取里面的内容
        guard let cateArr = NSArray(contentsOfFile: path!) else {
            result([AddressModel]());
            return;
        };
        
        // 2. 转换成模型
        var models = [AddressModel]();
        for dic in cateArr {
            // 字典转模型
            let model = AddressModel(dic: dic as! [String : AnyObject]);
            models.append(model);
        }
        result(models);
    }
    
    // 提供排序的数据源
    class func getSortData(result: ([SortModel])->()){
        // 1. 获取categories.plist
        let path = Bundle.main.path(forResource: "sorts.plist", ofType: nil);
        
        // 1.1 读取里面的内容
        guard let cateArr = NSArray(contentsOfFile: path!) else {
            result([SortModel]());
            return;
        };
        
        // 2. 转换成模型
        var models = [SortModel]();
        for dic in cateArr {
            // 字典转模型
            let model = SortModel(dic: dic as! [String : AnyObject]);
            models.append(model);
        }
        result(models);
    }
}
