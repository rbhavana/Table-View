//
//  ViewController.swift
//  Table View Practice
//
//  Created by Student on 1/13/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
// add data source and delegate to tableview peotocols
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    var superHeros = ["Batman", "Wonder Woman", "Superman", "Flash", "Aquaman", "Scuba Steve"]
    var realNames = ["Bruce Wayne", "Diana", "Clark Kent", "Barry Alen", "Arthur Curry", "Steve"]

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // setting the datasource and delegate to the view controller
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add Superhero", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let superheroNameTextField = myAlert.textFields! [0] as UITextField
            let aliasTextField = myAlert.textFields! [1] as UITextField
            self.superHeros.append(superheroNameTextField.text!)
            self.realNames.append(aliasTextField.text!)
            self.myTableView.reloadData()
        }
        
        myAlert.addAction(addAction)
        
        myAlert.addTextFieldWithConfigurationHandler { (superheroTextField) -> Void in
            superheroTextField.placeholder = "Add Superhero Name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (aliasTextField) -> Void in
            aliasTextField.placeholder = "Add Real Name"
        }
        
        //presentsthe alert view controller.
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    // creating a cell that would store your data on a tableview
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
        myTableViewCell.textLabel?.text = superHeros[indexPath.row]
        myTableViewCell.detailTextLabel?.text = realNames[indexPath.row]
        return myTableViewCell
    }
    // sets the number of rows in your tableview
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superHeros.count
    }
    
    //allows you to delete rows from the tableview
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            superHeros.removeAtIndex(indexPath.row)
            realNames.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
}
























