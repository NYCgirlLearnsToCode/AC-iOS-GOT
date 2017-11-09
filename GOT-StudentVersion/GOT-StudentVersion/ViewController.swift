//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var episodeArr = [GOTEpisode]()
   // var alleps = AllEp
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        episodeArr = GOTEpisode.allEpisodes
        // Do any additional setup after loading the view, typically from a nib.
    }

   //2 reqd data source methods numberOfRows and cellForRowAt
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeArr.filter{$0.season == section + 1}.count
        //print(episodeArr.count)
        //return episodeArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Episode Cell"/*indexPath.section % 2 == 0 ? "Episode Cell Left":"Episode Cell Right"*/, for: indexPath)
        cell.textLabel?.text = episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].name
        cell.detailTextLabel?.text = "S:" + "\(episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].season) " + "E:" + "\(episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].number)"
        cell.imageView?.image = UIImage(named: episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].mediumImageID)
        //cell.textLabel?.textAlignment = .center
        //cell.detailTextLabel?.textAlignment = .center
       
        print(cell)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        var sectionNum =
//        print(sectionNum)
        return "Season \(section + 1)"
    }

}

