//
//  ViewController.swift
//  YoutubeApp
//
//  Created by Abhishek Arya on 6/25/17.
//  Copyright © 2017 Abhishek Arya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, videoModelDelegate {

    @IBOutlet weak var tableView: UITableView!
    var videos:[Video] = [Video]()
    var selectedVideo:Video?
    let model:VideoModel = VideoModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.model.delegate = self
        
        //self.videos = VideoModel().getVideos()
        model.getFeedVideos()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dataReady() {
        self.videos = self.model.videoArray
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ((self.view.frame.size.width / 1280) * 720)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        
        let videoTitle = videos[indexPath.row].videoTitle
        
        let label = cell.viewWithTag(2) as! UILabel
        label.text = videoTitle
        
        
        //cell.textLabel?.text = videoTitle
        
        let videoThumbnailUrlString = videos[indexPath.row].videoThumbnailUrl
        
        let videoThumbnailUrl = NSURL(string:videoThumbnailUrlString)
        
        if videoThumbnailUrl != nil{
        let request = URLRequest(url: videoThumbnailUrl! as URL )
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request, completionHandler:
        { (data:Data?, response:URLResponse?, error:Error?) -> Void in
            
            DispatchQueue.main.async(execute: { () -> Void in
                
                let imageView = cell.viewWithTag(1) as! UIImageView
                
                imageView.image = UIImage(data: data!)
                
            })
            
        })
                
            
            
        dataTask.resume()
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedVideo = self.videos[indexPath.row]
        self.performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! VideoDetailViewController
        
        detailViewController.selectedVideo = self.selectedVideo
    }
}

