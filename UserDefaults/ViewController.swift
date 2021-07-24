//
//  ViewController.swift
//  HW14
//
//  Created by Олег Малышев on 10.07.2021.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var fNameLabel: UILabel!
    
    @IBOutlet weak var sNameLabel: UILabel!
    
    
    
    @IBOutlet weak var fField: UITextField!
    
    
    
    @IBOutlet weak var sField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fNameLabel.text = UserDefData.shared.firstName
        sNameLabel.text = UserDefData.shared.secondName
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UserDefData.shared.firstName = fField.text
        UserDefData.shared.secondName = sField.text
    }


}

