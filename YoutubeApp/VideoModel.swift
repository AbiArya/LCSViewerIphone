//
//  VideoModel.swift
//  YoutubeApp
//
//  Created by Abhishek Arya on 6/25/17.
//  Copyright © 2017 Abhishek Arya. All rights reserved.
//

import UIKit
import Alamofire

protocol videoModelDelegate{
    func dataReady()
    
}

class VideoModel: NSObject {
    let PLAYLISTID = "UUvqRdlKsE5Q8mf8YXbdIJLw"
    let KEY = "AIzaSyD4eCQshvaI0Arit_vyyeKXeUHI7JJsKv8"
    var videoArray = [Video]()
    
    var delegate:videoModelDelegate?
    func getFeedVideos() {
        
        Alamofire.request("https://www.googleapis.com/youtube/v3/playlistItems", parameters: ["part" : "snippet" , "playlistId" : PLAYLISTID , "key" : KEY], encoding: URLEncoding.default, headers: nil).responseJSON{response in
        
           /* if let data = response.result.value as? [String : Any]{
                     for video in (data["items"] as! NSArray) {
                        print(video)
                    }
                //print(data)
            }
        
        
            print("hi")*/
           // debugPrint(response)
            
            if let json = response.result.value as? [String: Any]{
               // print("JSON: \(json)")
                var arrayOfVideos = [Video]()
                for video in json["items"] as! NSArray{
                    //print(video)
                    let videoObj = Video()
                    
                    videoObj.videoId = (((((video as! [String: Any])["snippet"]) as! [String: Any])["resourceId"]) as! [String: Any])["videoId"] as! String
                    //print(videoObj.videoId)
                    
                    videoObj.videoTitle=((((video as! [String: Any])["snippet"]) as! [String: Any])["title"]) as! String
                  //  print(videoObj.videoTitle)
                    videoObj.videoDescription = ((((video as! [String: Any])["snippet"]) as! [String: Any])["description"]) as! String
                  //  print(videoObj.videoDescription)
                    
                    videoObj.videoThumbnailUrl = (((((((video as! [String: Any])["snippet"]) as! [String: Any])["thumbnails"]) as! [String: Any])["high"]) as! [String: Any])["url"] as! String
                    //print(videoObj.videoThumbnailUrl)
                    
                    arrayOfVideos.append(videoObj)
                    
                }
                self.videoArray = arrayOfVideos
                if self.delegate != nil{
                    self.delegate!.dataReady()
                }
            }
        }
    }
    
    func getVideos() -> [Video]{
        
        var videos = [Video]()
        let video1 = Video()
        video1.videoId = "ObBjyLmT92Q"
        video1.videoTitle = "Hip-Hop 101 ( The A&R Report ) Hosted By @iambig7"
        video1.videoDescription = "#1 Indie TV RADIO SHOW!"
        
        let video2 = Video()
        video2.videoId = "qxq5T-RikSs"
        video2.videoTitle = "Time2grindRadio TV RADIO Live Stream"
        video2.videoDescription = "#1 Indie TV RADIO SHOW!"

        let video3 = Video()
        video3.videoId = "gxNFFOFTgnw"
        video3.videoTitle = "Time2grindRadio TV RADIO Live Stream"
        video3.videoDescription = "#1 Indie TV RADIO SHOW!"

        let video4 = Video()
        video4.videoId = "MJj_PPq0HeE"
        video4.videoTitle = "Time2grindRadio TV RADIO Live Stream"
        video4.videoDescription = "#1 Indie TV RADIO SHOW!"

        let video5 = Video()
        video5.videoId = "leWzEF9mu6M"
        video5.videoTitle = "Time2grindRadio TV RADIO Live Stream"
        video5.videoDescription = "#1 Indie TV RADIO SHOW!"

        
        videos.append(video1)
        videos.append(video2)
        videos.append(video3)
        videos.append(video4)
        videos.append(video5)
        return videos
    }
    
}
