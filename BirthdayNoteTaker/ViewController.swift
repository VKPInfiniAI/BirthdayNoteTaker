//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Krishna Prakash on 25/11/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var NameTxtFld: UITextField!
    
    @IBOutlet weak var BirthdayTxtFld: UITextField!
    
    
    @IBOutlet weak var NameLBL: UILabel!
    
    @IBOutlet weak var BirthdayLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        // Casting -> as?(Optional Casting) vs as! (Forced Casting)
        if let NewName = storedName as? String{
            NameLBL.text = "Name: \(NewName)"
        }
        if let NewBirthday = storedBirthday as? String {
            BirthdayLbl.text = "Birthday: \(NewBirthday)"
        }
        
    }

    @IBAction func SaveClicked(_ sender: Any) {
        UserDefaults.standard.set(NameTxtFld.text!, forKey: "name")
        UserDefaults.standard.set(BirthdayTxtFld.text!, forKey: "birthday")
        //UserDefaults.standard.synchronize()
        
        NameLBL.text = "Name: \(NameTxtFld.text!)"
        BirthdayLbl.text = "Birthday: \(BirthdayTxtFld.text!)"
    }
    
    @IBAction func DeleteBTN(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            NameLBL.text = "Name: "
        }
        
        if (storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
            BirthdayLbl.text = "Birthday: "
        }
        
        
        
    }
    
    

}

