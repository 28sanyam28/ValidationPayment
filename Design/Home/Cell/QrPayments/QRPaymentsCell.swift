//
//  QRPaymentsCell.swift
//  Design
//
//  Created by apple on 10/08/22.
//

import UIKit
import DropDown

class QRPaymentsCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var vwOtherOption: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var qrScannerView: UIView!
    @IBOutlet weak var lblOtherOption: UILabel!
    @IBOutlet weak var btnQRCode: UIButton!
    
    let dropDown = DropDown()
    var arrNames = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        DefaultsData()
        vwOtherOption.clipsToBounds = true
        vwOtherOption.layer.cornerRadius = 10
        vwOtherOption.layer.borderWidth = 1
        vwOtherOption.layer.borderColor = UIColor.separator.cgColor
        vwOtherOption.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
        mainView.layer.borderColor = UIColor.separator.cgColor
        mainView.layer.cornerRadius = 10
        leftView.layer.borderColor = UIColor.separator.cgColor
        leftView.layer.cornerRadius = 10
        rightView.layer.borderColor = UIColor.separator.cgColor
        rightView.layer.cornerRadius = 10
        
        qrScannerView.layer.borderColor = UIColor.separator.cgColor
        qrScannerView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    @IBAction func btnOtherOptionTapped(_ sender: Any) {
        dropDown.show()
    }
    
}
extension QRPaymentsCell {
    func dropdown() {
        // The view to which the drop down will appear on
        dropDown.anchorView = vwOtherOption // UIView or UIBarButtonItem

        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = arrNames
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.lblOtherOption.text = arrNames[index]
        }
        
        // Top of drop down will be below the anchorView
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        
        // When drop down is displayed with `Direction.top`, it will be above the anchorView
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
    
        dropDown.direction = .any
    }
    func DefaultsData() {
        if let data = UserDefaults.standard.array(forKey: "qrNames") as? [String] {
            self.arrNames = data
            dropdown()
        }
    }
}
