//
//  QRCodeVC.swift
//  Design
//
//  Created by apple on 30/08/22.
//

import UIKit

class QRCodeVC: UIViewController {

    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var imgQR: UIImageView!
    @IBOutlet weak var lblCounter: UILabel!
    
    var arrImages = [String]()
    var timer: Timer?
    var totalTime = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DefaultsData()
        startOtpTimer()
    }

    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnCancelTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        endTimer()
    }
    
}
extension QRCodeVC {
    func DefaultsData() {
        if let data = UserDefaults.standard.array(forKey: "qrImage") as? [String] {
            self.arrImages = data
            firstAct()
        }
    }
    func firstAct() {
        arrImages[0].stringsToImages {(image) in
            DispatchQueue.main.async {
                self.leftImage.image = image
            }
        }
        arrImages[1].stringsToImages {(image) in
            DispatchQueue.main.async {
                self.rightImage.image = image
            }
        }
    }
    private func startOtpTimer() {
        self.totalTime = 660
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
        
    @objc func updateTimer() {
        print(self.totalTime)
        self.lblCounter.text = self.timeFormatted(self.totalTime) // will show timer
        if totalTime != 0 {
            totalTime -= 1  // decrease counter timer
        } else {
            if let timer = self.timer {
                timer.invalidate()
                self.timer = nil
            }
        }
    }
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02dm %02ds", minutes, seconds)
    }
    func endTimer() {
        timer?.invalidate()
    }
}
extension String {

    func stringsToImages(_ handler: @escaping ((UIImage?)->())) {
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
