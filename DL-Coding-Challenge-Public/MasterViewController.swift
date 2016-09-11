//
//  MasterViewController.swift
//  DL-Coding-Challenge-Public
//
//  Created by Charles Plater on 9/10/16.
//  Copyright © 2016 Charles Plater. All rights reserved.
//

import UIKit
import CoreLocation

class MasterViewController: UITableViewController, CLLocationManagerDelegate {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    var newZipTextField: UITextField?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Enable Pull to Refresh
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl!.addTarget(self, action: #selector(refresh(sender:)), for: UIControlEvents.valueChanged)
        self.tableView.addSubview(refreshControl!)
        
        // Start CLLocationManager
        let locationManager = CLLocationManager()
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        // Attempt to get the users location
        
//        var userLocation:CLLocation = locations[0] as! CLLocation
//        let long = userLocation.coordinate.longitude;
//        let lat = userLocation.coordinate.latitude;
        
        // Add a button to allow the addition of new locations
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        // Get the weather data for the current location
        // currently grabing a URL that works as CLLocationManager is not firing
        // TODO: Change this to the actual location when location can be acquired
        let url = NSURL(string: "https://api.wunderground.com/api/e6a24f185bbc50bc/conditions/q/CA/San_Francisco.json")
        
        addLocation(url: url!)

    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(_ sender: Any) {
        
        // Display an UIAlertView to ask for the ZIP of the new location
        let alert = UIAlertController(title: "Add Location", message: "Please enter the ZIP Code of the location you would like to add.", preferredStyle: UIAlertControllerStyle.alert)
        // Add a button to the UIAlertView with a completion handler to act on the new zip code
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { alertAction in
            // Compose an NSURL that calls the Weather Underground API with the zip code
            let url = NSURL(string: "https://api.wunderground.com/api/e6a24f185bbc50bc/conditions/q/" + self.newZipTextField!.text! + ".json")
            // Call our function to add location via the URL
            self.addLocation(url: url!)

            }))
        // Add a text field to the UIAlertView for the ZIP code
        alert.addTextField { (newZipTextField) in
            // Set the keyboard to the number pad
            // This assumes US Zip codes. This could be expanded for non US Postal Codes
            newZipTextField.keyboardType = .numberPad
            // Set to instance var newZipTextField to the UIAlertView field so we can use the data later
            self.newZipTextField = newZipTextField
        }
        // Display the UIAlertView
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object as? cpwWeatherData
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // Get the object in question as a cpwWeatherData object
        let object = objects[indexPath.row] as! cpwWeatherData
        // Display the name of the location
        cell.textLabel!.text = String(object.currentObservation.displayLocation.city + "\n" + object.currentObservation.observationTime)
        cell.textLabel?.numberOfLines = 0
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    func refresh(sender:AnyObject)
    {
        // This is called at the end of a pull to refresh
        // First, iterrate over every object and try to update by zip code.
        for (index,object) in objects.enumerated() {
            let weatherObject = object as! cpwWeatherData
            let zipCode = weatherObject.currentObservation.displayLocation.zip
            let url = NSURL(string: "https://api.wunderground.com/api/e6a24f185bbc50bc/conditions/q/" + zipCode! + ".json")
            self.updateLocation(index: index, url: url!)
        }
        // Next, tell the UI that the data needs to be updated.
        self.tableView.reloadData()
        // Next (and last) stop the refreshing animation
        self.refreshControl?.endRefreshing()
    }
    
    func addLocation(url:NSURL){
        // Set up a URLSession with the URL that was passed
        let task = URLSession.shared.dataTask(with: url as URL) {(data, response, error) in
            // JSONSerialization can throw errors, so let's get ready to catch them
            do {
                // Try to run the data through the native JSONSerialiation function
                let wuapiJson = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                // Get the data into a cpWeatherData object
                let weatherData = cpwWeatherData.init(fromDictionary: wuapiJson as! NSDictionary)
                // Add the cpwWeatherData object to the UITableView's Data Source
                self.objects.append(weatherData)
                DispatchQueue.main.async {
                    // execute UI updated on the main thread
                    self.tableView.reloadData()
                }
            } catch {
                // TODO: Notify the user of the error
                print("json error: \(error)")
            }
        }
        // Start the task
        task.resume()
    }
    
    func updateLocation(index: Int, url:NSURL){
        // Set up a URLSession with the URL that was passed
        let task = URLSession.shared.dataTask(with: url as URL) {(data, response, error) in
            // JSONSerialization can throw errors, so let's get ready to catch them
            do {
                // Try to run the data through the native JSONSerialiation function
                let wuapiJson = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                // Get the data into a cpWeatherData object
                let weatherData = cpwWeatherData.init(fromDictionary: wuapiJson as! NSDictionary)
                // Update the cpwWeatherData object to the UITableView's Data Source
                self.objects[index] = weatherData
                DispatchQueue.main.async {
                    // execute UI updated on the main thread
                    self.tableView.reloadData()
                }
            } catch {
                // TODO: Notify the user of the error
                print("json error: \(error)")
            }
        }
        // Start the task
        task.resume()
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
}

