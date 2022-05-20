//
//  ChannelListViewController.swift[
//  yRadio
//
//  Created by Yunus Gündüz on 5.05.2022.
//

import UIKit
import CloudKit
import FRadioPlayer
class ChannelListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,  FRadioPlayerDelegate{
    func radioPlayer(_ player: FRadioPlayer, playerStateDidChange state: FRadioPlayerState) {

    }
    let player = FRadioPlayer.shared
    func radioPlayer(_ player: FRadioPlayer, playbackStateDidChange state: FRadioPlaybackState) {
  
    }
    

    var scientists: [String] = ["JOYTURK",
                                "POWERTURK",
                                "KRAL POP",
                                "KRAL FM",
                                "SLOWTÜRK",
                                "PAL FM",
                                "RADYO D",
                                "ALEM FM",
                                "BEST FM",
                                "RADYO VİVA",
                                "SÜPER FM",
                                "SHOW RADYO",
                                "EFKAR FM",
                                "DAMAR FM",
                                "RADYO 7",
                                "KAFA RADYO",
                                "NUMBER ONE TÜRK FM",
                                "AÇIK RADYO",
                                "BABA RADYO",
                                "RADYO ALATURKA",
                                "SLOW TİME",
                                "CAN RADYO",
                                "RADYO SEYMEN",
                                "RADIO MYDONOSE",
                                "POWER FM"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return scientists.count
    }
    var radiourlmm:String = "";
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewController{
            let viewController = segue.destination as?  ViewController
           
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "listCell")!
        cell.textLabel?.text = scientists[indexPath.row]
                                                                // tum kanallari liseleme islemi
        return cell
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let title = "Beğenmekten Vazgeç"
                let dislikeAction = UIContextualAction(style: .normal, title: title) { (action, view, completion) in
                    let cell = self.myTableView.cellForRow(at: indexPath)
                    cell?.backgroundColor = .white
                    print ("\(indexPath.section) \(self.scientists[indexPath.section]) Debug: Unlike ")
                    completion(true)
                }
                dislikeAction.image = UIImage(systemName: "heart.slash.fill")
                dislikeAction.backgroundColor = .systemRed
                let configuration = UISwipeActionsConfiguration(actions: [dislikeAction])
                return configuration
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch scientists[indexPath.row] {
        case "JOYTURK" :
            radiourlmm = "https://playerservices.streamtheworld.com/api/livestream-redirect/JOY_TURK_SC?/;"
            break
        case "POWERTURK" :
            radiourlmm = "https://listen.powerapp.com.tr/powerturk/abr/powerturk/128/playlist.m3u8"
            break
        case "KRAL POP" :
            radiourlmm = "http://46.20.3.201/;"
            break
        case "KRAL FM" :
            radiourlmm = "http://46.20.3.204/;"
            break
        case "SLOWTÜRK" :
            radiourlmm = "https://radyo.duhnet.tv/slowturk"
            break
        case "PAL FM" :
            radiourlmm = "http://wowza.radyogrup.com/SHOUTcast/palfm.stream/playlist.m3u8"
            break
        case "RADYO D" :
            radiourlmm = "https://radyo.duhnet.tv/radyod"
            break
        case "ALEM FM" :
            radiourlmm = "http://turkmedya.radyotvonline.net/alemfmaac"
            break
        case "BEST FM" :
            radiourlmm = "http://46.20.7.126/bestfmmp3"
            break
        case "RADYO VİVA" :
            radiourlmm = "http://46.20.3.231/;"
            break
        case "SÜPER FM" :
            radiourlmm = "https://playerservices.streamtheworld.com/api/livestream-redirect/SUPER_FM_SC?/;"
            break
        case "SHOW RADYO" :
            radiourlmm = "http://46.20.3.229/;"
            break
        case "EFKAR FM" :
            radiourlmm = "https://20423.live.streamtheworld.com/SC008_SO1AAC.aac"
            break
        case "DAMAR FM" :
            radiourlmm = "https://yayin.damarfm.com:8080/;"
            break
        case "RADYO 7" :
            radiourlmm = "http://46.20.3.250/;"
            break
        case "KAFA RADYO" :
            radiourlmm = "http://46.20.3.245/stream/510/"
            break
        case "NUMBER ONE TÜRK FM" :
            radiourlmm = "https://n10101m.mediatriple.net/numberoneturk"
            break
        case "AÇIK RADYO" :
            radiourlmm = "https://stream.34bit.net/ar.opus"
            break
        case "BABA RADYO" :
            radiourlmm = "http://37.247.98.7/;"
            break
        case "RADYO ALATURKA" :
            radiourlmm = "https://yayin.jumboserver.net/stream/alaturkash"
            break
        case "SLOW TİME" :
            radiourlmm = "http://46.20.7.103:8030/;"
            break
        case "CAN RADYO" :
            radiourlmm = "https://yayin2.canliyayin.org:10924/;"
            break
        case "RADYO SEYMEN" :
            radiourlmm = "https://yayin.radyoseymen.com.tr:1070/stream"
            break
        case "POWER FM" :
            radiourlmm = "https://listen.powerapp.com.tr/powerfm/abr/powerfm/128/playlist.m3u8"
            break
        case "RADIO MYDONOSE" :
            radiourlmm = "https://playerservices.streamtheworld.com/api/livestream-redirect/SC010_SO1_SC?/;"
            break
            
        default:
           
            break;
            
        }
        print("radiourlm \(radiourlmm)")
        player.radioURL = URL(string:"\(radiourlmm)" )
        player.togglePlaying()
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let title = "Favorile"
        let action = UIContextualAction(style: .normal, title: title){
            (action, view, completion) in
            let cell = self.myTableView.cellForRow(at: indexPath)
            cell?.backgroundColor = .systemPink
            print ("\(indexPath.section) \(self.scientists[indexPath.row]) Debug: addFav ")
            completion(true)
        }
        action.image = UIImage(systemName: "heart.fill")
        action.backgroundColor = .red
        
        let favoridenCikarTitle = "Sil"
        let cikarmaACtion = UIContextualAction(style: .destructive, title:favoridenCikarTitle){
            (action, view , completion) in
            self.myTableView.beginUpdates()
            self.scientists.remove(at: indexPath.row)
            self.myTableView.deleteRows(at: [indexPath], with: .automatic)
            self.myTableView.endUpdates()
            completion(true)
            print ("\(indexPath.section) \(self.scientists[indexPath.section]) Silindi ")
        }
            
        cikarmaACtion.image = UIImage(systemName: "trash.fill")
        cikarmaACtion.backgroundColor = .systemPink
        let configuration = UISwipeActionsConfiguration(actions: [action,cikarmaACtion])
        return configuration
    }
   
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource=self
        myTableView.delegate=self
        player.delegate = self
        grad()
    }
   
    
  
   
    func grad(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.purple.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

