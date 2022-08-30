import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelWhite: UILabel!
    @IBOutlet weak var labelBlack: UILabel!
    @IBOutlet weak var labelWhiteTime: UILabel!
    @IBOutlet weak var labelBlackTime: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    
    
    var countWhite: Double = 300.0
    var countBlack: Double = 300.0
    var isWhite: Bool? = false
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
        } else {
            isWhite = true
        }
        
        updateColor()
        
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
            labelWhiteTime.text = formatter.string(from: countWhite)
        } else {
            countBlack -= 1
            labelBlackTime.text = formatter.string(from: countBlack)
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
        whitesTurn()
        isWhite = false
        countWhite = 300.0
        countBlack = 300.0
        formatter.allowedUnits = [.minute, .second]
        labelWhiteTime.text = timeFormatter(count: countWhite)
        labelBlackTime.text = timeFormatter(count: countBlack)
    }
    
    func whitesTurn() {
        view.backgroundColor = UIColor.white
        labelWhite.textColor = UIColor.black
        labelBlack.textColor = UIColor.black
        labelWhiteTime.textColor = UIColor.black
        labelBlackTime.textColor = UIColor.black
        btnPlay.setTitleColor(UIColor.white, for: .normal)
        btnPlay.backgroundColor = UIColor.black
        btnReset.setTitleColor(UIColor.white, for: .normal)
        btnReset.backgroundColor = UIColor.black
    }
    
    func blacksTurn() {
        view.backgroundColor = UIColor.black
        labelWhite.textColor = UIColor.white
        labelBlack.textColor = UIColor.white
        labelWhiteTime.textColor = UIColor.white
        labelBlackTime.textColor = UIColor.white
        btnPlay.setTitleColor(UIColor.black, for: .normal)
        btnPlay.backgroundColor = UIColor.white
        btnReset.setTitleColor(UIColor.black, for: .normal)
        btnReset.backgroundColor = UIColor.white
    }
    
    func updateColor() {
        if(isWhite ?? false) {
            whitesTurn()
        } else {
            blacksTurn()
        }
    }
    
    func endGame() {
        timer?.invalidate()
        btnPlay.setTitle("Play again", for: .normal)
    }
}

