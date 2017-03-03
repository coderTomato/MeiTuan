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
    var itemView : MTButtonItem?;
    
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
        itemView = item.customView as! MTButtonItem;
        let contentVc = ContentViewController();
        contentVc.delegate = self;
        DataTool.getCategoryData { (datas:[CategoryModel]) in
            contentVc.leftRightArr = DataBridgeTool.changeModel(cateModels: datas);
        }
        let pop = UIPopoverController(contentViewController:contentVc);
        pop.backgroundColor = UIColor.white;
        currentPopover = pop;
        currentPopover?.present(from: item, permittedArrowDirections: .any, animated: false);
    }
    
    func address() {
        currentPopover?.dismiss(animated: true);
        let item : UIBarButtonItem = navigationItem.leftBarButtonItems![2];
        let contentVc = ContentViewController();
        contentVc.delegate = self;
        DataTool.getAddressData { (addressArr:[AddressModel]) in
            contentVc.leftRightArr = DataBridgeTool.changeAddressModel(addressModels: addressArr);
        }
        let pop = UIPopoverController(contentViewController: contentVc);
        pop.backgroundColor = UIColor.white;
        currentPopover = pop;
        currentPopover?.present(from: item, permittedArrowDirections: .any, animated: false);
    }
    
    func sort() {
        currentPopover?.dismiss(animated: true);
        let item : UIBarButtonItem = navigationItem.leftBarButtonItems![3];
        let contentVc = ContentViewController();
        contentVc.delegate = self;
        DataTool.getSortData { (sortArr : [SortModel]) in
            contentVc.leftRightArr = DataBridgeTool.changeSortModel(sortModels: sortArr);
        }
        let pop = UIPopoverController(contentViewController: contentVc);
        pop.backgroundColor = UIColor.white;
        currentPopover = pop;
        currentPopover?.present(from: item, permittedArrowDirections: .any, animated: false);
    }
}

extension MTHomeViewController : ContentViewControllerDelegate{
    func contentViewController(didSelectedAt model: LeftRightModel) {
        itemView?.subTitleLbl.text = model.title;
        itemView?.iconImgView.image = model.image;
    }
}
