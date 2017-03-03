//
//  DataBridgeTool.swift
//  MeiTuan
//
//  Created by 李军 on 2017/2/26.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

class DataBridgeTool: NSObject {

    class func changeModel(cateModels:[CategoryModel])->([LeftRightModel]){
        // 1. 存放所有目标数据模型
        var dataArr = [LeftRightModel]();
        
        // 2. 遍历所有需要转换的数据模型
        for model in cateModels {
            let lRModel = LeftRightModel();
            dataArr.append(lRModel);
            if model.icon != nil {
                lRModel.image = UIImage(named: model.icon!);
            }
            lRModel.title = model.name;
            var subcategoryArr = [LeftRightModel]();
            guard let subcategorys = model.subcategories else {continue}
            for string in subcategorys{
                let rightModel = LeftRightModel();
                rightModel.title = string;
                subcategoryArr.append(rightModel);
            }
            lRModel.subMenuArr = subcategoryArr;
        }
        return dataArr;
    }
    
    class func changeAddressModel(addressModels:[AddressModel])->([LeftRightModel]){
        // 1. 存放所有目标数据模型
        var dataArr = [LeftRightModel]();
        // 2. 遍历所有需要转换的数据模型
        for model in addressModels {
            let lRModel = LeftRightModel();
            dataArr.append(lRModel);
            lRModel.title = model.name;
            var subArr = [LeftRightModel]();
            guard let regions = model.subregions else {continue}
            for str in regions {
                let rightModel = LeftRightModel();
                rightModel.title = str;
                subArr.append(rightModel);
            }
            lRModel.subMenuArr = subArr;
        }
        return dataArr;
    }
    
    class func changeSortModel(sortModels:[SortModel])->([LeftRightModel]) {
        // 1. 存放所有目标数据模型
        var dataArr = [LeftRightModel]();
        // 2. 遍历所有需要转换的数据模型
        for model in sortModels {
            let lRModel = LeftRightModel();
            dataArr.append(lRModel);
            lRModel.title = model.label;
            dataArr.append(lRModel);
        }
        return dataArr;
    }
}
