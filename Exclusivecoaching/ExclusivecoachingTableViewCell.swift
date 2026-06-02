//
//  ExclusivecoachingTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 11/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

class ExclusivecoachingTableViewCell: UITableViewCell {
    
    
    var downloadVideo:(()->())?
    

    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var downloadingActivity: UIActivityIndicatorView!
    @IBOutlet weak var lblsubject: UILabel!
    @IBOutlet weak var lblpscvideodescrptn: UILabel!
    @IBOutlet weak var imagevideothumb: UIImageView!
     @IBOutlet weak var lblpscvideotitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        downloadButton.isSelected = false
        downloadingActivity.stopAnimating()
    }
   
    @IBAction func downloadButtonAction(_ sender: UIButton) {
        if !sender.isSelected{
        downloadVideo?()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(vid:WeekVideos,downloads:Dictionary<String, Any>){
        downloadButton.isSelected = false
        lblsubject.text=vid.video_subject
        lblpscvideotitle.text=vid.video_chapter
        lblpscvideodescrptn.text=vid.video_description
       // let url = URL(string:videothumburl+(vid.video_thumbnail ?? ""))
        imagevideothumb.kf.indicatorType = .activity
      //  imagevideothumb.kf.setImage(with: url)
        imagevideothumb.contentMode = .scaleAspectFit
        checkStatus(video: vid.video_id ?? "A", downloads: downloads)
    }

    func configure(vid:Coaching_video,downloads:Dictionary<String, Any>){
        downloadButton.isSelected = false
        lblsubject.isHidden=true
        lblpscvideotitle.text=vid.psc_video_title
        lblpscvideodescrptn.text=vid.psc_video_description
        let url = URL(string:vid.psc_vimeo_video_thumb ?? "")
        imagevideothumb.kf.indicatorType = .activity
        imagevideothumb.kf.setImage(with: url)
        imagevideothumb.contentMode = .scaleAspectFill
        checkStatus(video: vid.video_id ?? "A", downloads: downloads)
    }
    
    func checkStatus(video:String,downloads:Dictionary<String, Any>){
        for item   in downloads.keys{
            if let values = downloads[item] as? Dictionary<String, Any>,values["id"] as? String == video{
                let status = values["status"] as? Int
                
                if status == nil{
                    downloadButton.isSelected = false
                }else if status == 0{
                    downloadingActivity.startAnimating()
                }else if status == 1{
                    downloadButton.isSelected = true
                }
            }
        }
        
    }
}
