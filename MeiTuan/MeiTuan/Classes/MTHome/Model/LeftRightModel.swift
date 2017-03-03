//
//  LeftRightModel.swift
//  MeiTuan
//
//  Created by 李军 on 2017/2/26.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

enum LRType{
    // 图片和标题
    case ImageAndTitle
    // 只有标题
    case Title
}

class LeftRightModel: NSObject {

    // 记录菜单的图片
    var image: UIImage?
    
    // 菜单的标题
    var title: String?
    
    var type : LRType{
        if image != nil && title != nil {
            return .ImageAndTitle;
        }else {
            return .Title;
        }
    }
    
    
    // 是否有子菜单(计算属性)
    var hasSubMenu : Bool{
        if subMenuArr == nil || subMenuArr!.count == 0 {
            return false;
        }
        return true;
    }
    
    // 子菜单
    var subMenuArr : [LeftRightModel]?
}
