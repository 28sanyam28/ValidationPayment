//
//  CardDetailSubmissionTableViewCell.swift
//  Design
//
//  Created by Sarwopari Patodi on 19/08/22.
//

import UIKit

class CardDetailSubmissionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var checkBoxImageView: UIImageView!
    @IBOutlet weak var saveCardDetailsLabel: UILabel!
    
    @IBOutlet weak var paymentButton: UIButton!
    @IBOutlet weak var paymentButtonLabel: UILabel!
    @IBOutlet weak var payementButtonView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        payementButtonView.clipsToBounds = true
        payementButtonView.layer.masksToBounds = false
        payementButtonView.layer.cornerRadius = 10
        payementButtonView.layer.shadowOpacity = 0.4
        payementButtonView.layer.shadowColor = UIColor.black.cgColor
        payementButtonView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        payementButtonView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
        mainView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func paymentButtonAction(_ sender: UIButton) {
        print("check")
        let vc = UserDefaults.standard.string(forKey: "CardNumber")
        if vc == nil {
            print("sorry")
        }
    }
    
}
