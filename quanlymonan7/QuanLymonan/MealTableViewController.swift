//
//  MealTableViewController.swift
//  QuanLymonan
//
//  Created by CNTT on 7/6/20.
//  Copyright © 2020 fit.tdc. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    //Mark: tinh chat
    private var mealList = [Meal]()
    enum NavigationDirection {
        case addMeal
        case updateMeal
    }
    var navigationDirection: NavigationDirection = .addMeal
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mark: load
        
        loadMeal()
        
        navigationItem.leftBarButtonItem = editButtonItem

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mealList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "MealTableViewCell"
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? MealTableViewCell else{
            fatalError("can not get the cell!")
        }

       //get datasouce
        
        let meal = mealList[indexPath.row]
        cell.mealName.text = meal.name
        cell.mealImage.image = meal.image
        cell.mealRatingControl.rating = meal.rating

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            mealList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let identifier = segue.identifier ?? ""
        
        //destination controller
        guard let mealDetailController = segue.destination as? ViewController else{
            print("can not get the viewcontroller")
            return
        }
        switch identifier {
        case "addMeal":
            print("Add a new meal")
            navigationDirection = .addMeal
           mealDetailController.navigationDirection = .addMeal
        case "updateMeal":
            //selectedCell
            navigationDirection = .updateMeal
            mealDetailController.navigationDirection = .updateMeal
            guard  let selectedCell = sender as? MealTableViewCell else{
                print("can not get the selecd Cell")
                return
                
            }
            //indexPath of selected cell
            guard let indexPath = tableView.indexPath(for: selectedCell) else{
                print("can not get the indexpath of selected cell")
                return
            }
            
            mealDetailController.meal = mealList[indexPath.row]
        default:
            print("you must name sugue before")
            return
        }
    }
    
    //mark: load
    

    private func loadMeal(){
        if let meal = Meal(name: "banh bot loc", image:UIImage(named: "defautlmage") , rating: 4)
        {
            mealList += [meal]
        }
    }
    //mark: unWind function
    
    @IBAction func unWindFromMealDetailController(sender: UIStoryboardSegue) {
        switch navigationDirection {
        case .addMeal:
            if let sourceController = sender.source as? ViewController, let meal = sourceController.meal {
                //tinh toan
                let indexPath = IndexPath(row: mealList.count, section: 0)
                //add new meal
                mealList.append(meal)
                //inset the new meal
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        case .updateMeal:
            
            if let sourceController = sender.source as? ViewController, let updateMeal = sourceController.meal {
                
                if let selectedCellIndexPath = tableView.indexPathForSelectedRow{
                    mealList[selectedCellIndexPath.row] = updateMeal
                    tableView.reloadRows(at: [selectedCellIndexPath], with: .none)
                }
               
            }
       
        }
        
        
    }
}
