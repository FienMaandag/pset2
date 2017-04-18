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
    
    // create an array of names and file locations
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
            
            // check if storyIdentifier is present
            guard let storyIdentifier = storyIdentifier else { return }
            
            // set title to story name
            self.navigationItem.title = stories[storyIdentifier]?.name
            
            // get file name, get file path, get file content and stream to Story
            let file = stories[storyIdentifier]?.file
            let filePath = Bundle.main.path(forResource: file, ofType: "txt")
            let fileContent = try! String(contentsOfFile: filePath!)
            self.story = Story(stream: fileContent)
            
            // set wordType, wordsLeft and wordInput
            wordType.text = "please enter a \(story!.getNextPlaceholder())"
            wordsLeft.text = "\(story!.getPlaceholderRemainingCount()) word(s) left"
            wordInput.placeholder = story?.getNextPlaceholder()
        }
    }
    
    var story: Story? = nil
    
    @IBOutlet weak var wordInput: UITextField!
    @IBOutlet weak var wordType: UILabel!
    @IBOutlet weak var wordsLeft: UILabel!
    @IBOutlet weak var showStory: UIButton!

    // when button is clicked
    @IBAction func next(_ sender: UIButton) {
        
        // save word to fillInPlaceholder and clear input
        story?.fillInPlaceholder(word: wordInput.text!)
        wordInput.text = nil
        
        // updat wordType, wordsLeft and wordInput
        wordInput.placeholder = story?.getNextPlaceholder()
        wordType.text = "please enter a \(story!.getNextPlaceholder())"
        wordsLeft.text = "\(story!.getPlaceholderRemainingCount()) word(s) left"
        
        // if all words are filled in show showStory button
        if (story?.isFilledIn())!{
            wordType.isHidden = true
            wordsLeft.isHidden = true
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
}
