//
//  DetailViewController.swift
//  DL-Coding-Challenge-Public
//
//  Created by Charles Plater on 9/10/16.
//  Copyright © 2016 Charles Plater. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.currentObservation.displayLocation.city
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

