//
//  ViewController.swift
//  TableViewPractice
//
//  Created by Serhiy Rosovskyy on 3/5/19.
//  Copyright © 2019 UCU. All rights reserved.
//

import UIKit

var years = [Year]()
var myIndex = 0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Year"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "tableViewCell")
        
        self.loadTxt()
        
    }
    
    func loadTxt() {
        let url = URL(string: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/bradforddata.txt")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error as Any)
            } else {
                
                let htmlContent = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)?.replacingOccurrences(of: "Provisional", with: "").replacingOccurrences(of: "\r", with: "").replacingOccurrences(of: "\n", with: "")
                var html = htmlContent!.characters.split{$0 == " "}.map(String.init)
                if let i = html.index(where: { $0 == "hours" }) {
                    html.removeSubrange(0...i)
                }
                
                for i in 0 ..< html.count/7 {
                    let x = i * 7
                    if i % 12 == 0 {
                        years.append(Year(year: html[x], mm: [Month(number: html[x+1], tmax: html[x+2], tmin: html[x+3], af: html[x+4], rain: html[x+5], sun: html[x+6])]))
                        
                    } else {
                        let last = years.count - 1
                        years[last].mm.append(Month(number: html[x+1], tmax: html[x+2], tmin: html[x+3], af: html[x+4], rain: html[x+5], sun: html[x+6]))
                    }
                }
                
                OperationQueue.main.addOperation({
                    self.tableView.reloadData()
                })
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return years.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.commonInit(year: years[indexPath.row].year!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        myIndex = indexPath.row
        performSegue(withIdentifier: "monthDummy", sender: self)
//        let vc = DetailVC()
//        vc.commonInit(year: years[indexPath.row])
//        self.navigationController?.pushViewController(vc, animated: true)
//        self.tableView.deselectRow(at: indexPath, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

