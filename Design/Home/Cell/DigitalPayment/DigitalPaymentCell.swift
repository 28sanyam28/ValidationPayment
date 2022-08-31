//
//  DigitalPaymentCell.swift
//  Design
//
//  Created by apple on 10/08/22.
//

import UIKit
import DropDown

class DigitalPaymentCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var vwOtherBank: UIView!
    @IBOutlet weak var btnOtherBank: UIButton!
    @IBOutlet weak var lblOtherBank: UILabel!
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet var image4: UIImageView!
    @IBOutlet var image5: UIImageView!
    @IBOutlet var image6: UIImageView!
    
    @IBOutlet var btnImage1: UIButton!
    @IBOutlet var btnImage2: UIButton!
    @IBOutlet var btnImage3: UIButton!
    @IBOutlet var btnImage4: UIButton!
    @IBOutlet var btnImage5: UIButton!
    @IBOutlet var btnImage6: UIButton!
    
    let dropDown = DropDown()
    var arrNames = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DefaultsData()
        vwOtherBank.clipsToBounds = true
        vwOtherBank.layer.cornerRadius = 10
        vwOtherBank.layer.borderWidth = 1
        vwOtherBank.layer.borderColor = UIColor.separator.cgColor
        vwOtherBank.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
        mainView.layer.borderColor = UIColor.separator.cgColor
        mainView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnOtherBankTapped(_ sender: Any) {
        dropDown.show()
    }
}
extension DigitalPaymentCell {
    func dropdown() {
        // The view to which the drop down will appear on
        dropDown.anchorView = vwOtherBank // UIView or UIBarButtonItem

        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = arrNames
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.lblOtherBank.text = arrNames[index]
        }
        
        // Top of drop down will be below the anchorView
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        
        // When drop down is displayed with `Direction.top`, it will be above the anchorView
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
    
        dropDown.direction = .any
    }
    func DefaultsData() {
        if let data = UserDefaults.standard.array(forKey: "names") as? [String] {
            self.arrNames = data
            dropdown()
        }
    }
}
