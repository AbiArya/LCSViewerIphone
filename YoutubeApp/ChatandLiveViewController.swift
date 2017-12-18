//
//  ChatandLiveViewController.swift
//  YoutubeApp
//
//  Created by Abhishek Arya on 7/10/17.
//  Copyright © 2017 Abhishek Arya. All rights reserved.
//

import UIKit
import Firebase
class ChatandLiveViewController: UIViewController {

    var senderDisplayName: String?
    
    @IBOutlet weak var layoutHeight: NSLayoutConstraint!
    
    @IBOutlet weak var LiveVideo: UIWebView!
    @IBAction func GoHome(_ sender: Any) {
        self.performSegue(withIdentifier: "BackHome", sender: nil)
    }
    
    var channelRef: DatabaseReference?
    var channel: Channel? {
        didSet {
            title = channel?.name
            // print(title)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "BackHome" {
            return
        }
            let chatVc = segue.destination as! ChatViewController
            
            chatVc.senderDisplayName = senderDisplayName
            chatVc.channel = channel
            chatVc.channelRef = channelRef?.child((channel?.id)!)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        let width = self.view.frame.size.width
        
          let height = width/854 * 480
        //self.layoutHeight.constant = height
        
        let videoEmbedString = "<iframe width=400 height=200 src=https://www.youtube.com/embed/live_stream?channel=UCMVhEr3rnPRDqAftmT5gq1A frameborder=0 allowfullscreen></iframe>"
        
        self.LiveVideo.loadHTMLString(videoEmbedString, baseURL: nil)
        
    }
    //"<iframe width=400 height=200 src=https://www.youtube.com/embed/live_stream?channel=UCMVhEr3rnPRDqAftmT5gq1A frameborder=0 allowfullscreen></iframe>"

    //"<iframe width=" + String(describing: width) + "height=" + String(describing: height) + " src=https://www.youtube.com/embed/live_stream?channel=UCMVhEr3rnPRDqAftmT5gq1A frameborder=0 allowfullscreen></iframe>"
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
