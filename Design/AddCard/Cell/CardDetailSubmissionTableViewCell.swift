//
//  CardDetailSubmissionTableViewCell.swift
//  Design
//
//  Created by Sarwopari Patodi on 19/08/22.
//

import UIKit

class CardDetailSubmissionTableViewCell: UITableViewCell {
    @IBOutlet weak var checkBoxImageView: UIImageView!
    @IBOutlet weak var saveCardDetailsLabel: UILabel!
    
    @IBOutlet weak var paymentButton: UIButton!
    @IBOutlet weak var paymentButtonLabel: UILabel!
    @IBOutlet weak var payementButtonView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        payementButtonView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func paymentButtonAction(_ sender: UIButton) {
        
    }
    
}
