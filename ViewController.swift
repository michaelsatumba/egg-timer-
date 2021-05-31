

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
        
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var bar: UIProgressView!
    
    @IBAction func b(_ sender: UIButton) {
        
    
    timer.invalidate()
    let hardness = sender.currentTitle!
   totalTime = eggTimes[hardness]!
        
        bar.progress = 0.0
        secondsPassed = 0
        label.text = hardness
        
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        }
    @objc func update() {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            
            bar.progress = Float(secondsPassed) / Float(totalTime)
        }
       else {
            timer.invalidate()
            label.text = "done"
        
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()

            }
        }

}
