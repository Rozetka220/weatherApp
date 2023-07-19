//
//  ViewController.swift
//  weatherApp
//
//  Created by Аделия Исхакова on 15.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var service = TemperatureService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.getTemperature()
    }
    
    
    
}

