//
//  LoginViewController.swift
//  Reminder
//
//  Created by RAHUL GOEL on 06/01/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
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
        self.navigationController?.isNavigationBarHidden = true
        addTapGesture()
    }
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           email.becomeFirstResponder()
       }
  
    func loginCredentials(){
        CoreDataManager.shared.fetchLoginCredentials(email: email.text ?? "", password: password.text ?? "") {[weak self] (isCredentialsValid) in
            print("Valid \(isCredentialsValid)")
            if (isCredentialsValid == true ){
                Utility.setEmailInUserDefault(email : self?.email.text ?? "")
               let vc = ReminderViewController.newInstance()
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            else{
                self?.showAlert(message: "Please Enter valid email and password ", title: "Invalid")
            }
        }
    }
    
       func addTapGesture(){
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismiss))
           tapGesture.numberOfTapsRequired = 1
           self.view.addGestureRecognizer(tapGesture)
       }
       @objc func dismiss(recognizer: UITapGestureRecognizer){
           email.resignFirstResponder()
           password.resignFirstResponder()
       }
    
    func validateData()  {
        if(email.text?.isEmpty ?? true){
            showAlert(message: "please enter valid email" , title: "Required")
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
