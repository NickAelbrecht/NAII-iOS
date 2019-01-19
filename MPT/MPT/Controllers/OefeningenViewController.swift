//
//  OefeningenViewController.swift
//  MPT
//
//  Created by Nick Aelbrecht on 04/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import UIKit

class OefeningenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var oefeningen = [Oefening]()
    var categorie:String = ""
    
    
    @IBOutlet weak var navigatieTitel: UINavigationItem!
    
    @IBOutlet weak var oefeningenCollectieView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = categorie
        
        if let opgeslagenOefeningen = Oefening.laadOefeningenVanDisk(){
            oefeningen = opgeslagenOefeningen
        }else{
            oefeningen = Oefening.laadStandaardOefeningen()
        }
        if(categorie != "Alle"){
            oefeningen = oefeningen.filter{$0.categorie == categorie}
        }
        
        oefeningenCollectieView.dataSource = self
        oefeningenCollectieView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.oefeningenCollectieView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return oefeningen.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "oefeningCell", for: indexPath) as! OefeningenCollectionViewCell
        cell.moeilijkheidsgraadLabel.text = String(oefeningen[indexPath.item].moeilijkheidsgraad)
        cell.oefeningNaamLabel.text = oefeningen[indexPath.item].naam
        
        //cell.deleteButton.addTarget(self, action: #selector(deleteOefening), for: UIControl.Event.touchUpInside)
        
        
        return cell
    }
    
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
        
        let container = try! Container()
        try! container.delete(self.oefeningen[sender.tag])
        self.oefeningen.remove(at: sender.tag)
        self.oefeningenCollectieView.reloadData()
    }
    
    /*  @objc func deleteOefening(sender:UIButton)  {
     let index:Int = sender.layer.value(forKey: "oefeningCell") as! Int
     oefeningen.remove(at: index)
     oefeningenCollectieView.reloadData()
     }*/
    
    
    
    
    @IBAction func terugKnop(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print("prepare functie")
        let nav = segue.destination as! UINavigationController
        let categorie = self.categorie
        if (segue.identifier == "VoegOefeningToe") {
            let oefeningToevoegenController = nav.viewControllers[0] as! OefeningToevoegenViewController            
            oefeningToevoegenController.categorie = categorie
        }
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
