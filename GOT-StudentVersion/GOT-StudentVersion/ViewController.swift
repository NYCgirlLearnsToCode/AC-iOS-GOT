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
    var alleps = AllEp
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
        print(episodeArr.count)
        return episodeArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Episode Cell", for: indexPath)
        cell.textLabel?.text = episodeArr[indexPath.row].name
        cell.detailTextLabel?.text = "S:" + "\(episodeArr[indexPath.row].season) " + "E:" + "\(episodeArr[indexPath.row].number)"
        cell.imageView?.image = UIImage(named: episodeArr[indexPath.row].mediumImageID)
        //cell.textLabel?.textAlignment = .center
        //cell.detailTextLabel?.textAlignment = .center
       
        print(cell)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionNum =
        //print(sectionNum)
        switch  section {
        case 1:
            return "Season 1"
        default:
            return "next"
        }
    }

}

