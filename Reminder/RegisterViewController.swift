//
//  RegisterViewController.swift
//  Reminder
//
//  Created by RAHUL GOEL on 06/01/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var mobile: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var address: UITextField!
    
    @IBAction func registerPressed(_ sender: Any) {
        validateData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func loginCredentials(){
        let obj = RegisterationInfo(firstname: firstname.text ?? "", lastname: lastname.text ?? "", email: email.text ?? "", password: password.text ?? "", mobile: mobile.text ?? "", city: city.text ?? "", address: address.text ?? "")
        let register = CoreDataManager.shared.saveUser(info: obj)
        if (register == true){
            showAlertForSuccessfulRegistration(message: "Register Sussesful", title: "Done")
        }
        
    }
    class func newInstance()->RegisterViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "RegisterViewController") as! RegisterViewController
    }
    func validateData()  {
        //
        if(firstname.text?.isEmpty ?? true){
            showAlert(message: "please enter valid firstname" , title: "Required")
        }
        else if(lastname.text?.isEmpty ?? true){
            showAlert(message: "please enter valid lastname" , title: "Required")
        }
        else if(email.text?.isEmpty ?? true){
            showAlert(message: "please enter valid email" , title: "Required")
        }
        else if(password.text?.isEmpty ?? true){
            showAlert(message: "please enter valid password" , title: "Required")
        }
        else if(mobile.text?.isEmpty ?? true){
            showAlert(message: "please enter valid mobile" , title: "Required")
        }
        else if(city.text?.isEmpty ?? true){
            showAlert(message: "please enter valid city" , title: "Required")
        }
        else if(address.text?.isEmpty ?? true){
            showAlert(message: "please enter valid address" , title: "Required")
        }
        else{
            
            loginCredentials()
        }
    }
    func showAlert(message:String, title:String){
        let  alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlertForSuccessfulRegistration(message:String, title:String){
        let  alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] action in
            self?.navigationController?.popViewController(animated: true)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
