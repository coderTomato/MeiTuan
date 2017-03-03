//
//  ContentViewController.swift
//  MeiTuan
//
//  Created by 李军 on 2017/2/25.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

protocol ContentViewControllerDelegate : NSObjectProtocol{
    func contentViewController(didSelectedAt model:LeftRightModel);
}

class ContentViewController: UIViewController {

    @IBOutlet weak var leftView: UITableView!
    @IBOutlet weak var rightView: UITableView!
    
    weak var delegate : ContentViewControllerDelegate?;
    
    var leftRightArr : [LeftRightModel] = [LeftRightModel]();
    // 数据源(右侧视图的数据源)
    var currentModel : LeftRightModel = LeftRightModel();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSize(width: 150, height: 500);
    }
}

extension ContentViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftView {
            return leftRightArr.count;
        }
        
        if tableView == rightView{
            if currentModel.hasSubMenu {
                return (currentModel.subMenuArr!.count);
            }else {
                return 0;
            }
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = (tableView == leftView) ? leftRightArr[indexPath.row] : currentModel.subMenuArr![indexPath.row];
        let cellId = model.type == .ImageAndTitle ? "left" : "right";
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId);
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId);
        }
        cell?.imageView?.image = model.image;
        cell?.textLabel?.text = model.title;
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == leftView {
            let model = leftRightArr[indexPath.row];
            currentModel = model;
            if model.hasSubMenu {
                rightView.reloadData();
                preferredContentSize = CGSize(width: 300, height: 500);
            }else{
                 preferredContentSize = CGSize(width: 150, height: 500);
                delegate?.contentViewController(didSelectedAt: model);
            }
        }
        if tableView == rightView{
            let model = currentModel.subMenuArr![indexPath.row];
            delegate?.contentViewController(didSelectedAt: model);
        }
    }
}
