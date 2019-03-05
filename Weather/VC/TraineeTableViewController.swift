//
//  TraineeTableViewController.swift
//  TableViewPractice
//
//  Created by Serhiy Rosovskyy on 3/5/19.
//  Copyright © 2019 UCU. All rights reserved.
//

import UIKit

class TraineeTableViewController: UITableViewController {

    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Month"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibName = UINib(nibName: "MonthTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "monthTableViewCell")
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return months.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "monthTableViewCell", for: indexPath) as! MonthTableViewCell
        cell.commonInit(month: months[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = DetailVC()
            vc.commonInit(month: years[myIndex].mm[indexPath.row])
            self.navigationController?.pushViewController(vc, animated: true)
            self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
