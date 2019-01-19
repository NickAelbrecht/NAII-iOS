//
//  OefeningToevoegenViewController.swift
//  MPT
//
//  Created by Nick Aelbrecht on 14/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import Foundation
import UIKit

class OefeningToevoegenViewController: UIViewController {
    @IBOutlet weak var oefeningNaam: UITextField!
    @IBOutlet weak var oefeningDetails: UITextField!
    @IBOutlet weak var moeilijkheidsgraad: UITextField!
    
    var categorie:String = ""
    var naam:String = ""
    var details:String = ""
    var moeilijkheidsgraadCijfer:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelKnop(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveKnop(_ sender: Any) {
        validate()
    }
    
    func validate(){
        do {
            
            let naam = try self.oefeningNaam.validatedText(validationType: ValidatorType.naam)
            let details = try self.oefeningDetails.validatedText(validationType: ValidatorType.details)
            let moeilijkheidsgraad = try self.moeilijkheidsgraad.validatedText(validationType: ValidatorType.moeilijkheidsgraad)
            
            if(naam && details && moeilijkheidsgraad){
                voegOefeningToe()
            }else{
                showAlert(for: "Fouten in formulier, probeer opnieuw")
                self.oefeningNaam.text = ""
                self.oefeningDetails.text = ""
                self.moeilijkheidsgraad.text = ""
            }
            
            
        } catch(let error) {
            showAlert(for: (error as! ValidatieError).message)
        }
    }
    
    func showAlert(for alert: String) {
        let alertController = UIAlertController(title: nil, message: alert, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func voegOefeningToe() {
        let oef = Oefening(naam:oefeningNaam.text!, categorie:self.categorie, details:oefeningDetails.text!, moeilijkheidsgraad: Int(moeilijkheidsgraad.text!)!)
        let container = try! Container()
        print("Toegevoegde oefening: " ,oef)
        try! container.write{
            tranaction in tranaction.add(oef, update: true)
        }
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
        
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

extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> Bool {
        let validator = VaildatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}


