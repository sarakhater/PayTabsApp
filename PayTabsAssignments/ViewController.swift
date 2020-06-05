//
//  ViewController.swift
//  PayTabsAssignments
//
//  Copyright © 2020 sarakhater. All rights reserved.
//
//For test CheckOut with below data
/*Name on Card:  John Doe
 Card Number:  4000 0000 0000 0051
 Expiry:  02/22  CVV:  111*/



import UIKit


class ViewController: UIViewController {
    
    
    var initialSetupViewController: PTFWInitialSetupViewController!
    
    var resultController = PaymentResultViewController()
    
    var secretKey = "bzRMnRWyl7d80ouETHBo7zKTFUI8NGBYfsLCkHaFOoOPNitG0557EP1kJJsxp4vFxhiRZswORkDED7lDcqKRgLb0vExUI3zfkR7j"
    
    var activityIndicator = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    //MARK:- Actions
    @IBAction func PayNowClicked(_ sender: UIButton) {
        showPaymentScreen();
        
    }
    
    func showPaymentScreen(){
        let bundle = Bundle(url: Bundle.main.url(forResource: "Resources", withExtension: "bundle")!)
        self.initialSetupViewController = PTFWInitialSetupViewController.init(
            bundle: bundle,
            andWithViewFrame: self.view.frame,
            andWithAmount: 5.0,
            andWithCustomerTitle: "Pay Now With PayTabs",
            andWithCurrencyCode: "EGP",
            andWithTaxAmount: 0.0,
            andWithSDKLanguage: "en",
            andWithShippingAddress: "Cairo",
            andWithShippingCity: "Cairo",
            andWithShippingCountry: "BHR",
            andWithShippingState: "Cairo",
            andWithShippingZIPCode: "123456",
            andWithBillingAddress: "Cairo",
            andWithBillingCity: "Cairo",
            andWithBillingCountry: "BHR",
            andWithBillingState: "Cairo",
            andWithBillingZIPCode: "12345",
            andWithOrderID: "100",
            andWithPhoneNumber: "00201028284349",
            andWithCustomerEmail: "rhegazy@paytabs.com",
            andIsTokenization:true,
            andIsPreAuth: false,
            andWithMerchantEmail: "sarakhater2014@gmail.com",
            andWithMerchantSecretKey: secretKey,
            andWithAssigneeCode: "SDK",
            andWithThemeColor:UIColor.red,
            andIsThemeColorLight: false)
        
        self.initialSetupViewController.didReceiveBackButtonCallback = {
            
        }
        
        self.initialSetupViewController.didStartPreparePaymentPage = {
            // Start Prepare Payment Page
            // Show loading indicator
            self.activityIndicator.startAnimating()
        }
        self.initialSetupViewController.didFinishPreparePaymentPage = {
            // Finish Prepare Payment Page
            // Stop loading indicator
            self.activityIndicator.stopAnimating()
        }
        
        self.initialSetupViewController.didReceiveFinishTransactionCallback = {(responseCode, result, transactionID, tokenizedCustomerEmail, tokenizedCustomerPassword, token, transactionState) in
            print("Response Code: \(responseCode)")
            print("Response Result: \(result)")
            
            // In Case you are using tokenization
            print("Tokenization Cutomer Email: \(tokenizedCustomerEmail)");
            print("Tokenization Customer Password: \(tokenizedCustomerPassword)");
            print("TOkenization Token: \(token)");
            
            
            self.presenResultController(result : result);
            
            
            
        }
        
        self.view.addSubview(initialSetupViewController.view)
        self.addChild(initialSetupViewController)
        
        initialSetupViewController.didMove(toParent: self)
    }
    
    
    func presenResultController(result : String){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        self.resultController = storyBoard.instantiateViewController(withIdentifier: "PaymentResultViewController") as! PaymentResultViewController;
        self.resultController.resultString = result
        
        self.navigationController?.pushViewController(self.resultController, animated: true)
        
    }
}

