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
        
        // scrollView frame data (such as the Scroll View width) is not available
        // here so we move it to viewDidAppear. Some info on UI objects does not
        // get loaded when the viewDidLoad function runs
        
    }

    // Move code in this block because the UIScrollView is guaranteed to have
    // loaded in the following block
    override func viewDidAppear(_ animated: Bool) {
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
            
//            newX = view.frame.midX + view.frame.size.width * CGFloat(x)
            
            let scrollWidth = scrollView.frame.size.width
            
            newX = scrollWidth/2 + scrollWidth * CGFloat(x)
            
            contentWidth += newX
            
            // Show the current imageView in the scroll view
            scrollView.addSubview (imageView)
            
            // Now we can set the position of the image inside the
            //Scroll view
//            imageView.frame = CGRect (x: newX - 75, y: (view.frame.size.height/2) - 75, width: 150, height: 150)
            imageView.frame = CGRect (x: newX - 75, y: (scrollView.frame.size.height/2) - 75, width: 150, height: 150)
            
//            scrollView.backgroundColor = UIColor.purple
            // Don't hide the images behind the scroll view:
            scrollView.clipsToBounds = false
            
            // We need to set the content size within the scroll view
            // so that the scroll view knows how far to scroll
            scrollView.contentSize = CGSize (width: contentWidth, height: view.frame.size.height)
        }
    }
}

