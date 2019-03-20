//
//  ViewController.swift
//  Todoey
//
//  Created by LiLong on 2019/3/20.
//  Copyright © 2019年 learnHard. All rights reserved.
//

import UIKit

class TodoListViewC: UITableViewController {
     
    let itemArray = ["Find Mike", "Buy Eggos", "Destory Demogorgon"]

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

}

