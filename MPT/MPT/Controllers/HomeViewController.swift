//
//  HomeViewController.swift
//  MPT
//
//  Created by Nick Aelbrecht on 03/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var fbImage: UIImageView!
    
    
    @IBOutlet weak var instaImage: UIImageView!
    
    
    @IBAction func instaButtonKlik(_ sender: Any) {
        let instagramHooks = "instagram://user?username=mpt_mergan_personal_training/"
        let instagramUrl = NSURL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
            UIApplication.shared.open(instagramUrl! as URL, options: [:], completionHandler: nil)
        } else {
            //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.open(NSURL(string: "http://instagram.com/mpt_mergan_personal_training/")! as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBAction func fbButtonKlik(_ sender: Any) {
        let facebookHooks = "facebook://user?screen_name=Mergan.Personal.Training/"
        let facebookUrl = NSURL(string: facebookHooks)
        if UIApplication.shared.canOpenURL(facebookUrl! as URL) {
            UIApplication.shared.open(facebookUrl! as URL, options: [:], completionHandler: nil)
        } else {
            //redirect to safari because the user doesn't have Facebook
            UIApplication.shared.open(NSURL(string: "https://www.facebook.com/Mergan.Personal.Training/")! as URL, options: [:], completionHandler: nil)
        }
    }
    
}
