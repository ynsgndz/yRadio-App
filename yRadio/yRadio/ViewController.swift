//
//  ViewController.swift
//  yRadio
//
//  Created by Yunus Gündüz on 4.05.2022.
//

import UIKit

import FRadioPlayer


class ViewController: UIViewController, FRadioPlayerDelegate {
    func radioPlayer(_ player: FRadioPlayer, playerStateDidChange state: FRadioPlayerState) {
        if state != nil{
            print("Debug: -FRadioPlayerState \(state)")
        }
       
    }
    
    func radioPlayer(_ player: FRadioPlayer, playbackStateDidChange state: FRadioPlaybackState) {
        if state != nil{
            print("Debug: -FRadioPlaybackState \(state)")
        }
    }
    
    func radioPlayer(_ player: FRadioPlayer, itemDidChange url: URL?){
        if url != nil{print("Debug: -URL \(url!)")
        }
    }
    
    func radioPlayer(_ player: FRadioPlayer, metadataDidChange artistName: String?, trackName: String?){
        if (artistName != nil) &&  trackName != nil{
        print("Debug: -artistName \(artistName)")
        print("Debug: -trackName \(trackName!)")
        }
    }
    func radioPlayer(_ player: FRadioPlayer, metadataDidChange rawValue: String?){
        if rawValue != nil{
        print("Debug: -rawValue \(rawValue!)")
        }
    }
    func radioPlayer(_ player: FRadioPlayer, artworkDidChange artworkURL: URL?){
       
        if artworkURL != nil{
            print("Debug: -artworkURL \(artworkURL!)")
        }
    }
    let player = FRadioPlayer.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - Radio
        player.delegate = self
        player.radioURL = URL(string: "https://listen.powerapp.com.tr/powerturk/mpeg/icecast.audio?/")

       
        
        
        
        
        
    }
    //MARK: - Tool Control
    @IBAction func btnPlayPause(_ sender: Any) {
        player.togglePlaying()
    }
    

}











































