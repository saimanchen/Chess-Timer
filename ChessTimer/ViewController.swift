import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelWhite: UILabel!
    @IBOutlet weak var labelBlack: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    
    var countWhite: Double = 300.0
    var countBlack: Double = 300.0
    var isWhite: Bool? = false
    var isBlack: Bool? = true
    var formatter = DateComponentsFormatter()
    var timer: Timer? = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetLabels()
    }

    @IBAction func onPressPlay(_ sender: Any) {
        
        if(btnPlay.titleLabel?.text == "Play again") {
            resetLabels()
        }
        
        timer?.invalidate()
        btnPlay.setTitle("Switch", for: .normal)
        
        // toggles whose turn it is
        if(isWhite ?? false) {
            isWhite = false
            isBlack = true
        } else {
            isWhite = true
            isBlack = false
        }
        
        if(isWhite ?? false) {
            startTimer(count: countWhite)
        } else {
            startTimer(count: countBlack)
        }
    }
    
    @IBAction func onPressReset(_ sender: Any) {
        timer?.invalidate()
        btnPlay.setTitle("Play", for: .normal)
        resetLabels()
    }
    
    func startTimer(count: Double?) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: countDown(timer:))
    }
    
    func countDown(timer: Timer?) {
        if(isWhite ?? false) {
            countWhite -= 1
            labelWhite.text = formatter.string(from: countWhite)
        } else {
            countBlack -= 1
            labelBlack.text = formatter.string(from: countBlack)
        }
        
        if(countWhite == 0 || countBlack == 0) {
            endGame()
        }
    }
    
    func timeFormatter(count: Double) -> String {
        guard let timeLeft = formatter.string(from: TimeInterval(count)) else { return "" }
        
        return timeLeft
    }
    
    func resetLabels() {
        isWhite = false
        isBlack = true
        countWhite = 300.0
        countBlack = 300.0
        formatter.allowedUnits = [.minute, .second]
        labelWhite.text = timeFormatter(count: countWhite)
        labelBlack.text = timeFormatter(count: countBlack)
    }
    
    func endGame() {
        timer?.invalidate()
        btnPlay.setTitle("Play again", for: .normal)
    }
}

