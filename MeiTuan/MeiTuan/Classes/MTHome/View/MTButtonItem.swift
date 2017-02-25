//
//  MTButtonItem.swift
//  MeiTuan
//
//  Created by lijun on 2017/2/25.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

class MTButtonItem: UIView {
    @IBOutlet weak var iconImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    @IBOutlet weak var bgBtn: UIButton!
    
    
    class func buttonItemView(icon:UIImage?, title:String, subTitle:String) ->MTButtonItem {
        let view = Bundle.main.loadNibNamed("MTButtonItem", owner: nil, options: nil)?.first as? MTButtonItem;
        view?.iconImgView.image = icon;
        view?.titleLbl.text = title;
        view?.subTitleLbl.text = subTitle;
        return view!;
    }
    
    func addTarget(target:AnyObject?, action:Selector) {
        bgBtn.addTarget(target, action:action, for: .touchDown);
    }
}
