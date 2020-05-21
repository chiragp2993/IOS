//
//  SI_ViewController.swift
//  Travel-o_Aoteroa
//
//  Created by chirag patel on 23/04/20.
//  Copyright © 2020 chirag patel. All rights reserved.
//

import UIKit

class SI_ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let SI_titleArr = ["Ruapehu","Karekare"]
    @IBOutlet weak var SI_VC: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SI_titleArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let SI_cell = SI_VC?.dequeueReusableCell(withReuseIdentifier: "SI_cell", for: indexPath) as! SI_CollectionViewCell
        SI_cell.SI_lbl.text=SI_titleArr[indexPath.item]
        SI_cell.SI_img.image=UIImage(named:SI_titleArr[indexPath.item])
        SI_cell.isUserInteractionEnabled=true
        return SI_cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let SI_dvc=storyboard?.instantiateViewController(identifier: "SI_DViewController") as! SI_DViewController
        SI_dvc.SI_title=SI_titleArr[indexPath.item]
        SI_dvc.SI_description=SI_titleArr[indexPath.item]
        self.navigationController?.pushViewController(SI_dvc, animated: true)
    }
    
    override func viewDidLoad()
    {
        SI_VC.dataSource=self
        
        SI_VC.delegate = self
        super.viewDidLoad() 
    }
}
    
