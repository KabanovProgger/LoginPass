//
//  RegistrationVC.swift
//  LoginPass
//
//  Created by Owner on 7/15/24.
//

import UIKit

class RegistrationVC: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastnameTF: UITextField!
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var repPassTF: UITextField!
    @IBOutlet weak var birthPicker: UIDatePicker!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryPicker: UIPickerView!
    var countries: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        countryPicker.dataSource = self
        countryPicker.delegate = self
        
        countriesPicker()
        self.view.backgroundColor = UIColor.white
        
        
        
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
// country picker func
    func countriesPicker(){
       
        let countriesList = NSLocale.isoCountryCodes
        
        for countriesListItem in countriesList{
            let localeIdentifier = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue : countriesListItem])
            
            let locale = NSLocale(localeIdentifier: localeIdentifier)
            
            let countryName = locale.displayName(forKey: NSLocale.Key.identifier, value: localeIdentifier)!
            
            countries.append(countryName)
            
            
        }
        countryPicker.reloadAllComponents()
        
    }
}
    
    
    
    



extension RegistrationVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedValue = countries[row]
        countryLabel.text = "\(selectedValue)"
    }
}
