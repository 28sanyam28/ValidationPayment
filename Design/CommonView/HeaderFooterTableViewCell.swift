//
//  HeaderFooterTableViewCell.swift
//  Design
//
//  Created by Sarwopari Patodi on 18/08/22.
//

import UIKit

class HeaderFooterTableViewCell: UITableViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var headerViewLabel: UILabel!
    @IBOutlet weak var headerViewAmountLabel: UILabel!
    @IBOutlet weak var hundredPercentSecurelabel: UILabel!
    @IBOutlet weak var headerViewImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    var result: [Result]?
    var channelCategory: [ChannelCategory]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headerViewSetup()
    }

    func headerViewSetup() {
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 15
        bgView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        headerViewLabel.font = UIFont(name: Constant.FontNames.RobotoCondensedBold, size: 15.0)
        headerViewLabel.textColor =  Constant.Colors.color000000
        headerViewLabel.text = "ADD NEW CARD"
        
        headerViewAmountLabel.font = UIFont(name: Constant.FontNames.RobotoCondensedLight, size: 15.0)
        headerViewAmountLabel.textColor =  Constant.Colors.color424355
        let amount = result?[0].transactionDetails?.amount ?? "0"
        let total = "Total"
        headerViewAmountLabel.text = total + " " + amount
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
    }
}
