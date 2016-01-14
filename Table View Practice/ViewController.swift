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
    var superheros = ["Batman", "Wonder Woman", "Superman", "Flash", "Aquaman", "Scuba Steve"]
    var realNames = ["Bruce Wayne", "Diana", "Clark Kent", "Barry Alen", "Arthur Curry", "Steve"]

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // setting the datasource and delegate to the view controller
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    // creating a cell that would store your data on a tableview
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
        myTableViewCell.textLabel?.text = superheros[indexPath.row]
        myTableViewCell.detailTextLabel?.text = realNames[indexPath.row]
        return myTableViewCell
    }
    // sets the number of rows in your tableview
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superheros.count
    }
}

