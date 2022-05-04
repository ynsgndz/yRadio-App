//
//  ViewController.swift
//  yRadio
//
//  Created by Yunus Gündüz on 4.05.2022.
//

// Ekran kitleme ozelligi gelmeli


import UIKit

import FRadioPlayer

import Kingfisher



class ViewController: UIViewController, FRadioPlayerDelegate {
    //MARK: - Delegate
    func radioPlayer(_ player: FRadioPlayer, playerStateDidChange state: FRadioPlayerState) {
        
            print("Debug: -FRadioPlayerState \(state)")
        
       
    }
    
    func radioPlayer(_ player: FRadioPlayer, playbackStateDidChange state: FRadioPlaybackState) {
      
            print("Debug: -FRadioPlaybackState \(state)")
        
    }
    
    func radioPlayer(_ player: FRadioPlayer, itemDidChange url: URL?){
        if url != nil{print("Debug: -URL \(url!)")
            
        }
    }
    
    func radioPlayer(_ player: FRadioPlayer, metadataDidChange artistName: String?, trackName: String?){
        if (artistName != nil) &&  trackName != nil{
        print("Debug: -artistName \(artistName!)")
        print("Debug: -trackName \(trackName!)")
        }
    }
    func radioPlayer(_ player: FRadioPlayer, metadataDidChange rawValue: String?){
        if rawValue != nil{
        print("Debug: -rawValue \(rawValue!)")
            parcaBilgisiLabel.text = rawValue
        }
    }
    func radioPlayer(_ player: FRadioPlayer, artworkDidChange artworkURL: URL?){
       
        if artworkURL != nil{
            let url = URL(string: "\(artworkURL!)")
            channelLogo.kf.setImage(with: url)
                // eger resim gelmediyse kontrolu yapilmali
            
            print("Debug: -artworkURL \(artworkURL!)")
        }
    }
    let player = FRadioPlayer.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - Outlet
        //Radio Url biyerde toplanmali
        player.delegate = self
        player.radioURL = URL(string: "https://playerservices.streamtheworld.com/api/livestream-redirect/JOY_TURK_SC?/")
    }
    @IBOutlet weak var parcaBilgisiLabel: UILabel!
    @IBOutlet weak var channelLogo: UIImageView!
    //MARK: - Control
    @IBAction func btnPlayPause(_ sender: Any) {
        player.togglePlaying()
    }
    

}











































