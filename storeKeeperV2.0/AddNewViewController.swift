//
//  AddNewViewController.swift
//  storeKeeperV2.0
//
//  Created by Никита Гвоздиков on 09.11.2020.
//

import UIKit

class AddNewViewController: UIViewController, UITextFieldDelegate {
    
    var typesOfequipment: [TypeOfItem]!
    var delegate: AddNewViewControllerDelegate!
    var currentType: TypeOfItem = .tools
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var countTextField: UITextField!
    @IBOutlet var typeSwitcher: UISegmentedControl!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var stepperOutlet: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleToSegmented()
        addDoneButton(to: countTextField)
        countTextField.delegate = self
        titleTextField.delegate = self
        descriptionTextField.delegate = self
    }
    
    @IBAction func countTextFieldAction(_ sender: UITextField) {
        stepperOutlet.value = Double(sender.text ?? "0") ?? 0.0
    }

    @IBAction func saveButtonPressed() {
        if titleTextField.text == nil ||
           countTextField.text == nil ||
            titleTextField.text == "" ||
            countTextField.text == "" ||
            Int(countTextField.text!)! < 1 {
            showAlert(title: "Ошибка", message: "Для добавления нового элемента заполните вcе обязательные поля")
        } else {
            delegate.addItem(item: WareHouseItem(name: titleTextField.text!, quantity: Int(countTextField.text! ) ?? 1 , description: descriptionTextField.text!, status: true, type: currentType))
            dismiss(animated: true)
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0: currentType = .tools
        case 1: currentType = .liquid
        case 2: currentType = .parts
        default: break;
        }
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        countTextField.text = String(Int(sender.value))
    }
}

extension AddNewViewController {
    func setTitleToSegmented() {
        for item in 0..<typesOfequipment.count {
            typeSwitcher.setTitle(typesOfequipment[item].rawValue, forSegmentAt: item)
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @objc private func didTapDone() {
        descriptionTextField.becomeFirstResponder()
    }
    
    private func addDoneButton(to textFields: UITextField...) {
        
        textFields.forEach { textField in
            let keyboardToolbar = UIToolbar()
            textField.inputAccessoryView = keyboardToolbar
            keyboardToolbar.sizeToFit()
            
            let doneButton = UIBarButtonItem(
                title:"Далее",
                style: .done,
                target: self,
                action: #selector(didTapDone)
            )
            
            let flexBarButton = UIBarButtonItem(
                barButtonSystemItem: .flexibleSpace,
                target: nil,
                action: nil
            )
            
            keyboardToolbar.items = [flexBarButton, doneButton]
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleTextField {
            countTextField.becomeFirstResponder()
        } else {
            saveButtonPressed()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}



