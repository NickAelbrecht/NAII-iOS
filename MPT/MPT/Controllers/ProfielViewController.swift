//
//  ProfielViewController.swift
//  MPT
//
//  Created by Nick Aelbrecht on 20/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfielViewController: UIViewController {
    @IBOutlet weak var registrerenButton: UIButton!
    @IBOutlet weak var inloggenButton: UIButton!
    @IBOutlet weak var uitloggenButton: UIButton!
    @IBOutlet weak var userEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        /* registrerenButton.setTitleColor(UIColor.black, for: .disabled)
         registrerenButton.bac
         inloggenButton.setTitleColor(UIColor.black, for: .disabled)*/
        
        // Do any additional setup after loading the view.
        
        registrerenButton.layer.cornerRadius = 4
        inloggenButton.layer.cornerRadius = 4
        if self.controleerUserIngelogd(){
            registrerenButton.isEnabled = false
            registrerenButton.backgroundColor = UIColor.black
            registrerenButton.setTitleColor(UIColor.gray, for: UIControl.State.disabled)
            inloggenButton.isEnabled = false
            inloggenButton.backgroundColor = UIColor.black
            inloggenButton.setTitleColor(UIColor.gray, for: UIControl.State.disabled)
            uitloggenButton.isEnabled = true
            uitloggenButton.backgroundColor = #colorLiteral(red: 0.1137, green: 0.4392, blue: 0.9843, alpha: 1)
            userEmail.text = Auth.auth().currentUser?.email
            
        }else{
            registrerenButton.isEnabled = true
            registrerenButton.backgroundColor = #colorLiteral(red: 0.1137, green: 0.4392, blue: 0.9843, alpha: 1)
            inloggenButton.isEnabled = true
            inloggenButton.backgroundColor = #colorLiteral(red: 0.1137, green: 0.4392, blue: 0.9843, alpha: 1)
            uitloggenButton.isEnabled = false
            uitloggenButton.backgroundColor = UIColor.black
            uitloggenButton.setTitleColor(UIColor.gray, for: UIControl.State.disabled)
            userEmail.text = "Niet ingelogd"
        }
    }
    
    @IBAction func LogUit(_ sender: Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func wachtwoordVergetenKnop(_ sender: Any) {
        var email:String?
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Wachtwoord vergeten", message: "Voer je email in", preferredStyle: .alert)
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = "xxx@xxx.com"
        }
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Verstuur", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            email = textField.text!
            do{
                let emailBool = try textField.validatedText(validationType: ValidatorType.email)
                if(emailBool){
                    
                    Auth.auth().sendPasswordReset(withEmail: email!, completion: { (error) in
                        var title = ""
                        var message = ""
                        if error != nil {
                            title = "Error!"
                            message = (error?.localizedDescription)!
                        } else {
                            title = "Success!"
                            message = "Password reset email sent."
                        }
                        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                    })
                }
            }catch(let error){
                self.showAlert(for: (error as! ValidatieError).message)
            }
        }))
        //         print("email 1:", email)
        self.present(alert, animated: true, completion: nil)
        //        print("email 2:", email)
        
    }
    
    func showAlert(for alert: String) {
        let alertController = UIAlertController(title: nil, message: alert, preferredStyle: UIAlertController.Style.alert)
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
