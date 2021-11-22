import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipSplitStepper: UIStepper!
    @IBOutlet weak var tipSplitSize: UILabel!
    @IBOutlet weak var tipSplitBox: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("main view did load")
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
    }
    
    @IBAction func billTextFieldEditingChanged(_ sender: UITextField) {
        print(sender.text!)
        let (tip, total) = setTip()
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func calculateStepper(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        
        let (tip, total) = setTip()
        let partyValue = total / Double(currentValue)

        tipSplitSize.text = String(Int(sender.value))
        tipSplitBox.text = String(format: "$%.2f per person", partyValue)
        print("-------")
        print("total value = \(total)")
        print("split value = \(currentValue)")
        print("per person = \(partyValue)")
        print("-------")
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // Access UserDefaults
        let defaults = UserDefaults.standard
        
        // Get an Integer value.
        let tipOneValue = defaults.string(forKey: "myTipOne")
        let tipTwoValue = defaults.string(forKey: "myTipTwo")
        let tipThreeValue = defaults.string(forKey: "myTipThree")
        
        var strippedTipOneValue = tipOneValue
        var strippedTipTwoValue = tipTwoValue
        var strippedTipThreeValue = tipThreeValue
        
        if tipOneValue!.contains("%") {
            strippedTipOneValue = String(tipOneValue!.dropLast())
        }
        if tipTwoValue!.contains("%") {
            strippedTipTwoValue = String(tipTwoValue!.dropLast())
        }
        if tipThreeValue!.contains("%") {
            strippedTipThreeValue = String(tipThreeValue!.dropLast())
        }
        
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tip1 = Double(strippedTipOneValue!) ?? 0
        let tip2 = Double(strippedTipTwoValue!) ?? 0
        let tip3 = Double(strippedTipThreeValue!) ?? 0
        
        let newtip1 = tip1 / 100
        let newtip2 = tip2 / 100
        let newtip3 = tip3 / 100
        
        print("******\(newtip1)******")
        print("******\(newtip2)******")
        print("******\(newtip3)******")
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0, newtip1, newtip2, newtip3]
        let tipPercentage = Double(tipPercentages[tipControl.selectedSegmentIndex])
        let tip = bill * tipPercentage
        let total = bill + tip

        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func setTip() -> (Double, Double) {
        // Access UserDefaults
        let defaults = UserDefaults.standard
        
        // Get an Integer value.
        let tipOneValue = defaults.string(forKey: "myTipOne")
        let tipTwoValue = defaults.string(forKey: "myTipTwo")
        let tipThreeValue = defaults.string(forKey: "myTipThree")
        
        var strippedTipOneValue = tipOneValue
        var strippedTipTwoValue = tipTwoValue
        var strippedTipThreeValue = tipThreeValue
        
        if tipOneValue!.contains("%") {
            strippedTipOneValue = String(tipOneValue!.dropLast())
        }
        if tipTwoValue!.contains("%") {
            strippedTipTwoValue = String(tipTwoValue!.dropLast())
        }
        if tipThreeValue!.contains("%") {
            strippedTipThreeValue = String(tipThreeValue!.dropLast())
        }
        
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tip1 = Double(strippedTipOneValue!) ?? 0
        let tip2 = Double(strippedTipTwoValue!) ?? 0
        let tip3 = Double(strippedTipThreeValue!) ?? 0
        
        let newtip1 = tip1 / 100
        let newtip2 = tip2 / 100
        let newtip3 = tip3 / 100
        
        print("******\(newtip1)******")
        print("******\(newtip2)******")
        print("******\(newtip3)******")
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0, newtip1, newtip2, newtip3]
        let tipPercentage = Double(tipPercentages[tipControl.selectedSegmentIndex])
        let tip = bill * tipPercentage
        let total = bill + tip
        return (tip, total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("main view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        // Access UserDefaults
        let defaults = UserDefaults.standard
        
        // Get an Integer value.
        let tipOneValue = defaults.string(forKey: "myTipOne")
        let tipTwoValue = defaults.string(forKey: "myTipTwo")
        let tipThreeValue = defaults.string(forKey: "myTipThree")
        
        tipControl.setTitle(tipOneValue, forSegmentAt: 1)
        tipControl.setTitle(tipTwoValue, forSegmentAt: 2)
        tipControl.setTitle(tipThreeValue, forSegmentAt: 3)
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("main view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("main view will disappear")
        
        //Access UserDefaults
        let defaults = UserDefaults.standard
        
        let originalTipOne = tipControl.titleForSegment(at: 1)
        let originalTipTwo = tipControl.titleForSegment(at: 2)
        let originalTipThree = tipControl.titleForSegment(at: 3)

        // Set an Integer value for some key.
        defaults.set(originalTipOne, forKey: "saveTipOne")
        defaults.set(originalTipTwo, forKey: "saveTipTwo")
        defaults.set(originalTipThree, forKey: "saveTipThree")

        // Force UserDefaults to save.
        defaults.synchronize()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("main view did disappear")
    }

}

