//
//  HaveAGiftCardCell.swift
//  Design
//
//  Created by apple on 10/08/22.
//

import UIKit

class HaveAGiftCardCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var plusView: UIView!
    @IBOutlet weak var lblView: UIView!
    @IBOutlet weak var btnPlus: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        plusView.clipsToBounds = true
        plusView.layer.cornerRadius = 10
        plusView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
        mainView.layer.borderColor = UIColor.separator.cgColor
        mainView.layer.cornerRadius = 10
        lblView.layer.borderColor = UIColor.separator.cgColor
        lblView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
