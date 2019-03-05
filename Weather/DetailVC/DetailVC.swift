//
//  DetailVC.swift
//  TableViewPractice
//
//  Created by Serhiy Rosovskyy on 3/5/19.
//  Copyright © 2019 UCU. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var tMaxLabel: UILabel!
    @IBOutlet weak var tMinLabel: UILabel!
    @IBOutlet weak var afLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var sunLabel: UILabel!
    
    var monthName: String!
    var tMaxName: String!
    var tMinName: String!
    var afName: String!
    var rainName: String!
    var sunName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.monthLabel.text = monthName
        if tMaxName == "---" {
            self.tMaxLabel.text = "No info =("
        } else {
            self.tMaxLabel.text = tMaxName
        }
        
        if tMinName == "---" {
            self.tMinLabel.text = "No info =("
        } else {
            self.tMinLabel.text = tMinName
        }
        
        if afName == "---" {
            self.afLabel.text = "No info =("
        } else {
            self.afLabel.text = afName
        }
        
        if rainName == "---" {
            self.rainLabel.text = "No info =("
        } else {
            self.rainLabel.text = rainName
        }
        
        if sunName == "---" {
            self.sunLabel.text = "No info =("
        } else {
            self.sunLabel.text = sunName
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func commonInit(month: Month) {
        monthName = month.number
        tMaxName = month.tmax
        tMinName = month.tmin
        afName = month.af
        rainName = month.rain
        sunName = month.sun
    }
    
}
