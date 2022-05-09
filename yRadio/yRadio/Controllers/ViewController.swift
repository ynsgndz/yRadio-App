//
//  ViewController.swift
//  yRadio
//
//  Created by Yunus Gündüz on 4.05.2022.
//

// Ekran kitleme ozelligi gelmeli -done
// eger resim gelmediyse kontrolu yapilmali

import UIKit
import FRadioPlayer
import Kingfisher
import SwiftyGif


class ViewController: UIViewController, FRadioPlayerDelegate {
    
    
    //MARK: - Delegate
    func radioPlayer(_ player: FRadioPlayer, playerStateDidChange state: FRadioPlayerState) {
        
            print("Debug: -FRadioPlayerState \(state)")
        eqolaizerState()
       
    }
    
    func radioPlayer(_ player: FRadioPlayer, playbackStateDidChange state: FRadioPlaybackState) {
      
            print("Debug: -FRadioPlaybackState \(state)")
       eqolaizerState()
        
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
           
            parcaBilgisiLabel.text? = rawValue!
         
            
        }
    }
    func radioPlayer(_ player: FRadioPlayer, artworkDidChange artworkURL: URL?){
       
        if artworkURL != nil{
            let url = URL(string: "\(artworkURL!)")
            channelSarkıLogo.kf.setImage(with: url)
               
            
            print("Debug: -artworkURL \(artworkURL!)")
        }
    }
    func plyPlayer(){
        let radioURL = "https://playerservices.streamtheworld.com/api/livestream-redirect/METRO_FM_SC?/;"
        player.radioURL = URL(string:"\(radioURL)" )
        player.togglePlaying()
        print("Debug: -Radio url adresi \(radioURL)")
    }
    let player = FRadioPlayer.shared
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        channelSarkıLogo.isHidden = false
        player.delegate = self
        plyPlayer()

    }
   
    //MARK: - Outletler
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var btnPlayPauseOutlet: UIButton!
    @IBOutlet weak var ekolaizerGifImageView: UIImageView!
    @IBOutlet weak var radioListesiBtn: UIButton!
    @IBOutlet weak var parcaBilgisiLabel: UILabel!
    @IBOutlet weak var channelSarkıLogo: UIImageView!
    //MARK: - Actionlar
    @IBAction func btnPlayPause(_ sender: Any) {
       
        if player.isPlaying{
            player.stop()

   
        }else{
            player.play()
         
        }
    }
  
    func eqolaizerState(){
        if player.isPlaying{
 
            do{
                let gif = try UIImage(gifName: "eqol.gif")
                self.ekolaizerGifImageView.setGifImage(gif, loopCount: -1) // Will loop stop
            }catch{
                print(error)
            }
        }else{
            do{
                let gif = try UIImage(gifName: "eqol.gif")
                self.ekolaizerGifImageView.setGifImage(gif, loopCount: 0) // Will loop forever
            }catch{
                print(error)
            }
        }
    }
 
    @IBAction func segmentedKontrol(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            // Play
            print("Debug: Segmented control 0 play mod ")
            channelSarkıLogo.isHidden = false
            parcaBilgisiLabel.isHidden = false
            btnPlayPauseOutlet.isHidden = false
            radioListesiBtn.isHidden = false
            channelNameLabel.isHidden = false
            ekolaizerGifImageView.isHidden = false
        case 1:
            // Favori
            print("Debug: Segmented control 1 favori mod")
            channelSarkıLogo.isHidden = true
            parcaBilgisiLabel.isHidden = true
            btnPlayPauseOutlet.isHidden = true
            radioListesiBtn.isHidden = true
            channelNameLabel.isHidden = true
            ekolaizerGifImageView.isHidden = true
        case 2:
            //Kilit
            print("Debug: Segmented control 2 kilit mod")
            channelSarkıLogo.isHidden = false
            parcaBilgisiLabel.isHidden = false
            btnPlayPauseOutlet.isHidden = true
            radioListesiBtn.isHidden = true
            channelNameLabel.isHidden = false
            ekolaizerGifImageView.isHidden = false
        default:
            print("Debug: Segmented control default mod")
            channelSarkıLogo.isHidden = false
            parcaBilgisiLabel.isHidden = false
            btnPlayPauseOutlet.isHidden = false
            radioListesiBtn.isHidden = false
            channelNameLabel.isHidden = false
            ekolaizerGifImageView.isHidden = false
            
        }
    }
    
}

