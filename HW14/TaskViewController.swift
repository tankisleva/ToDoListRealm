//
//  TaskViewController.swift
//  HW14
//
//  Created by Олег Малышев on 11.07.2021.
//

import RealmSwift
import UIKit

class TaskViewController: UIViewController {
    
    public var task: ToDoListTask?
    public var deletionHandler: (() -> Void)?
    
    @IBOutlet var label: UILabel!
    
    private let realm = try! Realm()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = task?.task
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteTask))

    }
    
    @objc func deleteTask(){
        
        guard let task = self.task else {
            return
        }

        realm.beginWrite()
        realm.delete(task)
        try! realm.commitWrite()

        deletionHandler?()
                self.navigationController?.popToRootViewController(animated: true)
    }
    



}
    
    



