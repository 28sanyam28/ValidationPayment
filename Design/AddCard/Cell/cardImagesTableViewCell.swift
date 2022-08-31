//
//  cardImagesTableViewCell.swift
//  Design
//
//  Created by Sarwopari Patodi on 18/08/22.
//

import UIKit

class cardImagesTableViewCell: UITableViewCell {
    @IBOutlet weak var backButtonView: UIView!
    @IBOutlet weak var cardCollectionView: UICollectionView!
    @IBOutlet weak var backButtonImage: UIImageView!
    @IBOutlet weak var backButtonLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var imageStrM = String()
    var imageStrV = String()
    var imageStrJ = String()
    var imageStrU = String()
    
    var imageM = UIImage()
    var imageV = UIImage()
    var imageJ = UIImage()
    var imageU = UIImage()
    
    var arrPayments = [String]()
    var arrImages: [UIImage] = []

    
    override func awakeFromNib() {
        super.awakeFromNib()
        defaults()
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        cardCollectionView.register(UINib(nibName: "CardImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CardImageCollectionViewCell")
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        
        
    }
}

extension cardImagesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width) / 4, height: 42)
    }
}

extension cardImagesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in _: UICollectionView) -> Int {
        1
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return arrImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardImageCollectionViewCell", for: indexPath) as! CardImageCollectionViewCell
        cell.cardImage.image = arrImages[indexPath.row]
        return cell
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
                
                    self.imageM = image!
                    self.arrImages.append(self.imageM)
                    print(self.arrImages)
                
            }
            imageStrV.stringToImages {(image) in
                
                    self.imageV = image!
                    self.arrImages.append(self.imageV)
                    print(self.arrImages)
                
            }
            imageStrJ.stringToImages {(image) in
            
                    self.imageJ = image!
                    self.arrImages.append(self.imageJ)
                    print(self.arrImages)
                
            }
            imageStrU.stringToImages {(image) in
               
                    self.imageU = image!
                    self.arrImages.append(self.imageU)
                    print(self.arrImages)
                    
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
