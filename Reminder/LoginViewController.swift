//
//  LoginViewController.swift
//  Reminder
//
//  Created by RAHUL GOEL on 06/01/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func loginPressed(_ sender: Any) {
        validateData()
        
    }
    @IBAction func registerPressed(_ sender: Any) {
        let vc = RegisterViewController.newInstance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    func loginCredentials(){
        CoreDataManager.shared.fetchLoginCredentials(userName: username.text ?? "", password: password.text ?? "") {[weak self] (isCredentialsValid) in
            print("Valid \(isCredentialsValid)")
            if (isCredentialsValid == true ){
                Utility.setEmailInUserDefault(email : self?.username.text ?? "")
               let vc = ReminderViewController.newInstance()
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            else{
                self?.showAlert(message: "Please Enter valid username and password ", title: "Invalid")
            }
        }
    }
    
    func validateData()  {
        if(username.text?.isEmpty ?? true){
            showAlert(message: "please enter valid username" , title: "Required")
        }
        else if(password.text?.isEmpty ?? true){
            showAlert(message: "please enter valid password" , title: "Required")
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
}
