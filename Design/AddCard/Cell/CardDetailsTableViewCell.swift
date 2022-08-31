//
//  CardDetailsTableViewCell.swift
//  Design
//
//  Created by Sarwopari Patodi on 19/08/22.
//

import UIKit

class CardDetailsTableViewCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var dateAndMonthView: UIView!
    
    @IBOutlet weak var cardNumberView: UIView!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var cardNumberImageView: UIImageView!
    
    @IBOutlet var dateAndMonthTextField: UITextField!
    @IBOutlet weak var dateAndMonthLabel: UILabel!
    @IBOutlet weak var dateAndMonthDropDownButton: UIButton!
    
    @IBOutlet weak var cvvTextField: UITextField!
    @IBOutlet weak var cvvImageView: UIImageView!
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.mainView.layer.cornerRadius = 10
        cardNumberTextField.delegate = self
        cvvTextField.delegate = self
        nameTextField.delegate = self
        dateAndMonthTextField.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func dropDownButtonAction(_ sender: UIButton) {
        
        }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == cardNumberTextField {
                    let allowedCharacters = "1234567890"
                    let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
                    let typedCharacterSet = CharacterSet(charactersIn: string)
                    let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
                    let Range = range.length + range.location > (cardNumberTextField.text?.count)!

            if Range == false && alphabet == false {
                return false
            }

            

            let NewLength = (cardNumberTextField.text?.count)! + string.count - range.length
            if cardNumberTextField.text != "" {
                UserDefaults.standard.set(cardNumberTextField.text, forKey: "CardNumber")
            }
            return NewLength <= 16
          }
        if textField == cvvTextField {
                        let allowedCharacters = "1234567890"
                        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
                        let typedCharacterSet = CharacterSet(charactersIn: string)
                        let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
                        let Range = range.length + range.location > (cvvTextField.text?.count)!

                if Range == false && alphabet == false {
                    return false
                }


                let NewLengths = (cvvTextField.text?.count)! + string.count - range.length
                return NewLengths <= 3
        }
        if textField == nameTextField {
                        let allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
                        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
                        let typedCharacterSet = CharacterSet(charactersIn: string)
                        let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
                        return alphabet
        }
        if textField == dateAndMonthTextField {
            guard let text = textField.text else { return true }
                let newLength = text.count + string.count - range.length
                let characterSet = CharacterSet(charactersIn: string)
            if text.count == 2, !string.isEmpty {
                textField.text = text + "/"
            }
                return CharacterSet.decimalDigits.isSuperset(of: characterSet) && newLength <= 5

        }
        else {
            return false
        }
      }
}
extension CardDetailsTableViewCell {
    func validCheck(card: String, date: String) -> Bool
    {
        cardNumberTextField.text = card
        dateAndMonthTextField.text = date
        if card == "" && date == "" {
            print("Empty")
            return false
        }
        return true
    }
}
