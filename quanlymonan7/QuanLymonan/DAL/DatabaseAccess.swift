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
}





