//
//  InloggenViewController.swift
//  MPT
//
//  Created by Nick Aelbrecht on 20/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import UIKit
import FirebaseAuth

class InloggenViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var wachtwoordTextField: UITextField!
    @IBOutlet weak var inloggenKnop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inloggenKnop.layer.cornerRadius = 4
        self.hideKeyboardWhenTappedAround()
        self.emailTextField.delegate = self
        self.wachtwoordTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelKnop(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func LogIn(_ sender: Any) {
        do{
            let email = try self.emailTextField.validatedText(validationType: ValidatorType.email)
            let wachtwoord = try self.wachtwoordTextField.validatedText(validationType: ValidatorType.wachtwoord)
            
            if(email && wachtwoord){
                Auth.auth().signIn(withEmail: emailTextField.text!, password: wachtwoordTextField.text!) { (user, error) in
                    if error == nil{
                        self.performSegue(withIdentifier: "naarHome", sender: self)
                    }
                    else{
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                        self.wachtwoordTextField.text = ""
                    }
                }
            }else{
                showAlert(for: "Fout in form, probeer opnieuw")
                self.wachtwoordTextField.text = ""
                self.emailTextField.text = ""
            }
        }catch(let error) {
            showAlert(for: (error as! ValidatieError).message)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    func showAlert(for alert: String) {
        let alertController = UIAlertController(title: "Fout in form", message: alert, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
