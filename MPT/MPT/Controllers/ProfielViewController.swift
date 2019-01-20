//
//  ProfielViewController.swift
//  MPT
//
//  Created by Nick Aelbrecht on 20/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import UIKit

class ProfielViewController: UIViewController {
    @IBOutlet weak var registrerenButton: UIButton!
    @IBOutlet weak var inloggenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
        
        registrerenButton.layer.cornerRadius = 4
        inloggenButton.layer.cornerRadius = 4
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
