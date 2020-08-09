//
//  DatabaseAccess.swift
//  QuanLymonan
//
//  Created by CNTT on 7/27/20.
//  Copyright © 2020 fit.tdc. All rights reserved.
//

import Foundation
import UIKit
import os.log

class MyDatabaseAccess {
    
    var dPath: String = ""
    let DB_NAME:  String = "Foods.sqlite"
    let db: FMDatabase?
    
    
    let TABLE_NAME: String = "meals"
    let TABLE_ID: String = "_id"
    let MEAL_NAME: String = "name"
    let MEAL_IMAGE: String = "image"
    let MEAL_RATING: String = "rating"
    
    
    init() {
        let directories:[String] = NSSearchPathForDirectoriesInDomains( .documentDirectory, .allDomainsMask, true)
        
        dPath = directories[0] + "/" + DB_NAME
        db = FMDatabase(path: dPath)
        
        if db == nil  {
            os_log("can not the create the database")
        }
        else{
            os_log("database is create seccessfull")
        }
    }
    
    
    func createTable() -> Bool  {
        var ok: Bool = false
        
        if db != nil {
            let sql = " CREATE TABLE" + TABLE_NAME + "("
                + TABLE_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, "
                + MEAL_NAME + " TEXT "
                + MEAL_IMAGE + " TEXT "
                + MEAL_RATING + " INTEGER)"
            
            if db!.executeStatements(sql){
                ok = true
                os_log("table is create")
            }
            else{
                os_log("can not create table")
            }
        }
        else{
            os_log("Database is nil!")
        }
        return ok
    }
    
    
    func open() -> Bool {
        var ok: Bool = false
        
        if db != nil{
            if db!.open(){
                ok = true
                os_log("the database is opened")
            }
            else{
                print("can not the open database: \(db!.lastErrorMessage())")
            }
        }
        else{
            os_log("database is nil")
        }
        return ok
    }
    
    func close()   {
        if db != nil{
            db!.close()
        }
    }
    
    func insert(meal: Meal) {
        if db != nil{
            let imageData: NSData = meal.image!.pngData()! as NSData
            let mealImageString = imageData.base64EncodedData(options: .lineLength64Characters)
            
            let sql = " INSERT INTO" + TABLE_NAME + "(" +  MEAL_NAME  + ", " + MEAL_IMAGE + ", " + MEAL_RATING + ")"   +  " VALUES (?, ?, ?)"
            
            if db!.executeUpdate(sql, withArgumentsIn:  [meal.name, mealImageString, meal.rating]){
                os_log("the meal is insert to the database")
                
            }
            else{
                os_log("fial")
            }
            
        }
        else{
            os_log("nilsssssssssss")
        }
    }
    
    func delete(meal: Meal){
        if db != nil {
            let sql = "DELETE FROM\(TABLE_NAME) WHERE \(MEAL_NAME) = ? AND \(MEAL_NAME) = ?"
            
            
            do{
                try db!.executeUpdate(sql, values: [meal.name, meal.rating])
                os_log("the meal is delete")
            }
            catch{
                os_log("fail to the delete the meal")
            }
            
        }
        
        else{
            os_log("Database is nil?")
        }
    }
    
    
    func readMeal(meals:inout [Meal]){
        if db != nil{
            var results: FMResultSet?
            
            let sql = "SELECT * FROM \(TABLE_NAME)"
            
            do{
                results = try db!.executeQuery(sql, values: nil)
            }
            catch{
                print("fail to read data: \(error.localizedDescription)")
            }
            
            if results != nil{
                while (results?.next())!{
                    let mealName = results?.string(forColumn: MEAL_NAME) ?? ""
                    let StringImage = results?.string(forColumn: MEAL_IMAGE)
                    let mealRating = results?.int(forColumn: MEAL_RATING) ?? 0
                    
                    
                    let dataImage: Data = Data(base64Encoded: StringImage!, options: .ignoreUnknownCharacters)!
                    
                    let mealImage = UIImage(data: dataImage)
                    
                    
                    let meal = Meal(name: mealName, image: mealImage!, rating: Int(mealRating))
                    meals.append(meal!)
                }
            }
        }
        else{
            os_log("Database is nil")
        }
    }
    
    func update(olMeal: Meal, newMeal: Meal){
        if db != nil{
            let sql = "UPDATE \(TABLE_NAME) SET \(MEAL_NAME) = ?, \(MEAL_IMAGE) = ?, \(MEAL_RATING) = ? WHERE \(MEAL_NAME) = ? AND \(MEAL_RATING) = ? "
            
            let newImageData: NSData = newMeal.image!.pngData()! as NSData
            let newStringImage = newImageData.base64EncodedData(options: .lineLength64Characters)
            
            do{
                try db!.executeUpdate(sql, values: [newMeal.name, newStringImage, newMeal.rating, olMeal.name, olMeal.rating])
                os_log("to update the meal")
            }
            catch{
                print("fail to update the meal: \(error.localizedDescription)")
            }
            
        }
        else{
            os_log("database is nill")
        }
    }
}





