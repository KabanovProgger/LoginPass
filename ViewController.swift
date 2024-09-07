//
//  ViewController.swift
//  LoginPass
//
//  Created by Owner on 6/24/24.
//

import UIKit
import AuthenticationServices
class ViewController: UIViewController, UITextFieldDelegate {
 

    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var loginField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var ageSwitch: UISwitch!
    
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var darkmodeSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
   
        if #available(iOS 13.0, *) {
            AppleSignIn.shared.addSignInButton(onView: self.view, frame: CGRect(x: 120, y: 700, width: 150, height: 50), completion: { appleUser, error in
                if error == nil {
                    if appleUser != nil {
                        print(appleUser?.identifier ?? "", appleUser?.fName ?? "")
                    }
                } else {
                    print("\(String(describing: error)) Please check your Apple ID in phone settings. You must be sign in to iCloud account and 2 factor authentication must be turned on.")
                }
                
            })
            
            
        } else {
            // Fallback on earlier versions
        }
        
        self.loginField.delegate = self
        self.passField.delegate = self
        // Do any additional setup after loading the view.
       
        //property of button
        self.signInButton.backgroundColor = UIColor.systemGray2
        self.signInButton.setTitle("Enter", for: .normal)
    
        self.loginField.placeholder = "Enter email"
        self.passField.placeholder = "Enter password"
        self.passField.isSecureTextEntry  = true
    
    
        
    }
    // hide  keyboard when click on screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
// button enter action pressed
    @IBAction func button1Pressed(_ sender: Any) {
        if self.passField.text?.count == 0 {
            self.alert(title: "Error", message: "Enter your credentials", style: .alert) // call func alert
        }
        if self.loginField.text?.count == 0 {
            self.alert(title: "Error", message: "Enter your credentials", style: .alert) // call func alert
        }
        
    }

    
// security show pass button
    @IBAction func showPassButton(_ sender: UIButton) {
        passField.isSecureTextEntry.toggle()
        if passField.isSecureTextEntry{
            if let image = UIImage(systemName: "eye.slash.fill"){
                sender.setImage(image, for: .normal)
            }
        }else{
            if let image = UIImage(systemName: "eye.fill"){
                sender.setImage(image, for: .normal)
            }
        }
    }
    
    @IBAction func enterToRegistrationViewController(_ sender: Any) {
        
    
        let registrationStoryboard = UIStoryboard(name: "Registration", bundle: nil)
        let registrationVC = registrationStoryboard.instantiateViewController(withIdentifier: "RegistrationVC") as! RegistrationVC
        self.navigationController?.pushViewController(registrationVC, animated: true)
        
        
        
    }
    // alert control for nil on log amd pass
    func alert(title: String, message: String, style: UIAlertController.Style){
              let alertController = UIAlertController(title: title, message: message, preferredStyle: style)  // create allertontroller on button
              let action = UIAlertAction(title: "Ok", style: .default)
              alertController.addAction(action)
              self.present(alertController, animated: true, completion: nil)
          
      }

// SWITCH action age
    @IBAction func switchAgeChange(_ sender: UISwitch) {
        if sender.isOn {
            
            self.signInButton.isEnabled = true
        } else {
           
            self.signInButton.isEnabled = false
        }
    
    }
    

  // Switch dark mode
    @IBAction func switchDarkOn(_ sender: UISwitch) {
        if sender.isOn {
            overrideUserInterfaceStyle = .light
           
        }else{
            overrideUserInterfaceStyle = .dark
        }
    
        
    }
    
}
    


