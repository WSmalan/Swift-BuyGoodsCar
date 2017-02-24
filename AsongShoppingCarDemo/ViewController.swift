//
//  ViewController.swift
//  AsongShoppingCarDemo
//
//  Created by SongLan on 2017/2/19.
//  Copyright © 2017年 SongLan. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource{

    var tableView : UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.white
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 49), style: .plain)
        tableView?.register(UINib(nibName: "ShoppingCarCell", bundle: nil), forCellReuseIdentifier: "ShoppingCarCell")
        tableView?.dataSource = self
        tableView?.rowHeight = 70
        self.view.addSubview(tableView!)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCarCell", for: indexPath) as! ShoppingCarCell
        cell.buttonClickBack = {
        (myImageView) -> Void in
            var rect : CGRect = tableView.rectForRow(at: indexPath)
            //获取当前cell的相对坐标
            rect.origin.y = (rect.origin.y - tableView.contentOffset.y)
            
            var imageViewRect : CGRect = myImageView.frame
            imageViewRect.origin.y = rect.origin.y + imageViewRect.origin.y
          
            ShoppingCarTool().startAnimation(view: myImageView, andRect: imageViewRect, andFinishedRect: CGPoint(x:self.view.frame.size.width/4 * 3,  y:self.view.frame.size.height-49), andFinishBlock: { (finished : Bool) in
                
                let tabBtn : UIView = (self.tabBarController?.tabBar.subviews[2])!
                ShoppingCarTool().shakeAnimation(shakeView: tabBtn)
            })
        }
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

