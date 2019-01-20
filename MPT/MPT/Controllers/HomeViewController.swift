//
//  HomeViewController.swift
//  MPT
//
//  Created by Nick Aelbrecht on 03/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    @IBOutlet weak var fbImage: UIImageView!
    
    
    @IBOutlet weak var instaImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        /* let oef = Oefening(naam: "press", categorie: "Borst", details: "fcgvhbjnk,l;", moeilijkheidsgraad : 2)
         let container = try! Container()
         try! container.write{
         tranaction in tranaction.add(oef, update: true)
         }*/
        
        
        
        
    }
    
    
    @IBAction func instaButtonKlik(_ sender: Any) {
        //Link aanmaken naar instagramaccount
        let instagramHooks = "instagram://user?username=mpt_mergan_personal_training/"
        let instagramUrl = NSURL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
            UIApplication.shared.open(instagramUrl! as URL, options: [:], completionHandler: nil)
        } else {
            //browers (safari) gebruiken als instagram niet geinstalleerd is
            UIApplication.shared.open(NSURL(string: "http://instagram.com/mpt_mergan_personal_training/")! as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBAction func fbButtonKlik(_ sender: Any) {
        //Link aanmaken naar facebookpagina
        let facebookHooks = "facebook://user?screen_name=Mergan.Personal.Training/"
        let facebookUrl = NSURL(string: facebookHooks)
        if UIApplication.shared.canOpenURL(facebookUrl! as URL) {
            UIApplication.shared.open(facebookUrl! as URL, options: [:], completionHandler: nil)
        } else {
            //browser (safari) gebruiken als facebook niet geinstalleerd is
            UIApplication.shared.open(NSURL(string: "https://www.facebook.com/Mergan.Personal.Training/")! as URL, options: [:], completionHandler: nil)
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}



