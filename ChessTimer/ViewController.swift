import UIKit

class ViewController: UIViewController {
    
    var oneMinToTimerSegue: String = "1MinToTimerSegue"
    var threeMinToTimerSegue: String = "3MinToTimerSegue"
    var fiveMinToTimerSegue: String = "5MinToTimerSegue"
    var tenMinToTimerSegue: String = "10MinToTimerSegue"
    var twentyMinToTimerSegue: String = "20MinToTimerSegue"
    var thirtyMinToTimerSegue: String = "30MinToTimerSegue"
    
    var count: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func onPress1Min(_ sender: Any) {
        performSegue(withIdentifier: oneMinToTimerSegue, sender: self)
    }
    
    @IBAction func onPress3Min(_ sender: Any) {
        performSegue(withIdentifier: threeMinToTimerSegue, sender: self)
    }
    
    @IBAction func onPress5Min(_ sender: Any) {
        performSegue(withIdentifier: fiveMinToTimerSegue, sender: self)
    }
    
    @IBAction func onPress10Min(_ sender: Any) {
        performSegue(withIdentifier: tenMinToTimerSegue, sender: self)
    }
    
    @IBAction func onPress20Min(_ sender: Any) {
        performSegue(withIdentifier: twentyMinToTimerSegue, sender: self)
    }
    
    @IBAction func onPress30Min(_ sender: Any) {
        performSegue(withIdentifier: thirtyMinToTimerSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TimerViewController
        switch segue.identifier {
        case oneMinToTimerSegue:
            destinationVC.receivingCount = 60.0
        case threeMinToTimerSegue:
            destinationVC.receivingCount = 180.0
        case fiveMinToTimerSegue:
            destinationVC.receivingCount = 300.0
        case tenMinToTimerSegue:
            destinationVC.receivingCount = 600.0
        case twentyMinToTimerSegue:
            destinationVC.receivingCount = 1200.0
        case thirtyMinToTimerSegue:
            destinationVC.receivingCount = 1800.0
        default: break
        }
    }
}

