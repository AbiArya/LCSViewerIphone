/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import Firebase

class LoginViewController: UIViewController {
  
  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var bottomLayoutGuideConstraint: NSLayoutConstraint!
    private lazy var channelRef: DatabaseReference = Database.database().reference().child("channels")

    var channel = Channel(id: "-KobxfRcBNDRytnNEiB9", name: "LiveChat")

    
  // MARK: View Lifecycle
  
    @IBAction func GoHome(_ sender: Any) {
        self.performSegue(withIdentifier: "BackHome", sender: nil)
    }
    @IBOutlet weak var LiveVideo: UIWebView!
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    nameField.becomeFirstResponder()

  }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
         guard segue.identifier == "LoginToChat" else {return}
    //    let navVc = segue.destination as! UINavigationController // 1
    //    let channelVc = navVc.viewControllers.first as! ChannelListViewController // 2
        
    //    channelVc.senderDisplayName = nameField?.text // 3
        
            let chatVc = segue.destination as! ChatandLiveViewController
        
            chatVc.senderDisplayName = nameField?.text
            chatVc.channel = channel
            chatVc.channelRef = channelRef.child(channel.id)
        
    }
  
   

    
    
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
  }
  
  @IBAction func loginDidTouch(_ sender: AnyObject) {
    if nameField?.text != "" { // 1
        Auth.auth().signInAnonymously(completion: { (user, error) in // 2
            if let err = error { // 3
                print(err.localizedDescription)
                return
            }

            self.performSegue(withIdentifier: "LoginToChat", sender: nil) // 4
        })
    }
  }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        //let width = self.view.frame.size.width
        
        //  let height = width/854 * 480
        
        //  self.webViewHeightConstraint.constant = height
        
        let videoEmbedString = "<iframe width=400 height=200 src=https://www.youtube.com/embed/live_stream?channel=UCRNg3d3yEN__0v2Ew7uTPo frameborder=0 allowfullscreen></iframe>"
        
        self.LiveVideo.loadHTMLString(videoEmbedString, baseURL: nil)
        
    }
  
  // MARK: - Notifications
  
  func keyboardWillShowNotification(_ notification: Notification) {
    let keyboardEndFrame = ((notification as NSNotification).userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    let convertedKeyboardEndFrame = view.convert(keyboardEndFrame, from: view.window)
    bottomLayoutGuideConstraint.constant = view.bounds.maxY - convertedKeyboardEndFrame.minY
  }
  
  func keyboardWillHideNotification(_ notification: Notification) {
    bottomLayoutGuideConstraint.constant = 48
  }
    
    
  
}

