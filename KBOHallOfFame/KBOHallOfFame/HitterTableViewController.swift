//
//  HitterTableViewController.swift
//  KBOHallOfFame
//
//  Created by 방문사용자 on 2018. 1. 22..
//  Copyright © 2018년 KU. All rights reserved.
//

import UIKit

struct Hitter {
    let name:String
    let team:Team
    let average:Double
    let year:Int
}

enum Team:String {//선택지 중 하나로 고르는 건 enumeration으로! 야구팀처럼
    case Haetae
    case MBC
    case Samsung
    case Nexen
    case NC
    case LG
    case Lotte
}


class HitterTableViewController: UITableViewController {

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let baek_1982 = Hitter(name: "백인천", team:.MBC, average: 0.412, year: 1982)
        let lee_1994 = Hitter(name: "이종범", team:.Haetae, average: 0.393, year: 1994)
        let jang_1987 = Hitter(name: "장효조", team:.Samsung, average: 0.387, year: 1987)
        let tames_2015 = Hitter(name: "테임즈", team:.NC, average: 0.381, year: 2015)
        let jang_1985 = Hitter(name: "장효조", team:.Samsung, average: 0.373, year: 1985)
        let ma_1999 = Hitter(name: "마해영", team:.Lotte, average: 0.372, year: 1999)
        let park_2009 = Hitter(name: "박용택", team:.LG, average: 0.372, year: 2009)
        let hong_2009 = Hitter(name: "홍성흔", team:.Lotte, average: 0.371, year: 2009)
        let seo_2014 = Hitter(name: "서건창", team:.Nexen, average: 0.370, year: 2014)
        let jang_1983 = Hitter(name: "장효조", team:.Samsung, average: 0.369, year: 1983)
        
        let hallOfFame = [baek_1982, lee_1994, jang_1987, tames_2015, jang_1985, ma_1999, park_2009, hong_2009, seo_2014, jang_1983].sorted(by: $0.year>$1.year)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hallOfFame.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HitterCell", for: indexPath)

        // Configure the cell...
        let currentHitter = hallOfFame[indexPath.row]
        cell.textLabel?.text =
        cell.detailTextLabel.text = String(currentHitter.average) + "( " + String(currentHitter.year) + ")"
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
