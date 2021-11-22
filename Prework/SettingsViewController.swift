//
//  SettingsViewController.swift
//  Prework
//
//  Created by student on 11/10/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipOneTextField: UITextField!
    @IBOutlet weak var tipTwoTextField: UITextField!
    @IBOutlet weak var tipThreeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Setting view did load")

        // Do any additional setup after loading the view.
        //Access UserDefaults
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Setting view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        // Access UserDefaults
        let defaults = UserDefaults.standard
        
        // Get an Integer value.
        let originalTipOne = defaults.string(forKey: "saveTipOne") ?? "tip 1: 0"
        let originalTipTwo = defaults.string(forKey: "saveTipTwo")  ?? "tip 2: 0"
        let originalTipThree = defaults.string(forKey: "saveTipThree") ?? "tip 3: 0"
        
//        print("******\(originalTipOne)******")
//        print("******\(originalTipTwo)******")
//        print("******\(originalTipThree)******")
        
        tipOneTextField.text = String(originalTipOne)
        tipTwoTextField.text = String(originalTipTwo)
        tipThreeTextField.text = String(originalTipThree)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Setting view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Setting view will disappear")
        
        let tipOneText = tipOneTextField.text
        let tipTwoText = tipTwoTextField.text
        let tipThreeText = tipThreeTextField.text
        
//        print("******\(tipOneText)******")
//        print("******\(tipTwoText)******")
//        print("******\(tipTwoText)******")
        
        //Access UserDefaults
        let defaults = UserDefaults.standard

        // Set an Integer value for some key.
        defaults.set(tipOneText, forKey: "myTipOne")
        defaults.set(tipTwoText, forKey: "myTipTwo")
        defaults.set(tipThreeText, forKey: "myTipThree")

        // Force UserDefaults to save.
        defaults.synchronize()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Setting view did disappear")
    }
    

}
