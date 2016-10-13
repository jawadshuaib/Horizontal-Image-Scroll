//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Jawad Shuaib on 2016-10-13.
//  Copyright © 2016 Jawad Shuaib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    // Referring to the UIImage
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // We will need to set the content size window inside the scroll view
        var contentWidth: CGFloat = 0.0
        
        for x in 0...2 {
            // Load images from assets into image object
            let image = UIImage(named: "icon\(x).png")
            // Place the image into the view
            let imageView = UIImageView (image: image)
            // Append the image to the UIImageView array
            images.append (imageView)
            
            // CGFloat is a spcialized form for Float
            // used for Core Graphics
            var newX: CGFloat = 0.0
            
            // midX is the value of x in the middle of the screen
            // frame.size.width is the width of the entire screen
            
            newX = view.frame.midX + view.frame.size.width * CGFloat(x)
            
            contentWidth += newX
            
            // Show the current imageView in the scroll view
            scrollView.addSubview (imageView)
            
            // Now we can set the position of the image inside the
            //Scroll view
            imageView.frame = CGRect (x: newX - 75, y: (view.frame.size.height/2) - 75, width: 150, height: 150)
        
            // We need to set the content size within the scroll view
            // so that the scroll view knows how far to scroll
            scrollView.contentSize = CGSize (width: contentWidth, height: view.frame.size.height)
        }
        
        
        print ("Count: \(images.count)")
        
    }

}

