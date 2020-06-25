//
//  SI_ViewController.swift
//  Travel-o_Aoteroa
//
//  Created by chirag patel on 23/04/20.
//  Copyright © 2020 chirag patel. All rights reserved.
//

import UIKit

class SI_ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let SI_titleArr = ["Dunedin","Queenstown"]
    let SI_descriptionArr = [
        "Dunedin is a suburb of Auckland, New Zealand. It is under the local governance of Auckland Council. According to the 2001 census, the population numbered 8934.The main road through the centre of Lynfield is The Avenue, with many roads branching off, including Halsey Drive, the suburb's longest street, which curves around a large portion of the inner suburb. The Lynfield Reserve is situated off the Avenue , it hosts a children's playground , and world renowned skateboard bowl .On the opposite side of the road is Oriana Reserve and Lynfield Tennis club and courts .The local primary school is Halsey Drive Primary School, which is situated opposite the Lynfield Reserve on Halsey Drive. The closest intermediate schools are Waikowhai Intermediate to the east and Blockhouse Bay Intermediate to the north. The local high school is Lynfield College",
    "Queenstown is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted."
    ]
    let SI_latitudeArr: [String] = ["-43.5321", "-45.0312"]
    
    let SI_longArr: [String] = ["172.6362", "168.6626"]
    
    @IBOutlet weak var SI_VC: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SI_titleArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let SI_cell = SI_VC?.dequeueReusableCell(withReuseIdentifier: "SI_cell", for: indexPath) as! SI_CollectionViewCell
        SI_cell.SI_lbl.text=SI_titleArr[indexPath.item]
        SI_cell.SI_img.image=UIImage(named:SI_titleArr[indexPath.item])
        SI_cell.SI_desc.text=SI_descriptionArr[indexPath.item]
        SI_cell.SI_latitude.text = SI_latitudeArr[indexPath.item]
        SI_cell.SI_long.text = SI_longArr[indexPath.item]
        SI_cell.isUserInteractionEnabled=true
        return SI_cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let SI_dvc=storyboard?.instantiateViewController(identifier: "SI_DViewController") as? SI_DViewController
        SI_dvc?.SI_title = SI_titleArr[indexPath.item]
        SI_dvc?.SI_description = SI_descriptionArr[indexPath.item]
        SI_dvc?.SI_latitude=SI_latitudeArr[indexPath.item]
        SI_dvc?.SI_long=SI_longArr[indexPath.item]
        
        self.navigationController?.pushViewController(SI_dvc!, animated: true)
    }
    
    override func viewDidLoad()
    {
        SI_VC.dataSource=self
        
        SI_VC.delegate = self
        super.viewDidLoad() 
    }
}
    
