//
//  IntroductoryvideoViewController.swift
//  Lasagu
//
//  Created by Anju s on 20/02/21.
//  Copyright © 2021 Arun Vijayan. All rights reserved.
//

import UIKit
import WebKit

class IntroductoryvideoViewController: UIViewController, WKUIDelegate {

    //@IBOutlet weak var webview: WKWebView!
   
    @IBOutlet weak var viewweb: UIView!
    var webview=WKWebView()
    var myurl=String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let mywkwebviewConfig = WKWebViewConfiguration()
        webview.uiDelegate=self
        mywkwebviewConfig.allowsInlineMediaPlayback = true
        webview = WKWebView(frame: self.viewweb.frame, configuration: mywkwebviewConfig)
        webview.frame.origin.y=250
        let my_url=URL(string:"https://www.youtube.com/watch?v="+myurl)!
      
       
        let youtubeRequest = URLRequest(url: my_url)
 
 
      
        webview.load(youtubeRequest)
//        guard let webView = webview else { return }
        self.view.addSubview(webview)
////
    }
    
    @available(iOS 13.0, *)
    @IBAction func btnskipaction(_ sender: Any) {
        
        let mainctgry = self.storyboard?.instantiateViewController (withIdentifier: "MaincategorynewViewController") as! MaincategorynewViewController
                         
                           
    self.navigationController?.pushViewController(mainctgry, animated: true)
        
    }
    
   
}
