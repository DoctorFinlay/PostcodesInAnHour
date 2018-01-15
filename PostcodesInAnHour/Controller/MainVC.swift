//
//  ViewController.swift
//  PostcodesInAnHour
//
//  Created by Iain Coleman on 15/01/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    
    
    @IBAction func btnPressed(_ sender: Any) {
        
        if textField.text != "" {
            let postcodeToTrim = textField.text!
            let trimmedPostcode = postcodeToTrim.removingWhitespaces()
            APIService.instance.getLocation(postcode: trimmedPostcode, completion: { (success) in
                if success {
                    self.performSegue(withIdentifier: TO_RESULTS_VC, sender: nil)
                } else {
                    self.showErrorAlert()
                }
            })
        }
    }
    
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Please enter a valid postcode.", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .destructive) { (action) -> Void in
            
        }
        alert.addAction(okButton)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }


}

