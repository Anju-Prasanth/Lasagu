//
//  SmartstudyTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 27/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
import SVGKit

protocol smartstudttappeddelegate{
    func smatstudydetails(paymentstatus:Bool,premiumid:String,usersubscrptnstatus:Bool,pscpremiumcatgryname:String)
}


class SmartstudyTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var lblsmartstudt: UILabel!
    @IBOutlet weak var collectionviewsmartstudy: UICollectionView!
    
    var delegatesmarttapped:smartstudttappeddelegate!
    var smartstudy=SmartstudyCollectionViewCell()
    var coachingmodel=Coachingviewmodel()

       var smart:[Premium_category]?
      
       var premiumurl=String()
    var usersubscriptionstatus=Bool()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionviewsmartstudy.delegate=self
        collectionviewsmartstudy.dataSource=self
        self.collectionviewsmartstudy.register(UINib(nibName: "SmartstudyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SmartstudyCollectionViewCell")
        
        coachingmodel.get_coaching_details{ (model) in
                                self.coachingdata(data:model)
                            }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
       return 1
       }
       
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return smart?.count ?? 0
    }
    
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   smartstudy = collectionView.dequeueReusableCell(withReuseIdentifier: "SmartstudyCollectionViewCell",for: indexPath) as! SmartstudyCollectionViewCell
                        smartstudy.lblpremiumctgryname.text=smart?[indexPath.row].psc_premium_category_name
            
            
                        let strURL = premiumurl+(smart?[indexPath.row].psc_premium_category_image ?? "")
            
                        let imageURL = URL(string: strURL)
            
                        let svgImage = SVGKImage(contentsOf: imageURL)
                        smartstudy.imageviewpremiumctgry.image=svgImage?.uiImage
          
                        return smartstudy
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {
          return CGSize(width: 120, height: CGFloat(170))
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if usersubscriptionstatus==false{
    delegatesmarttapped.smatstudydetails(paymentstatus: (smart?[indexPath.item].payment_status)!, premiumid: smart?[indexPath.item].psc_premium_category_id ?? "", usersubscrptnstatus: usersubscriptionstatus,pscpremiumcatgryname:smart?[indexPath.item].psc_premium_category_name ?? "")
        }else{
           delegatesmarttapped.smatstudydetails(paymentstatus: true, premiumid: smart?[indexPath.item].psc_premium_category_id ?? "", usersubscrptnstatus: usersubscriptionstatus,pscpremiumcatgryname:smart?[indexPath.item].psc_premium_category_name ?? "")
        }
//        if usersubscriptionstatus==true{
//
//        }else{
//            if smart?[indexPath.item].payment_status==true{
//
//            }else{
//
//                let cochingcategory = storyboard.instantiateViewController (withIdentifier: "CoachingcategoryViewController") as! CoachingcategoryViewController
//
//                       self.navigationController?.pushViewController(cochingcategory, animated: true)
//
//            }
//
//        }
//
    }
    
    func coachingdata(data: Coachingdetails) {
           print("data",data)
           
           
           let status=data.status
           
           
           if status==true{
               smart=data.data?.premium_category
               premiumurl=(data.data?.premium_category_url)!
            usersubscriptionstatus=(data.data?.user_subscription_status)!
               DispatchQueue.main.async {
               
               self.collectionviewsmartstudy.reloadData()
               }
           }else{
              
           }
       }

}
