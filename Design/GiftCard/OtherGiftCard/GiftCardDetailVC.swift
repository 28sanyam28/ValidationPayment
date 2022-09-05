//
//  GiftCardDetailVC.swift
//  Design
//
//  Created by apple on 31/08/22.
//

import UIKit

class GiftCardDetailVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var lowerView: UIView!
    @IBOutlet weak var upperTextField: UITextField!
    @IBOutlet weak var lowerTextField: UITextField!
    @IBOutlet weak var btnGetDetails: UIButton!
    @IBOutlet weak var lblView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        borderUpperView()
        borderLowerView()
        btnGetDetails.clipsToBounds = true
        btnGetDetails.layer.cornerRadius = 10
        btnGetDetails.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
        lblView.layer.borderColor = UIColor.separator.cgColor
        lblView.layer.cornerRadius = 10
    }
    @IBAction func btnCloseTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension GiftCardDetailVC {
    func borderUpperView() {
        upperView.backgroundColor = .white

        let borderLabelView = BorderLabelView(labelName: "16 Digits Gift Card Number")
            upperView.addSubview(borderLabelView)

        borderLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        borderLabelView.topAnchor.constraint(equalTo: upperView.topAnchor, constant: 0).isActive = true

        borderLabelView.bottomAnchor.constraint(equalTo: upperView.bottomAnchor, constant: 0).isActive = true

        borderLabelView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        borderLabelView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 40).isActive = true
        upperText()
    }
    func borderLowerView() {
        lowerView.backgroundColor = .white

        let borderLabelView = BorderLabelView(labelName: "4 Digits Gift Card Pin")
        lowerView.addSubview(borderLabelView)

        borderLabelView.translatesAutoresizingMaskIntoConstraints = false
        borderLabelView.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 0).isActive = true

        borderLabelView.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor, constant: 0).isActive = true

        borderLabelView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        borderLabelView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 40).isActive = true
        lowerText()
    }
    func upperText() {
        upperTextField.font = UIFont.systemFont(ofSize: 15)
        upperTextField.autocorrectionType = UITextAutocorrectionType.no
        upperTextField.keyboardType = UIKeyboardType.default
        upperTextField.returnKeyType = UIReturnKeyType.done
        upperTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        upperTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        upperTextField.delegate = self
        upperTextField.keyboardType = .numberPad
        self.upperView.addSubview(upperTextField)
    }
    func lowerText() {
        lowerTextField.font = UIFont.systemFont(ofSize: 15)
        lowerTextField.autocorrectionType = UITextAutocorrectionType.no
        lowerTextField.keyboardType = UIKeyboardType.default
        lowerTextField.returnKeyType = UIReturnKeyType.done
        lowerTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        lowerTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        lowerTextField.delegate = self
        lowerTextField.keyboardType = .numberPad
        self.lowerView.addSubview(lowerTextField)
      }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == upperTextField {
            upperTextField.becomeFirstResponder()
                    let allowedCharacters = "1234567890"
                    let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
                    let typedCharacterSet = CharacterSet(charactersIn: string)
                    let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
                    let Range = range.length + range.location > (upperTextField.text?.count)!

            if Range == false && alphabet == false {
                return false
            }

            

            let NewLength = (upperTextField.text?.count)! + string.count - range.length
            return NewLength <= 16
          }
        if textField == lowerTextField {
            lowerTextField.becomeFirstResponder()
                        let allowedCharacters = "1234567890"
                        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
                        let typedCharacterSet = CharacterSet(charactersIn: string)
                        let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
                        let Range = range.length + range.location > (lowerTextField.text?.count)!

                if Range == false && alphabet == false {
                    return false
                }


                let NewLengths = (lowerTextField.text?.count)! + string.count - range.length
                return NewLengths <= 4
        }
        else {
            return false
        }
    }
}
