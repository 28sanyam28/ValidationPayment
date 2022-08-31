//
//  AddCardVc.swift
//  Design
//
//  Created by apple on 26/08/22.
//

import UIKit
import DropDown

class AddCardVc: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let dropDown = DropDown()
    var arr: [String] = []
    var MMYY: String?
    
    var iString = String()
    var jString = String()
    var arrString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    func registerCells() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionFooterHeight = CGFloat.leastNormalMagnitude
        
        self.tableView.register(UINib(nibName: "HeaderFooterTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderFooterTableViewCell")
        self.tableView.register(UINib(nibName: "cardImagesTableViewCell", bundle: nil), forCellReuseIdentifier: "cardImagesTableViewCell")
        self.tableView.register(UINib(nibName: "CardDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "CardDetailsTableViewCell")
        self.tableView.register(UINib(nibName: "CardDetailSubmissionTableViewCell", bundle: nil), forCellReuseIdentifier: "CardDetailSubmissionTableViewCell")
    }

}

extension AddCardVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderFooterTableViewCell") as! HeaderFooterTableViewCell
            cell.backButton.addTarget(self, action: #selector(backButtonTapped(sender:)), for: .touchUpInside)
            return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cardImagesTableViewCell") as! cardImagesTableViewCell
//            cell.backButton.addTarget(self, action: #selector(backButtonTapped(sender:)), for: .touchUpInside)
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardDetailsTableViewCell") as! CardDetailsTableViewCell
            cell.dateAndMonthTextField.text = MMYY
            return cell
        }
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardDetailSubmissionTableViewCell") as! CardDetailSubmissionTableViewCell
            return cell
        }
       return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    @objc func backButtonTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
