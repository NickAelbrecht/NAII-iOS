//
//  RegistrerenViewController.swift
//  MPT
//
//  Created by Nick Aelbrecht on 20/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import UIKit
import FirebaseAuth


class RegistrerenViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var wachtwoordTextField: UITextField!
    @IBOutlet weak var wachtwoordBevestigenTextField: UITextField!
    @IBOutlet weak var registrerenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrerenButton.layer.cornerRadius = 4
        self.hideKeyboardWhenTappedAround()
        self.emailTextField.delegate = self
        self.wachtwoordTextField.delegate = self
        self.wachtwoordBevestigenTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelKnop(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Registreren(_ sender: Any) {
        if wachtwoordTextField.text != wachtwoordBevestigenTextField.text {
            let alertController = UIAlertController(title: "Foutief wachtwoord", message: "Voer wachtwoord opnieuw in", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: wachtwoordTextField.text!){ (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "naarHome", sender: self)
                }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
