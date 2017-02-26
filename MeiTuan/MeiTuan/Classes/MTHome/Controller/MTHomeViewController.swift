//
//  MTHomeViewController.swift
//  MeiTuan
//
//  Created by 李军 on 2017/2/24.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

class MTHomeViewController: UIViewController {

    
    var currentPopover : UIPopoverController?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 0. 设置导航栏, 背景图片
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "bg_navigationBar_normal"), for: .default);
        
        // 1. 设置导航栏, 左侧的logo
        let logoView = UIImageView(image: UIImage(named: "icon_meituan_logo"));
        let logoItem = UIBarButtonItem(customView: logoView);
        
        // 2. 设置左侧的三个菜单
        let allCateItem = createItem(icon: UIImage(named:"icon_category_-1"), title: "美团网", subTitle: "全部分类");
        allCateItem.menuView.addTarget(target: self, action: #selector(category));
        // 第二个菜单
        let placeItem = createItem(icon: UIImage(named:"icon_district_highlighted"), title: "广东省", subTitle: "广州市");
        placeItem.menuView.addTarget(target: self, action: #selector(address));
        // 第三个菜单
        let sortItem = createItem(icon: UIImage(named:"icon_sort_highlighted"), title: "排序", subTitle: "最新发布");
        sortItem.menuView.addTarget(target: self, action: #selector(sort));
        navigationItem.leftBarButtonItems = [logoItem,allCateItem.item,placeItem.item,sortItem.item];
    }
    
    func createItem(icon: UIImage?, title:String, subTitle:String) ->(item:UIBarButtonItem, menuView:MTButtonItem) {
        let itemView = MTButtonItem.buttonItemView(icon: icon, title: title, subTitle: subTitle);
        let customItem = UIBarButtonItem(customView: itemView);
        return (customItem, itemView);
    }
}

extension MTHomeViewController{
    func category() {
        currentPopover?.dismiss(animated: true);
        let item : UIBarButtonItem = navigationItem.leftBarButtonItems![1];
        
        let pop = UIPopoverController(contentViewController: ContentViewController());
        pop.backgroundColor = UIColor.yellow;
        currentPopover = pop;
        currentPopover?.present(from: item, permittedArrowDirections: .any, animated: false);
    }
    
    func address() {
        currentPopover?.dismiss(animated: true);
        
        let item : UIBarButtonItem = navigationItem.leftBarButtonItems![2];
        let pop = UIPopoverController(contentViewController: ContentViewController());
        pop.backgroundColor = UIColor.orange;
        currentPopover = pop;
        currentPopover?.present(from: item, permittedArrowDirections: .any, animated: false);
    }
    
    func sort() {
         print("sort");
    }
}
