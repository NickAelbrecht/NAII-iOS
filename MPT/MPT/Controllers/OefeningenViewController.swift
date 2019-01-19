//
//  OefeningenViewController.swift
//  MPT
//
//  Created by Nick Aelbrecht on 04/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import UIKit

class OefeningenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, MyCellDelegate {
    
    
    
    
    
    var oefeningen = [Oefening]()
    var categorie:String = ""
    var oef:Oefening?
    
    
    
    @IBOutlet weak var navigatieTitel: UINavigationItem!
    
    @IBOutlet weak var oefeningenCollectieView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = categorie
        
        if let opgeslagenOefeningen = Oefening.laadOefeningenVanDisk(){
            oefeningen = opgeslagenOefeningen
            //               print("Oefeningen van disk zogezegd", oefeningen)
        }else{
            oefeningen = Oefening.laadStandaardOefeningen()
            //            print("Oefeningen lokaal?", oefeningen)
        }
        if(categorie != "Alle"){
            oefeningen = oefeningen.filter{$0.categorie == categorie}
        }
        
        oefeningenCollectieView.dataSource = self
        oefeningenCollectieView.delegate = self
        oefeningenCollectieView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        oefeningenCollectieView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return oefeningen.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "oefeningCell", for: indexPath) as! OefeningenCollectionViewCell
        cell.moeilijkheidsgraadLabel.text = String(oefeningen[indexPath.item].moeilijkheidsgraad)
        //        print(cell.oefeningNaamButton.title(for: .normal) as Any)
        let naam = oefeningen[indexPath.item].naam
        //        print("naam?:" , naam)
        cell.oefeningNaamButton.setTitle(naam, for: .normal)
        cell.delegate = self
        //        print("Indexpath: " , indexPath.item, "oefeningen indexpath: " , oefeningen[indexPath.item])
        return cell
    }
    
    /* @IBAction func deleteButtonClicked(_ sender: UIButton) {
     print("index path verwijderde" , indexPathVar!.item)
     print("Verwijderde oefening: " , oefeningen[indexPathVar!.item])
     let oef = oefeningen[indexPathVar!.item]
     let container = try! Container()
     try! container.delete(oef: oef)
     oefeningen.remove(at: indexPathVar!.item)
     oefeningenCollectieView.reloadData()
     }*/
    func btnCloseTapped(cell: OefeningenCollectionViewCell) {
        let indexPath = self.oefeningenCollectieView.indexPath(for: cell)
        print(indexPath!.item)
        //        print("Verwijderde oefening: " , oefeningen[indexPath!.item])
        let oef = oefeningen[indexPath!.item]
        let container = try! Container()
        try! container.delete(oef: oef)
        oefeningen.remove(at: indexPath!.item)
        oefeningenCollectieView.reloadData()
    }
    
    @IBAction func terugKnop(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func btnOefeningNaam(cell: OefeningenCollectionViewCell) {
        let indexPath = self.oefeningenCollectieView.indexPath(for: cell)
        self.oef = oefeningen[(indexPath?.item)!]
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print("prepare functie")
        let nav = segue.destination as! UINavigationController
        let categorie = self.categorie
//        print("Viewcontrollers", nav.viewControllers[0] as! OefeningDetailViewController)
        
        
        if (segue.identifier == "VoegOefeningToe") {
            let oefeningToevoegenController = nav.viewControllers[0] as! OefeningToevoegenViewController            
            oefeningToevoegenController.categorie = categorie
        }else
            if (segue.identifier == "OefeningDetail") {
                let detailOefeningViewController = nav.viewControllers[0] as! OefeningDetailViewController
                detailOefeningViewController.oefening = oef
                
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
