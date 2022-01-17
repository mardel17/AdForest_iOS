//
//  UploadVideoCell.swift
//  AdForest
//
//  Created by apple on 01/12/22.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

class UploadVideoCell: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.addShadowToView()
        }
    }
    @IBOutlet weak var containerViewActivity: UIView! {
        didSet {
            containerViewActivity.layer.borderWidth = 0.5
            containerViewActivity.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    @IBOutlet weak var lblVideo: UILabel!
    @IBOutlet weak var imgCheck: UIImageView!
    
    
    //MARK:- Properties
    var btnUploadVideo : (()->())?
    
    //MARK:- View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func actionUploadVideo(_ sender: Any) {
        self.btnUploadVideo?()
    }
}
