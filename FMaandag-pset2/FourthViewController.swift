//
//  FourthViewController.swift
//  FMaandag-pset2
//
//  Created by Fien Maandag on 17-04-17.
//  Copyright © 2017 Fien Maandag. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    var storyText: String?
    var storyName: String?
    @IBOutlet weak var theStory: UILabel!
    @IBOutlet weak var storyTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theStory.text = storyText
        storyTitle.text = storyName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
