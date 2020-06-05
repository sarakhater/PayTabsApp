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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        bigView.layer.cornerRadius = 15;
        bigView.layer.borderWidth = 1;
        bigView.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    func setData(){
        self.resultLabel.text = resultString;
    }
    
}
