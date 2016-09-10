//
//  DetailViewController.swift
//  DL-Coding-Challenge-Public
//
//  Created by Charles Plater on 9/10/16.
//  Copyright © 2016 Charles Plater. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var temp: UILabel!

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            
            // Each of these if statements checks to make sure the fields have been instantiated before trying to set them.
            
            // TODO: remove the detailDescriptionLabel
            if let label = self.detailDescriptionLabel {
                label.text = ""
            }
            // Set the city label's text to the name of the city
            if let label = self.city {
                label.text = detail.currentObservation.displayLocation.city
            }
            // Set the state label's text to the name of the state
            if let label2 = self.state {
                label2.text = detail.currentObservation.displayLocation.stateName
            }
            // Set the temp label's text to the current temperature in Fahrenheit
            if let label3 = self.temp {
                label3.text = NSString(format: "%.0f°F", detail.currentObservation.tempF) as String
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: cpwWeatherData? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

}

