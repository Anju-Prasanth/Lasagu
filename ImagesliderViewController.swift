//
//  ImagesliderViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 30/06/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

class ImagesliderViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var scrollview: UIScrollView!
    var imagedata=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollview.delegate=self
        self.imagedata=["slide1","slide2","slide3"]
        
        
        
        for i in 0...imagedata.count-1{
            imageview.image=UIImage(named:imagedata[i] as! String)
            scrollview.addSubview(imageview)
        }
        scrollview.contentSize=CGSize(width: self.scrollview.frame.size.width+CGFloat(self.imagedata.count), height: self.scrollview.frame.size.height)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView){
    let contentWidth = self.scrollview.contentSize.width
    let x = self.scrollview.contentOffset.x + self.scrollview.frame.size.width
    if x < contentWidth{
        self.scrollview.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }else{
        self.scrollview.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }

    }

}
