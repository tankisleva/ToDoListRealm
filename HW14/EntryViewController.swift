//
//  EntryViewController.swift
//  HW14
//
//  Created by Олег Малышев on 11.07.2021.
//
import RealmSwift
import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    
    private let realm = try! Realm()
    public var completionHandler: (() -> Void)?
   

    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        saveTask()
//        return true
//    }
    
    @objc func saveTask(){
        if let text = field.text, !text.isEmpty {
            realm.beginWrite()
            let newTask = ToDoListTask()
            newTask.task = text
            realm.add(newTask)
            try! realm.commitWrite()
            completionHandler?()
            navigationController?.popToRootViewController(animated: true)
        }
        else {
            print("Add something")
        }



}

}
