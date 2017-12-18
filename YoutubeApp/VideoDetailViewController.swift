//
//  VideoDetailViewController.swift
//  YoutubeApp
//
//  Created by Abhishek Arya on 6/25/17.
//  Copyright © 2017 Abhishek Arya. All rights reserved.
//

import UIKit

class VideoDetailViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var webViewHeightConstraint: NSLayoutConstraint!
    
    var selectedVideo:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        webView.scrollView.contentInset = UIEdgeInsets.zero
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let vid = self.selectedVideo{
        
            self.titleLabel.text = vid.videoTitle
            self.descriptionLabel.text = vid.videoDescription
        
            let width = self.view.frame.size.width
            
            let height = width/854 * 480
            
            self.webViewHeightConstraint.constant = height
            
            let videoEmbedString = "<iframe width=" + String(describing: width) + "height=" + String(describing: height) + " src=https://www.youtube.com/embed/" + vid.videoId +  " frameborder=0 allowfullscreen></iframe>"
        
            self.webView.loadHTMLString(videoEmbedString, baseURL: nil)
        }
    }
//"<iframe width=400 height=200 src=https://www.youtube.com/embed/" + vid.videoId +  " frameborder=0 allowfullscreen></iframe>"
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
