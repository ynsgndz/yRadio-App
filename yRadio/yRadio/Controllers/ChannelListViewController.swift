//
//  ChannelListViewController.swift[
//  yRadio
//
//  Created by Yunus Gündüz on 5.05.2022.
//

import UIKit
import CloudKit

class ChannelListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var scientists: [String] = ["Power Turk",
                                "Kral Pop",
                                "Kral Fm",
                                "Slow Turk",
                                "Joy Turk",
                                "Pal Fm",
                                "Radyo D",
                                "Alem Fm",
                                "Best FM",
                                "Radyo Viva",
                                "Super Fm",
                                "Metro Fm",
                                "Show Radyo",
                                "Radyo 7",
                                "Number One Fm",
                                "Slow Time",
                                "Number One Turk",
                                "Joy Fm",
                                "Radyo Voyage",
                                "TRT Fm"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return scientists.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "listCell")!
        cell.textLabel?.text = scientists[indexPath.row]
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
        
      
    }
   
    
  
   

}

