//
//  ViewController.swift
//  Design
//
//  Created by apple on 09/08/22.
//

import UIKit

class ViewController: UIViewController {
    var sections = [
        Section(expanded: false)
    ]
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewAmountLabel: UILabel!
    @IBOutlet weak var headerViewPaymentLabel: UILabel!
    
    var result: [Result]?
    var channelCategory: [ChannelCategory]?
    var channel: [Channel]?
    var names = [String]()
    
    //Global
    var imageStrM: String = ""
    var imageStrV: String = ""
    var imageStrJ: String = ""
    var imageStrU: String = ""
    
    var imageStrD: String?
    var imageStrD1: String?
    var imageStrD2: String?
    var imageStrD3: String?
    var imageStrD4: String?
    var imageStrD5: String?
    
    var qrImage = [String]()
    var qrName = [String]()
    
    var overImage = [String]()
    var overName = [String]()
    
    var ATMImage = [String]()
    var ATMName = [String]()
    
    var InternetImage = [String]()
    var InternetName = [String]()
    
    var WebImage = [String]()
    var WebName = [String]()
    
    var arrPayments: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomePage()
    }
    
    func setupHomePage() {
        tableView.backgroundColor = Constant.Colors.colorF4F4F4
//        registerCells()
        json()
        headerViewSetup()
    }
    
    func headerViewSetup() {
        headerView.clipsToBounds = true
        headerView.layer.cornerRadius = 15
        headerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        headerViewPaymentLabel.font = UIFont(name: Constant.FontNames.RobotoCondensedBold, size: 15.0)
        headerViewPaymentLabel.textColor =  Constant.Colors.color000000
        headerViewPaymentLabel.text = "PAYMENT"
        
        headerViewAmountLabel.font = UIFont(name: Constant.FontNames.RobotoCondensedLight, size: 15.0)
        headerViewAmountLabel.textColor =  Constant.Colors.color424355
        let amount = result?[0].transactionDetails?.amount ?? "0"
        let total = "Total"
        headerViewAmountLabel.text = total + " " + amount
    }
    func registerCells() {
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "GlobalCardsCell", bundle: nil), forCellReuseIdentifier: "GlobalCardsCell")
        self.tableView.register(UINib(nibName: "DigitalPaymentCell", bundle: nil), forCellReuseIdentifier: "DigitalPaymentCell")
        self.tableView.register(UINib(nibName: "QRPaymentsCell", bundle: nil), forCellReuseIdentifier: "QRPaymentsCell")
        self.tableView.register(UINib(nibName: "OverTheCounterCell", bundle: nil), forCellReuseIdentifier: "OverTheCounterCell")
        self.tableView.register(UINib(nibName: "ATMKIOSKCell", bundle: nil), forCellReuseIdentifier: "ATMKIOSKCell")
        self.tableView.register(UINib(nibName: "InternetMobileBankingCell", bundle: nil), forCellReuseIdentifier: "InternetMobileBankingCell")
        self.tableView.register(UINib(nibName: "WebPayDirectDebitCell", bundle: nil), forCellReuseIdentifier: "WebPayDirectDebitCell")
        self.tableView.register(UINib(nibName: "HaveAGiftCardCell", bundle: nil), forCellReuseIdentifier: "HaveAGiftCardCell")
    }
}
//MARK: JSON DECODER
extension ViewController {
    func json() {
        guard let path = Bundle.main.url(forResource: "paymentInIt", withExtension: "json") else {
            fatalError("Could not find JSON")
        }
        guard let jsonData = try? Data(contentsOf: path) else {
            fatalError("Could not Convert Data")
        }
        
            result = try? JSONDecoder().decode([Result].self, from: jsonData)
        self.channelCategory = result?[0].psp2C2P?.channelCategories
        self.channel = result?[0].psp2C2P?.channelCategories?[1].groups?[0].details?.channels
        print(self.channel!.count)
        for i in 0...5 {
            self.names.append(self.channel?[i].name ?? "")
            UserDefaults.standard.set(names, forKey: "names")
        }
        print(self.channelCategory ?? [])
        self.imageStrM = result?[0].psp2C2P?.channelCategories?[0].groups?[0].details?.channels?[0].iconURL ?? ""
        self.imageStrV = result?[0].psp2C2P?.channelCategories?[0].groups?[0].details?.channels?[1].iconURL ?? ""
        self.imageStrJ = result?[0].psp2C2P?.channelCategories?[0].groups?[0].details?.channels?[2].iconURL ?? ""
        self.imageStrU = result?[0].psp2C2P?.channelCategories?[0].groups?[0].details?.channels?[3].iconURL ?? ""
        self.arrPayments = [imageStrM, imageStrV, imageStrJ, imageStrU]
        
        UserDefaults.standard.set(arrPayments, forKey: "PaymentCard")
        
        self.imageStrD = result?[0].psp2C2P?.channelCategories?[1].groups?[0].details?.channels?[0].logoURL
        self.imageStrD1 = result?[0].psp2C2P?.channelCategories?[1].groups?[0].details?.channels?[1].logoURL
        self.imageStrD2 = result?[0].psp2C2P?.channelCategories?[1].groups?[0].details?.channels?[2].logoURL
        self.imageStrD3 = result?[0].psp2C2P?.channelCategories?[1].groups?[0].details?.channels?[3].logoURL
        self.imageStrD4 = result?[0].psp2C2P?.channelCategories?[1].groups?[0].details?.channels?[4].logoURL
        self.imageStrD5 = result?[0].psp2C2P?.channelCategories?[1].groups?[0].details?.channels?[5].logoURL
        
        for i in 0...1 {
            let qr = result?[0].psp2C2P?.channelCategories?[2].groups?[0].details?.channels?[i].logoURL ?? ""
            self.qrImage.append(qr)
            UserDefaults.standard.set(qrImage, forKey: "qrImage")
            let name = result?[0].psp2C2P?.channelCategories?[2].groups?[0].details?.channels?[i].name ?? ""
            self.qrName.append(name)
            UserDefaults.standard.set(qrName, forKey: "qrNames")
        }
        for i in 0...4 {
            let overImg = result?[0].psp2C2P?.channelCategories?[3].groups?[0].details?.channels?[i].logoURL ?? ""
            self.overImage.append(overImg)
            
            let Overname = result?[0].psp2C2P?.channelCategories?[3].groups?[0].details?.channels?[i].name ?? ""
            self.overName.append(Overname)
            
            UserDefaults.standard.set(overName, forKey: "overNames")
        }
        for i in 0...5 {
            let overImg = result?[0].psp2C2P?.channelCategories?[4].groups?[0].details?.channels?[i].logoURL ?? ""
            self.ATMImage.append(overImg)
            
            let Overname = result?[0].psp2C2P?.channelCategories?[4].groups?[0].details?.channels?[i].name ?? ""
            self.ATMName.append(Overname)
            
            UserDefaults.standard.set(ATMName, forKey: "AtmNames")
        }
        for i in 0...4 {
            let overImg = result?[0].psp2C2P?.channelCategories?[5].groups?[0].details?.channels?[i].logoURL ?? ""
            self.InternetImage.append(overImg)
            
            let Overname = result?[0].psp2C2P?.channelCategories?[5].groups?[0].details?.channels?[i].name ?? ""
            self.InternetName.append(Overname)
            
            UserDefaults.standard.set(InternetName, forKey: "InternetNames")
        }
        for i in 0...7 {
            let overImg = result?[0].psp2C2P?.channelCategories?[6].groups?[0].details?.channels?[i].logoURL ?? ""
            self.WebImage.append(overImg)
            
            let Overname = result?[0].psp2C2P?.channelCategories?[6].groups?[0].details?.channels?[i].name ?? ""
            self.WebName.append(Overname)
            
            UserDefaults.standard.set(WebName, forKey: "WebNames")
        }
        showon()
    }
}

