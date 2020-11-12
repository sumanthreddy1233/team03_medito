//
//  ViewController.swift
//  Medito
//
//  Created by Student on 11/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var coverImg: UIImageView!
    @IBOutlet weak var minTimeLbl: NSLayoutConstraint!
    @IBOutlet weak var maxTimeLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var status = 0

    @IBAction func play(_ sender: Any) {
        if(status == 0){
            self.playAudio()
            self.status = 1
            self.playBtn.setImage(UIImage(named: "rounded-pause-button.png"), for: .normal)
        }else{
            self.pauseAudio()
               self.status = 0
               self.playBtn.setImage(UIImage(named: "play-button.png"), for: .normal)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setSession()
        
         coverImg.layer.shadowColor = UIColor.gray.cgColor
         coverImg.layer.shadowOpacity = 2.0
         coverImg.layer.shadowOffset = CGSize.zero
         coverImg.layer.shadowRadius = 20
         coverImg.layer.masksToBounds = false
         coverImg.layer.cornerRadius = 15
        self.timeSlider.setThumbImage(UIImage(named: "slider-circle.png")!, for: .normal)
        
        var Time = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimeSlider), userInfo: nil, repeats: true)
        
        UIApplication.shared.beginReceivingRemoteControlEvents()
        becomeFirstResponder()
        do {
            let audioPath = Bundle.main.path(forResource: "song", ofType: "mp3")
            try
                player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        
        }catch{
            print(error,"Errorr")
        }
       
          self.timeSlider.maximumValue = Float(player.duration)
          self.volumeSlider.maximumValue = Float(player.volume)
          self.volumeSlider.value = self.volumeSlider.maximumValue
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        
        let formattedString = formatter.string(from: player.duration)!
        self.maxTimeLbl.text =  formattedString
        self.minTimeLbl.text = "0:00"
    }
    
    
}

