//
//  NI_ViewController.swift
//  Travel-o_Aoteroa
//
//  Created by chirag patel on 23/04/20.
//  Copyright © 2020 chirag patel. All rights reserved.
//

import UIKit
//import FaveButton




class NI_ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    @IBOutlet weak var NI_VC: UICollectionView!
    
    let NI_titleArr =
    [
    "Lynfield",
    "Piha",
    "Karekare",
    "Ruapehu",
    "Waitakere Ranges",
    "Karangahake Gorge",
    "Waipu Caves",
    "Tiritiri Matangi Island",
    "Te Urewera",
    "Rere Falls & Rere Rockslide",
    "Poroa lake",
    "Cape Kidnappers",
    "Mt Hikurangi",
    "Aorangi Forest",
    "Paihia’s Mangrove Forest",
    "Coromandel Tours",
    "Bay of Plenty",
    "Rotorua",
    "Wellington",
    "Far North & Ninety Mile Beach",
    "Waitomo",
    "Goat Island",
    "Muriwai",
    "Hunua",
    "Auckland Museum",
    "Cornwall Park",
    "City Centre",
    "Auckland Zoo",
    "SEA LIFE Kelly Tarlton's Aquarium",
    ]
    let NI_descriptionArr =
        [
            "Lynfield is a suburb of Auckland, New Zealand. It is under the local governance of Auckland Council. According to the 2001 census, the population numbered 8934.The main road through the centre of Lynfield is The Avenue, with many roads branching off, including Halsey Drive, the suburb's longest street, which curves around a large portion of the inner suburb. The Lynfield Reserve is situated off the Avenue , it hosts a children's playground , and world renowned skateboard bowl .On the opposite side of the road is Oriana Reserve and Lynfield Tennis club and courts .The local primary school is Halsey Drive Primary School, which is situated opposite the Lynfield Reserve on Halsey Drive. The closest intermediate schools are Waikowhai Intermediate to the east and Blockhouse Bay Intermediate to the north. The local high school is Lynfield College",
            "Piha is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Karekare is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.","Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted.",
            "Ruapehu is New Zealandâ€™s most famous surf beach. Situated on the west coast of the North Island, 40 kms from the city of Auckland, this black iron-sand beach has a reputation for awesome surf which rolls in over the Tasman Sea. When Uncle Tobyâ€™s Iron Man contest was held at Piha in 1997, canoes were snapped in two and theyâ€™ve never come back. It can be moody, misty and mysterious, wild, wet and wind-swept. The power goes off, the phone lines come down, sometimes the road in (and out) gets blocked. Living here is not for the faint-hearted."
        ]
    let NI_latitudeArr: [String] =
        [
            "-36.9286",
            "-36.953",
            "-36.9866",
            "-39.2817",
            "-36.9667",
            "-37.4225",
            "-35.9347",
            "-36.6012",
            "-38.7547",
            "-38.5375",
            "-39.7514",
            "-39.6656",
            "-37.9167",
            "-41.4565",
            "-35.2833",
            "-36.7613",
            "-38.1027",
            "-38.1368",
            "-41.2865",
            "-34.7167",
            "-38.2615",
            "-36.2647",
            "-36.8362",
            "-37.0783",
            "-36.8604",
            "-36.8978",
            "-36.8485",
            "-36.8641",
            "-36.847"
        ]
    
    let NI_longArr: [String] =
        [
            "174.7203",
            "174.4688",
            "174.4797",
            "175.5685",
            "174.5167",
            "175.7209",
            "174.3481",
            "174.8894",
            "177.1593",
            "177.6096",
            "175.8675",
            "177.0324",
            "178.06",
            "175.324",
            "174.0833",
            "175.4981",
            "176.7416",
            "176.2497",
            "174.7762",
            "172.9333",
            "175.1145",
            "174.7975",
            "174.4341",
            "175.0706",
            "174.7778",
            "174.7877",
            "174.7633",
            "174.7197",
            "174.8174",
            
        ]
    
    
    
    //let doublestr = Double(self.NI_longArr)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NI_titleArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let NI_cell=NI_VC?.dequeueReusableCell(withReuseIdentifier: "NI_cell", for: indexPath) as! CollectionViewCell
        
        NI_cell.NI_lbl.text=NI_titleArr[indexPath.item]
        NI_cell.NI_img.image=UIImage(named:NI_titleArr[indexPath.item])
        NI_cell.NI_desc.text=NI_descriptionArr[indexPath.item]
        NI_cell.NI_latitude.text = NI_latitudeArr[indexPath.item]
        NI_cell.NI_long.text = NI_longArr[indexPath.item]
        
        return NI_cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let NI_dvc=storyboard?.instantiateViewController(identifier: "NI_DViewController") as? NI_DViewController
        NI_dvc?.NI_title=NI_titleArr[indexPath.item]
        NI_dvc?.NI_description=NI_descriptionArr[indexPath.item]
        NI_dvc?.NI_latitude=NI_latitudeArr[indexPath.item]
        NI_dvc?.NI_long=NI_longArr[indexPath.item]
        
        self.navigationController?.pushViewController(NI_dvc!, animated: true)
    }
    override func viewDidLoad()
        
    {
        super.viewDidLoad()
        NI_VC.dataSource=self
        
        NI_VC.delegate = self
        self.view.addSubview(NI_VC)
        
        
        
    }
    
    
    
    
    }
    
    















