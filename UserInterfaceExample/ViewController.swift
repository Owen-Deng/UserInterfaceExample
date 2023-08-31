//
//  ViewController.swift
//  UserInterfaceExample
//
//  Created by Owen on 8/29/23.f
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{

    lazy var imageModel:ImageModel = {return ImageModel.sharedInstance()}()
    lazy private var imageView: UIImageView? = {
        return UIImageView.init(image: self.imageModel.getImageWithName(displayImageName))
    }()
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var displayImageName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        if let size = self.imageView?.image?.size{
            self.scrollView.addSubview(self.imageView!)
            self.scrollView.contentSize = size
            self.scrollView.minimumZoomScale = 0.1
            self.scrollView.delegate = self
        }
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }


}

