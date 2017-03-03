//
//  SortModel.swift
//  MeiTuan
//
//  Created by 李军 on 2017/2/26.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

class SortModel: NSObject {
    var label: String?
    
    var value: Int = -1
    
    override init() {
        
    }
    
    init(dic : [String : AnyObject]) {
        super.init();
        setValuesForKeys(dic);
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
