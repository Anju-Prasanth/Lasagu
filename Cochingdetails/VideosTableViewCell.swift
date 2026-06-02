//
//  VideosTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 24/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
import  SVGKit



protocol trendingvideotappeddelegtae{
    func trendingvideo(video:String)
}

class VideosTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var lbltrendingvideos: UILabel!
    @IBOutlet weak var collectionviewvideos: UICollectionView!
    var trendingvideos=TrendingvideosCollectionViewCell()
   
    var coachingmodel=Coachingviewmodel()
    var trending:[Trending_videos]?
    var smart:[Premium_category]?
    var videourl=String()
    var premiumurl=String()
    var trendingvideodelegate:trendingvideotappeddelegtae!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionviewvideos.dataSource=self
        collectionviewvideos.delegate=self
       
        self.collectionviewvideos.register(UINib(nibName: "TrendingvideosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TrendingvideosCollectionViewCell")
        
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
    return trending?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        trendingvideos = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingvideosCollectionViewCell",
                                                   for: indexPath) as! TrendingvideosCollectionViewCell
            trendingvideos.lblvideotitle.text=trending?[indexPath.row].psc_video_title
            let url = URL(string:trending?[indexPath.row].psc_vimeo_video_thumb ?? "")
            print("url",url)
                   trendingvideos.imageviewvideos.kf.indicatorType = .activity
                   trendingvideos.imageviewvideos.kf.setImage(with: url)
                   trendingvideos.imageviewvideos.contentMode = .scaleToFill
       
                  return trendingvideos
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width

        return CGSize(width: 300, height: CGFloat(190))

        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        trendingvideodelegate.trendingvideo(video: trending?[indexPath.row].psc_vimeo_video_url ?? "")
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionHeader {
//            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Sectionheadercoaching", for: indexPath) as! Sectionheadercoaching
//            if indexPath.section==0{
//                sectionHeader.lblheaderview.text="TRENDING VIDEOS"
//            }else{
//                 sectionHeader.lblheaderview.text="SMART STUDY"
//            }
//            
//            return sectionHeader
//        } else { //No footer in this case but can add option for that
//            return UICollectionReusableView()
//        }
//    }
    
    func coachingdata(data: Coachingdetails) {
        print("data",data)
        
        
        let status=data.status
        
        
        if status==true{
            trending=data.data?.trending_videos
            smart=data.data?.premium_category
            videourl=(data.data?.video_url)!
            premiumurl=(data.data?.premium_category_url)!
            print("trending",trending)
            DispatchQueue.main.async {
            
            self.collectionviewvideos.reloadData()
            }
        }else{
           
        }
    }
    
}
