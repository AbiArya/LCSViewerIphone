//
//  LiveViewController.swift
//  YoutubeApp
//
//  Created by Abhishek Arya on 7/1/17.
//  Copyright © 2017 Abhishek Arya. All rights reserved.
//

import UIKit

class LiveViewController: UIViewController {

    @IBOutlet weak var LiveVideo: UIWebView!
    
    @IBOutlet weak var webViewHeightConstraint: NSLayoutConstraint!
    
    var selectedVideo:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        LiveVideo.scrollView.contentInset = UIEdgeInsets.zero
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
 
            
            //let width = self.view.frame.size.width
            
          //  let height = width/854 * 480
            
          //  self.webViewHeightConstraint.constant = height
            
            let videoEmbedString = "<iframe width=400 height=200 src=https://www.youtube.com/embed/live_stream?channel=UCRNg3d3yEN__0v2Ew7uTPo frameborder=0 allowfullscreen></iframe>"
            
            self.LiveVideo.loadHTMLString(videoEmbedString, baseURL: nil)
        
    }
//<iframe width="854" height="480" src="https://www.youtube.com/embed/Ib7hGvAHmJk" frameborder="0" allowfullscreen></iframe>
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
