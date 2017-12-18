//
//  InitViewController.swift
//  YoutubeApp
//
//  Created by Abhishek Arya on 7/12/17.
//  Copyright © 2017 Abhishek Arya. All rights reserved.
//

import UIKit

class InitViewController: UIViewController {

    @IBAction func LiveViewer(_ sender: Any) {
        print("pressed")
        
        self.performSegue(withIdentifier: "MoveToLive", sender: self)
    }
    
    @IBAction func History(_ sender: Any) {
        self.performSegue(withIdentifier: "ShowHistory", sender: self)
    }
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        print("load")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
