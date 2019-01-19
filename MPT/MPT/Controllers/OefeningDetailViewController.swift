//
//  OefeningDetailViewController.swift
//  MPT
//
//  Created by Nick Aelbrecht on 19/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import UIKit

class OefeningDetailViewController: UIViewController {
    
    var oefening:Oefening?
    
    @IBOutlet weak var OefeningNaamLabel: UILabel!
    @IBOutlet weak var OefeningCategorieLabel: UILabel!
    @IBOutlet weak var OefeningMoeilijkheidLabel: UILabel!
    @IBOutlet weak var OefeningDetailsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OefeningNaamLabel.text = oefening?.naam
        OefeningDetailsLabel.text = oefening?.details
        OefeningCategorieLabel.text = oefening?.categorie
        OefeningMoeilijkheidLabel.text = String(oefening!.moeilijkheidsgraad)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelKnop(_ sender: Any) {
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
