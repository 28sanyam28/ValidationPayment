//
//  GiftCardDetailVC.swift
//  Design
//
//  Created by apple on 31/08/22.
//

import UIKit

class GiftCardDetailVC: UIViewController {

    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var lowerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        borderUpperView()
        borderLowerView()
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
    }
}
