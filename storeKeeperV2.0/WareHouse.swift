//
//  WareHouse.swift
//  storeKeeperV2.0
//
//  Created by Владислав Сизонов on 08.11.2020.
//

struct WareHouseItem {
var name: String
var quantity: Int
var description: String
var status: Bool
var type: String
}

 
extension WareHouseItem {
    
static func getWareHouseItem() -> [WareHouseItem] {
return [
    
    WareHouseItem(name: "Молоток",
                  quantity: 34,
                  description: "Ударный ручной инструмент, применяемый для забивания гвоздей",
                  status: true,
                  type: "Инструменты"),
    WareHouseItem(name: "Отвертка",
                  quantity: 5,
                  description: "Ручной слесарный инструмент, предназначенный для завинчивания и отвинчивания крепёжных изделий с резьбой",
                  status: true,
                  type: "Инструменты"),
    WareHouseItem(name: "Поршень",
                  quantity: 3,
                  description: "Поршень от двигателя BMW M8",
                  status: true,
                  type: "Комплектующие"),
    WareHouseItem(name: "Турбина",
                  quantity: 1,
                  description: "Турбина от двигателя BMW M8",
                  status: true,
                  type: "Комплектующие"),
    WareHouseItem(name: "Набор инструментов",
                  quantity: 2,
                  description: "Набор инструментов Dewalt",
                  status: true,
                  type: "Инструменты"),
    WareHouseItem(name: "Гаечный ключ",
                  quantity: 17,
                  description: "инструмент для соединения (рассоединения) резьбового соединения путём закручивания",
                  status: true,
                  type: "Инструменты"),
    WareHouseItem(name: "Болт М8х1,5",
                  quantity: 128,
                  description: "Болт В3М8х1,5,25-6gх50.58.С.019",
                  status: true,
                  type: "Комплектующие"),
    WareHouseItem(name: "Масло моторное",
                  quantity: 7,
                  description: "Масло моторное SAE 5W40",
                  status: true,
                  type: "Жидкости"),
    WareHouseItem(name: "Плоскогубцы",
                  quantity: 9,
                  description: "Плоскогубцы предназначены для фиксирования различного материала, извлечения скоб или гвоздей из древесины",
                  status: true,
                  type: "Инструменты"),
    WareHouseItem(name: "Тиски",
                  quantity: 1,
                  description: "Слесарный или столярный инструмент для фиксирования детали при различных видах обработки",
                  status: true,
                  type: "Инструменты"),
    
]
    
}
    
}
