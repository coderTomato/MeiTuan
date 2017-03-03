//
//  CategoryModel.swift
//  MeiTuan
//
//  Created by 李军 on 2017/2/26.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

class CategoryModel: NSObject {

    var highlighted_icon: String?
    
    var icon: String?
    
    var name: String?
    
    var small_highlighted_icon: String?
    
    var small_icon: String?
    
    var map_icon: String?
    
    var subcategories: [String]?
    
    override init() {
        
    }
    init(dic : [String : AnyObject]){
        super.init();
        setValuesForKeys(dic);
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
