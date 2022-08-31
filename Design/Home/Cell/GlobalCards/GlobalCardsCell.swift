//
//  GlobalCardsCell.swift
//  Design
//
//  Created by apple on 10/08/22.
//

import UIKit

protocol GlobalCardsCellDelegate : AnyObject {
    func addnewCardButtonClicked()
}

class GlobalCardsCell: UITableViewCell {

    @IBOutlet var mainView: UIView!
    @IBOutlet var plusView: UIView!
    
    @IBOutlet var imageM: UIImageView!
    @IBOutlet var imageV: UIImageView!
    @IBOutlet var imageJ: UIImageView!
    @IBOutlet var imageU: UIImageView!
    
    @IBOutlet var btnMasterCard: UIButton!
    @IBOutlet var btnVisa: UIButton!
    @IBOutlet var btnJCB: UIButton!
    @IBOutlet var btnUnionPay: UIButton!
    
    weak var delegate: GlobalCardsCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        plusView.clipsToBounds = true
        plusView.layer.cornerRadius = 10
        plusView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
        mainView.layer.borderColor = UIColor.separator.cgColor
        mainView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addNewCardButtonAction(_ sender: UIButton) {
        delegate?.addnewCardButtonClicked()
    }
}
