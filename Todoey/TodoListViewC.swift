//
//  ViewController.swift
//  Todoey
//
//  Created by LiLong on 2019/3/20.
//  Copyright © 2019年 learnHard. All rights reserved.
//

import UIKit

class TodoListViewC: UITableViewController {
     
    var itemArray = ["Find Mike", "Buy Eggos", "Destory Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK -Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell;
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        let currentCell = (tableView.cellForRow(at: indexPath))!;
        if currentCell.accessoryType == .checkmark {
            currentCell.accessoryType = .none;
        }else {
            currentCell.accessoryType = .checkmark;
            
        }
        
    }
    
    //MARK - Add New Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "填加代办事项", message: "", preferredStyle: UIAlertController.Style.alert)

        var textField = UITextField()
        let action = UIAlertAction(title: "填加项", style:.default) { (action) in
//            print("填加成功")
            
            if textField.text != "" {
                    self.itemArray.append(textField.text!)
            }
            self.tableView.reloadData();
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "填加新项"
            textField = alertTextField;
        }
        alert.addAction(action);
        
        present(alert, animated: true, completion: nil)
        
        
    }
}

