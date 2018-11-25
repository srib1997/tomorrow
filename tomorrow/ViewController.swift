//
//  ViewController.swift
//  tomorrow
//
//  Created by srib on 23/11/2018.
//  Copyright © 2018 brainstone. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBAction func editItem(_ sender: UIBarButtonItem) {
        
        tabel.setEditing(true, animated: true)
    }
    
    @IBAction func editDoneItem(_ sender: UIBarButtonItem) {
        
        tabel.setEditing(false, animated: true)
    }
    
    @IBOutlet weak var tabel: UITableView!
    
    var items: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        
        cell.textLabel?.textColor = UIColor.black
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
        }
        
        tabel.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            items.remove(at: indexPath.row)
            
            tabel.reloadData()
            
            UserDefaults.standard.set(items, forKey: "items")
        }
    }
    
    @IBAction func backToFirstPage(_ sague: UIStoryboardSegue) {
        
        tabel.reloadData()
    }
}

