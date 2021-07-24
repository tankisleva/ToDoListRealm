//
//  ToDoRealmController.swift
//  HW14
//
//  Created by Олег Малышев on 11.07.2021.
//

import UIKit
import RealmSwift


class ToDoListTask: Object {
    @objc dynamic var task: String = ""
}

class ToDoRealmController: UIViewController {
    
   
    
    @IBOutlet weak var tableView: UITableView!
    private let realm = try! Realm()
    private var tasks = [ToDoListTask]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tasks = realm.objects(ToDoListTask.self).map({ $0 })
        self.title = "Tasks"
        tableView.delegate = self
        tableView.dataSource = self
        


        // Do any additional setup after loading the view.
    }
    
    

    
    
    @IBAction func didTapAdd(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "entry") as? EntryViewController else {
            return
        }
        vc.title = "New Task"
        vc.completionHandler = { [weak self] in
            self?.refresh()
        }
     
//        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func refresh() {
        tasks = realm.objects(ToDoListTask.self).map({ $0 })
        tableView.reloadData()
    }
    
    

}




extension ToDoRealmController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].task
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let task = tasks[indexPath.row]

        guard let vc = storyboard?.instantiateViewController(identifier: "task") as? TaskViewController else {
            return
        }

        vc.task = task
        vc.title = "del Task"
        vc.deletionHandler = { [weak self] in
            self?.refresh()
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
