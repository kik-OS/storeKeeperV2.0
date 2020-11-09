//
//  ScladManageTableViewController.swift
//  storeKeeperV2.0
//
//  Created by Никита Гвоздиков on 08.11.2020.
//

import UIKit

protocol AddNewViewControllerDelegate {
    func addItem(item: WareHouseItem)
}

class ScladManageTableViewController: UITableViewController {
    
    var listOfItems: [WareHouseItem]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 160
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.title = "Изменить"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addNewVC = segue.destination as? AddNewViewController
        var typesOfEquipment: [TypeOfItem] = []
        for items in listOfItems {
            typesOfEquipment.append(items.type)
        }
        let uniqueTypes = Array(Set(typesOfEquipment))
        addNewVC?.typesOfequipment = uniqueTypes
        addNewVC?.delegate = self
    }
    
    // количество ячеек
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfItems.count
    }
    
    // удалениe элемента из таблицы
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        listOfItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    // настройка ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellManage", for: indexPath) as! ManageTableViewCell
        let equipment = listOfItems[indexPath.row]
        
        cell.titleLabel.text = equipment.name
        cell.typeLabel.text = equipment.type.rawValue
        cell.countLaabel.text = "Доступно: \(String(equipment.quantity))"
        cell.descriptionLabel.text = equipment.description
        return cell
    }
    
    //перемещение элемента
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveEquipment = listOfItems.remove(at: sourceIndexPath.row)
        listOfItems.insert(moveEquipment, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func setEditing (_ editing:Bool, animated:Bool) {
        super.setEditing(editing, animated: animated)
        if(isEditing) {
            editButtonItem.title = "Отменить"
        } else {
            editButtonItem.title = "Изменить"
        }
    }
}

extension ScladManageTableViewController: AddNewViewControllerDelegate {
    func addItem(item: WareHouseItem) {
        listOfItems.insert(item, at: 0)    
        tableView.reloadData()
    }
}
