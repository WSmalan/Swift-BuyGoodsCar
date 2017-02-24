//
//  ShoppingCarCell.swift
//  AsongShoppingCarDemo
//
//  Created by SongLan on 2017/2/19.
//  Copyright © 2017年 SongLan. All rights reserved.
//

import UIKit

class ShoppingCarCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    typealias buttonClickBackCall = (_ goodsImg : UIImageView)->Void
    var buttonClickBack : buttonClickBackCall?
    
    @IBAction func buttonClick(_ sender: Any) {
        if (buttonClickBack != nil) {
            buttonClickBack!(myImage)
        }
    }
    @IBOutlet weak var myImage: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        myImage.image = UIImage(named: "baoma.jpg")
        // Configure the view for the selected state
    }
    
}
