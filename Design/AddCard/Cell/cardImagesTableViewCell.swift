//
//  cardImagesTableViewCell.swift
//  Design
//
//  Created by Sarwopari Patodi on 18/08/22.
//

import UIKit

class cardImagesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageMC: UIImageView!
    @IBOutlet weak var imageVC: UIImageView!
    @IBOutlet weak var imageJC: UIImageView!
    @IBOutlet weak var imageUC: UIImageView!
    
    
    var imageStrM = String()
    var imageStrV = String()
    var imageStrJ = String()
    var imageStrU = String()
    
    var arrPayments = [String]()
    var arrImages: [UIImage] = []

    
    override func awakeFromNib() {
        super.awakeFromNib()
        defaults()
    }
    
}

extension cardImagesTableViewCell {
    func defaults() {
        if let data = UserDefaults.standard.array(forKey: "PaymentCard") as? [String] {
            
            self.arrPayments = data
            
            imageStrM = arrPayments[0]
            imageStrV = arrPayments[1]
            imageStrJ = arrPayments[2]
            imageStrU = arrPayments[3]
            
            imageStrM.stringToImages {(image) in
                DispatchQueue.main.async {
                    self.imageMC.image = image
                }
            }
            imageStrV.stringToImages {(image) in
                DispatchQueue.main.async {
                    self.imageVC.image = image
                }
            }
            imageStrJ.stringToImages {(image) in
                DispatchQueue.main.async {
                    self.imageJC.image = image
                }
            }
            imageStrU.stringToImages {(image) in
                DispatchQueue.main.async {
                    self.imageUC.image = image
                }
            }
        }
    }
}
extension String {

    func stringToImage(_ handler: @escaping ((UIImage?)->())) {
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