//MARK: Table View Data Source AND Header
extension ViewController: UITableViewDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.channelCategory?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GlobalCardsCell", for: indexPath) as! GlobalCardsCell
            imageStrM.stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.imageM.image = image
                }
            }
            imageStrV.stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.imageV.image = image
                }
            }
            imageStrJ.stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.imageJ.image = image
                }
            }
            imageStrU.stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.imageU.image = image
                }
            }
            cell.delegate = self
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DigitalPaymentCell", for: indexPath) as! DigitalPaymentCell
            imageStrD?.stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.image1.image = image
                }
            }
            imageStrD1?.stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.image2.image = image
                }
            }
            imageStrD2?.stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.image3.image = image
                }
            }
            imageStrD3?.stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.image4.image = image
                }
            }
            imageStrD4?.stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.image5.image = image
                }
            }
            imageStrD5?.stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.image6.image = image
                }
            }
//            cell.btnOtherBank.addTarget(self, action: #selector(backButtonTapped(sender:)), for: .touchUpInside)
                return cell
        }else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QRPaymentsCell", for: indexPath) as! QRPaymentsCell
            qrImage[0].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.leftImage.image = image
                }
            }
            qrImage[1].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.rightImage.image = image
                }
            }
            cell.btnQRCode.addTarget(self, action: #selector(backButtonTapped(sender:)), for: .touchUpInside)
                return cell
        }else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OverTheCounterCell", for: indexPath) as! OverTheCounterCell
            overImage[0].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img1.image = image
                }
            }
            overImage[1].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img2.image = image
                }
            }
            overImage[2].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img3.image = image
                }
            }
            overImage[3].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img4.image = image
                }
            }
            overImage[4].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img5.image = image
                }
            }
                return cell
        }else if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ATMKIOSKCell", for: indexPath) as! ATMKIOSKCell
            ATMImage[0].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img1.image = image
                }
            }
            ATMImage[1].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img2.image = image
                }
            }
            ATMImage[2].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img3.image = image
                }
            }
            ATMImage[3].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img4.image = image
                }
            }
            ATMImage[4].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img5.image = image
                }
            }
            ATMImage[5].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img6.image = image
                }
            }
                return cell
        }else if indexPath.section == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InternetMobileBankingCell", for: indexPath) as! InternetMobileBankingCell
            InternetImage[0].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img1.image = image
                }
            }
            InternetImage[1].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img2.image = image
                }
            }
            InternetImage[2].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img3.image = image
                }
            }
            InternetImage[3].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img4.image = image
                }
            }
            InternetImage[4].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img5.image = image
                }
            }
                return cell
        }else if indexPath.section == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WebPayDirectDebitCell", for: indexPath) as! WebPayDirectDebitCell
            WebImage[0].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img1.image = image
                }
            }
            WebImage[1].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img2.image = image
                }
            }
            WebImage[2].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img3.image = image
                }
            }
            WebImage[3].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img4.image = image
                }
            }
            WebImage[4].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img5.image = image
                }
            }
            WebImage[5].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img6.image = image
                }
            }
            WebImage[6].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img7.image = image
                }
            }
            WebImage[7].stringToImages {(image) in
                DispatchQueue.main.async {
                    cell.img8.image = image
                }
            }
                return cell
        }else if indexPath.section == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HaveAGiftCardCell", for: indexPath) as! HaveAGiftCardCell
            cell.btnPlus.addTarget(self, action: #selector(btnPlusTapped(sender:)), for: .touchUpInside)
                return cell
        }
        return UITableViewCell()

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if let footer = view as? UITableViewHeaderFooterView {
            footer.contentView.backgroundColor = UIColor.white
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = ExpandableHeaderView()
        header.customInit(title: self.channelCategory?[section].name ?? "", section: section, delegate: self)
        return header
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let identifier = channelCategory?[indexPath.section] else { return UITableView.automaticDimension }
        
//        switch indexPath.section {
//        case 0:
//            return 130
//        case 1:
//            return 400
//        case 2:
//            return 130
//        case 3:
//            return 400
//        case 4:
//            return 130
//        case 5:
//            return 400
//        case 6:
//            return 130
//        case 7:
//            return 400
//        case 8:
//            return 400
//        default:
//            return 0
//        }
//
        if (sections[indexPath.section].expanded) {
            if indexPath.section == 0 {
                return UITableView.automaticDimension
            }else if indexPath.section == 1 {
                return UITableView.automaticDimension
            }else if indexPath.section == 2 {
                return UITableView.automaticDimension
            }else if indexPath.section == 3 {
                return UITableView.automaticDimension
            }else if indexPath.section == 4 {
                return UITableView.automaticDimension
            }else if indexPath.section == 5 {
                return UITableView.automaticDimension
            }else if indexPath.section == 6 {
                return UITableView.automaticDimension
            }else if indexPath.section == 7 {
                return UITableView.automaticDimension
            }else {
            return 660
            }
        } else {
            return 0
        }
    }
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        
        sections[section].expanded = !sections[section].expanded
        tableView.beginUpdates()
        for i in 0 ..< (self.channelCategory?.count)! {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
}
extension String {

