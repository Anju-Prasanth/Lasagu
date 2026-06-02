//
//  VideoandimageViewController.swift
//  
//
//  Created by Arun Vijayan on 10/08/20.
//

import UIKit
import WebKit

class VideoandimageViewController: UIViewController,WKUIDelegate{
 var myurl:URL!
var homeflag=Int()
var type=String()
var trendingvideoflag=Int()
    
    @IBOutlet weak var mywkwebview: WKWebView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

       
               let mywkwebviewConfig = WKWebViewConfiguration()
        mywkwebview.uiDelegate=self
               mywkwebviewConfig.allowsInlineMediaPlayback = true
               mywkwebview = WKWebView(frame: self.view.frame, configuration: mywkwebviewConfig)
             
              
                   let youtubeRequest = URLRequest(url: myurl!)
        if homeflag==1{
            if type=="image"{
            mywkwebview?.frame.origin.y = 150
            }else{
              mywkwebview?.frame.origin.y = 50
            }
        }else if trendingvideoflag==1{
               mywkwebview?.frame.origin.y = 100
        }else{
             mywkwebview?.frame.origin.y = 0
        }
        
             
               mywkwebview?.load(youtubeRequest)
               guard let webView = mywkwebview else { return }
               self.view.addSubview(webView)
//
    }
    
    @IBAction func btndismissaction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
     
    
}
