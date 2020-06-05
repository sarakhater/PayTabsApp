//
//  PaymentResultViewController.swift
//  PayTabsAssignments
//
//  Created by unitlabs on 6/5/20.
//  Copyright © 2020 sarakhater. All rights reserved.
//

import UIKit

class PaymentResultViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var bigView: UIView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    var resultString = ""
    var resultCode = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        bigView.layer.cornerRadius = 15;
        bigView.layer.borderWidth = 1;
        bigView.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)

       
    }
    
    func setData(){
        self.resultLabel.text = resultString;
               
//               if resultCode == 100 {
//                   self.image.image = UIImage(named: "successful-icon")
//               }else{
//                     self.image.image = UIImage(named: "unsuccessful-icon")
//               }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