    func stringToImages(_ handler: @escaping ((UIImage?)->())) {
        if let url = URL(string: self) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    let image = UIImage(data: data)
                    handler(image)
                }
            }.resume()
        }
    }
}

extension ViewController: GlobalCardsCellDelegate {
    func addnewCardButtonClicked() {
//        let ac = AddCardViewController()
//            self.present(ac, animated: true, completion: nil)
        let sampleVC = AddCardVc(nibName: "AddCardVc", bundle: nil)
            self.navigationController?.pushViewController(sampleVC, animated: true)
    }
    @objc func backButtonTapped(sender: UIButton) {
        let Vc = QRCodeVC(nibName: "QRCodeVC", bundle: nil)
        self.navigationController!.pushViewController(Vc, animated: true)
    }
    @objc func btnPlusTapped(sender: UIButton) {
        let Vc = GiftCardVc(nibName: "GiftCardVc", bundle: nil)
        self.navigationController!.pushViewController(Vc, animated: true)
    }
//    func digitalNames() {
//        for i in 0...self.channel!.count {
//            self.names?.append(self.channel?[i].name ?? "")
//            print(self.names ?? [])
//        }
//    }
    func showon() {
        if self.channelCategory?.count == self.sections.count {
            registerCells()
        }
        else {
            let difference = self.channelCategory!.count - self.sections.count
            if difference > 0 {
                for i in 0...difference-1  {
                    sections.insert(contentsOf: [Section(expanded: false)], at: i)
                }
                if self.channelCategory?.count == self.sections.count {
                        registerCells()
                }
            }
            else {
                print("Ghar Ja")
            }
        }
    }
}
