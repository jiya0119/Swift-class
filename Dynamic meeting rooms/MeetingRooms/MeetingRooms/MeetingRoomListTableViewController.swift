
//
//  MeetingRoomListTableViewController.swift
//  MeetingRooms
//
//  Created by 방문사용자 on 2018. 1. 24..
//  Copyright © 2018년 KU. All rights reserved.
//

import UIKit

class MeetingRoomListTableViewController: UITableViewController {
    
    var service : Service?
    
    func meetingRoomsAtIndex(index: Int) -> (key: String, value: [String:Int]){
        let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
    return orderedMeetingRooms[index]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.title = service?.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
          return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // let categoryValues = Array(meetingRooms.values)[section]
<<<<<<< HEAD
        //let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
        
        let rowCount = meetingRoomsAtIndex(index: section).value.count
=======
        guard let rowCount = service?.items?.count else {
            return 0
        }
>>>>>>> origin/master
        return rowCount
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
<<<<<<< HEAD
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        //let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
        
        //let categoryValue = Array(meetingRooms.values)[indexPath.section]
        
        let categoryValue = meetingRoomsAtIndex(index: indexPath.section).value
        let orderedCategoryValue = categoryValue.sorted(by:{$0.1 < $1.1})
        let roomName = orderedCategoryValue[indexPath.row].0
        let capacity = orderedCategoryValue[indexPath.row].1
       
        cell.textLabel!.text = roomName
        cell.detailTextLabel!.text = "\(capacity)"
=======
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
>>>>>>> origin/master
        
        guard let meetingRoom = service?.items?[indexPath.row] else {
            return cell
        }
        
        cell.textLabel!.text = meetingRoom.name
        cell.detailTextLabel!.text = String(meetingRoom.capacity)

        return cell
    }
    
<<<<<<< HEAD
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //let orderedMeetingRooms = meetingRooms.sorted(by:{$0.1.first!.1 < $1.1.first!.1})
        return meetingRoomsAtIndex(index:section).key
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let orderedMeetingRooms = meetingRooms.sorted(by:{$0.1.first!.1 < $1.1.first!.1})
        let rowCount = meetingRoomsAtIndex(index:section).value.count
        return "\(rowCount) rooms"
    }
=======

>>>>>>> origin/master


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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
        if segue.identifier == "MeetingRoomSegue" {
            guard let destination = segue.destination as? MeetingRoomListTableViewController, let selectedIndex = self.tableView.indexPathForSelectedRow?.row else {
                return
            }
            destination.service = service
        }
    
    }


}
