//
//  GiftCardCell.swift
//  Design
//
//  Created by apple on 30/08/22.
//

import UIKit

class GiftCardCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var btnRemove: UIButton!
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblSubHeading: UILabel!
    @IBOutlet weak var imgUpper: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.layer.borderColor = UIColor.separator.cgColor
        mainView.layer.cornerRadius = 10
        btnRemove.layer.borderColor = UIColor.separator.cgColor
        btnRemove.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
