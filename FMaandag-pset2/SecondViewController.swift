//
//  SecondViewController.swift
//  FMaandag-pset2
//
//  Created by Fien Maandag on 12-04-17.
//  Copyright © 2017 Fien Maandag. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Choose a story"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let thirdVC = segue.destination as? ThirdViewController{
            thirdVC.storyIdentifier = segue.identifier
        }
    }
}
