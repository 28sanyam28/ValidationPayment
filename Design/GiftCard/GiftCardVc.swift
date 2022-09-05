//
//  GiftCardVc.swift
//  Design
//
//  Created by apple on 30/08/22.
//

import UIKit

class GiftCardVc: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var lowerView: UIView!
    @IBOutlet weak var btnBalance: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var arrHeading:[String] = ["7777 XXXX XXXX 0938","7777 XXXX XXXX 0501","7777 XXXX XXXX 0501"]
    var arrSubHeading:[String] = ["CARD BALANCE 500 THB","CARD BALANCE 300 THB","CARD BALANCE 300 THB"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actFirst()
    }

    @IBAction func btnClose(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func GiftCardButtonTapped(_ sender: Any) {
        let Vc = GiftCardDetailVC(nibName: "GiftCardDetailVC", bundle: nil)
        self.navigationController!.pushViewController(Vc, animated: true)
    }
}
extension GiftCardVc {
    func actFirst() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "GiftCardCell", bundle: nil), forCellReuseIdentifier: "GiftCardCell")
        
        upperView.layer.borderColor = UIColor.separator.cgColor
        upperView.layer.cornerRadius = 10
        lowerView.layer.borderColor = UIColor.separator.cgColor
        lowerView.layer.cornerRadius = 10
        btnBalance.layer.borderWidth = 0.5
        btnBalance.layer.borderColor = UIColor.yellow.cgColor
        btnBalance.layer.cornerRadius = 10
    }
}
extension GiftCardVc {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrHeading.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GiftCardCell", for: indexPath) as! GiftCardCell
        cell.lblHeading.text = arrHeading[indexPath.row]
        cell.lblSubHeading.text = arrSubHeading[indexPath.row]
        cell.btnRemove.tag = indexPath.row
        cell.btnRemove.addTarget(self, action: #selector(checkButtonTapped(sender:)), for: .touchUpInside)
        return cell
    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//            arrHeading.remove(at:indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
//        }
//    }
    @objc func checkButtonTapped(sender : UIButton){
        let point = sender.convert(CGPoint.zero, to: tableView)
              guard let indexpath = tableView.indexPathForRow(at: point) else {return}
              arrHeading.remove(at: indexpath.row)
              tableView.beginUpdates()
              tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left)
              tableView.endUpdates()
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.layoutIfNeeded()
    }
}
