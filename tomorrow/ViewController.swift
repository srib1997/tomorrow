//
//  ViewController.swift
//  tomorrow
//
//  Created by srib on 23/11/2018.
//  Copyright © 2018 brainstone. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    let cellContent = ["Rob", "kirsten", "tommy" , "relphine"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = cellContent[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let arrayObject = UserDefaults.standard.object(forKey: "name")
        
        if let araay = arrayObject as? NSArray {
            
            print(araay)
            
        }
        
        UserDefaults.standard.set(cellContent, forKey: "name")
        
    }


}

