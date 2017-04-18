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
    @IBOutlet weak var storyTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyTextView.text        = storyText
        self.navigationItem.title = storyName
        
        let item = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonItemPressed))
        self.navigationItem.rightBarButtonItem = item
        self.navigationItem.hidesBackButton = true
    }
    
    func doneButtonItemPressed(sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
