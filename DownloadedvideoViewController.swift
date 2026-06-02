//
//  DownloadedvideoViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 03/09/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
import CoreData
@available(iOS 13.0, *)
class DownloadedvideoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var tableviewdownloadedvideo: UITableView!
    var videodownloaded:[Downloadedvideo]=[]
    var cell=DownloadedvideoTableViewCell()
    var theme=Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchdata()
        
    }
    override func viewWillAppear(_ animated: Bool){
    super.viewWillAppear(animated)
   
            
                    if let mode=UserDefaults.standard.value(forKey: "mode"){
                        theme=UserDefaults.standard.value(forKey: "mode") as! Int
                        
                    }
                    
                    if theme==0{
                        overrideUserInterfaceStyle = .light
                        
                        
                    }else{
                    overrideUserInterfaceStyle = .dark
                    
                    
                    }
                    
                
            }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videodownloaded.count ?? 0
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = (tableView.dequeueReusableCell(withIdentifier: "DownloadedvideoTableViewCell", for: indexPath) as? DownloadedvideoTableViewCell)!
        let tag=indexPath.row+1
        cell.numberdownloaded.text="downloaded -"+"\(tag)"+" successfully"
        cell.btnopenvideo.tag=indexPath.row
        cell.btnopenvideo.addTarget(self, action: #selector(btnopenvideo(sender:)), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoimage = self.storyboard?.instantiateViewController (withIdentifier: "VideoandimageViewController") as! VideoandimageViewController
        let  myURL = URL(string:videodownloaded[indexPath.row].videodownloaded ?? "")
        videoimage.myurl=myURL
        videoimage.homeflag=1
        videoimage.type="video"
        self.navigationController?.pushViewController(videoimage, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
        
    }
    
    @objc func btnopenvideo(sender:UIButton){
        
        let videoimage = self.storyboard?.instantiateViewController (withIdentifier: "VideoandimageViewController") as! VideoandimageViewController
        let  myURL = URL(string:videodownloaded[sender.tag].videodownloaded ?? "")
        videoimage.myurl=myURL
        videoimage.homeflag=1
        videoimage.type="video"
        self.navigationController?.pushViewController(videoimage, animated: true)
        
    }
    
    @available(iOS 13.0, *)
    func fetchdata(){
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Downloadedvideo")
        
        
        do {
            videodownloaded = try managedContext.fetch(fetchRequest) as! [Downloadedvideo]
            print("videodownloaded",videodownloaded)
            tableviewdownloadedvideo.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    
}
