//
//  SecondViewController.swift
//  tomorrow
//
//  Created by srib on 23/11/2018.
//  Copyright © 2018 brainstone. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func add(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items:[String]
        
        let now = Date()
        
        let dformatter = DateFormatter()
        
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
            items.append(dformatter.string(from: now) + "    " + itemTextField.text!)
            
            print(items)
        } else {
            
            items = [dformatter.string(from: now) + "    " + itemTextField.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        
        itemTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}
