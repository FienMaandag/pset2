//
//  ThirdViewController.swift
//  FMaandag-pset2
//
//  Created by Fien Maandag on 12-04-17.
//  Copyright © 2017 Fien Maandag. All rights reserved.
//

import UIKit
import Foundation

class ThirdViewController: UIViewController {
    
    let stories: [String : (name: String, file: String)] =
        ["simple" : ("Simple", "madlib0_simple"),
         "tarzan" : ("Tarzan" , "madlib1_tarzan"),
         "uni" : ("University", "madlib2_university"),
         "clothes" : ("Clothes" , "madlib3_clothes"),
         "dance" : ("Dance" , "madlib4_dance")]
    
    var storyIdentifier: String? {
        didSet {
            // Sorry leluk
            let _ = self.view
            
            guard let storyIdentifier = storyIdentifier else { return }
            labelName.text = stories[storyIdentifier]?.name
            
            let file = stories[storyIdentifier]?.file
            let filePath = Bundle.main.path(forResource: file, ofType: "txt")
            let fileContent = try! String(contentsOfFile: filePath!)
            self.story = Story(stream: fileContent)
            
            wordType.text = story?.getNextPlaceholder()
            wordsLeft.text = String(describing: story?.getPlaceholderRemainingCount())
            wordInput.placeholder = story?.getNextPlaceholder()
        }
    }
    
    var story: Story? = nil
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var wordInput: UITextField!
    @IBOutlet weak var wordType: UILabel!
    @IBOutlet weak var wordsLeft: UILabel!
    @IBOutlet weak var showStory: UIButton!

    
    @IBAction func next(_ sender: UIButton) {
        story?.fillInPlaceholder(word: wordInput.text!)
        wordType.text = story?.getNextPlaceholder()
        wordsLeft.text = String(describing: story?.getPlaceholderRemainingCount())
        wordInput.text = nil
        wordInput.placeholder = story?.getNextPlaceholder()
        
        if (story?.isFilledIn())!{
            showStory.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let fourthVC = segue.destination as? FourthViewController{
            fourthVC.storyText = story?.toString()
            fourthVC.storyName = stories[storyIdentifier!]?.name
        }
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
