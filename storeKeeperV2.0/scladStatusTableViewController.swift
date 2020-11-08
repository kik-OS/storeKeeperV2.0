//
//  scladStatusTableViewController.swift
//  storeKeeperV2.0
//
//  Created by Никита Гвоздиков on 08.11.2020.
//

import UIKit

class ScladStatusTableViewController: UITableViewController {
   
    @IBOutlet var sortButtonOutlet: UIBarButtonItem!
    var listOfItems = WareHouseItem.getWareHouseItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfItems.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let scladManageVC = segue.destination as? ScladManageTableViewController else { return }
        scladManageVC.listOfItems = listOfItems
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellStatus", for: indexPath)

        let item = listOfItems[indexPath.row]
        cell.textLabel?.text = item.name
        
        if item.status {
            cell.detailTextLabel?.text = "Доступно"
            cell.detailTextLabel?.textColor = .systemGreen
        } else {
            cell.detailTextLabel?.text = "Недоступно"
            cell.detailTextLabel?.textColor = .systemRed
        }
        

        return cell
    }
    
    @IBAction func sortButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    
    //возврат измененного массива
    @IBAction func saveus (segue: UIStoryboardSegue) {
    let dataFromManagerVC = segue.source as! ScladManageTableViewController
    listOfItems = dataFromManagerVC.listOfItems
        tableView.reloadData()
}
    
    
    
    
}
