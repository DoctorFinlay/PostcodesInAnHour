//
//  ResultsVC.swift
//  PostcodesInAnHour
//
//  Created by Iain Coleman on 15/01/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {
    
    @IBOutlet weak var postcodeLbl: UILabel!
    @IBOutlet weak var parishLbl: UILabel!
    @IBOutlet weak var regionLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var constituencyLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let location = APIService.instance.currentLocation {
            self.postcodeLbl.text = location.postcode
            self.parishLbl.text = "Parish: \(location.parish!)"
            self.regionLbl.text = "Region: \(location.region!)"
            self.countryLbl.text = "Country: \(location.country!)"
            self.constituencyLbl.text = "Constituency: \(location.constituency!)"
        } else {
                    self.postcodeLbl.text = "Postcode not found :("
                    self.parishLbl.text = ""
                    self.regionLbl.text = ""
                    self.countryLbl.text = ""
                    self.constituencyLbl.text = ""
        }
        

        
        
    }

    
    
}
