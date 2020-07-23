//
//  ViewController.swift
//  aliceChaseRabbit
//
//  Created by 方芸萱 on 2020/7/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var landScape: UIImageView!
    @IBOutlet weak var hunter: UIImageView!
    @IBOutlet weak var prey: UIImageView!
    @IBOutlet weak var uncatch: UILabel!
    @IBOutlet weak var catched: UILabel!
    let hunterGroup = ["愛麗絲", "湯姆貓", "巧虎", "呂布"]
    var pickHunter = 0
    let preyGroup = ["兔子", "傑利鼠", "桃樂比", "赤兔馬"]
    var pickPrey = 0
    let dinnerGroup = ["燉兔肉", "鼠條", "串鳥燒", "馬來糕"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func landScapeSelect(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            landScape.image = UIImage(named: "rome")
        }else if sender.selectedSegmentIndex == 1{
            landScape.image = UIImage(named: "pyramid")
        }else{
            landScape.image = UIImage(named: "castle")
        }
    }

    @IBAction func chase(_ sender: UISlider) {
        let distance = Int((sender.value))
        //distance
        hunter.frame.origin = CGPoint(x: 40+12*distance, y: 320+1*distance)
        prey.frame.origin = CGPoint(x: 210+5*distance, y: 355+1*distance)
        //alpha
        hunter.alpha = CGFloat(sender.value)/10
        prey.alpha = CGFloat(sender.value)/10
        //height
        hunter.frame.size = CGSize(width: 63, height: 74+Int(Double(distance)*1.5))
        prey.frame.size = CGSize(width: 45, height: 62+Int(distance/4))
        if Int(sender.value) == Int(sender.maximumValue){
            catched.isHidden = false
            uncatch.isHidden = true
        }else{
            catched.isHidden = true
            uncatch.isHidden = false
        }
    }
    @IBAction func changeHunter(_ sender: Any) {
        var randomItem = 0
        repeat{
            randomItem = Int(arc4random_uniform(UInt32(hunterGroup.count)))
        }while(pickHunter == randomItem)
        pickHunter = randomItem
        hunter.image = UIImage(named: hunterGroup[pickHunter])
    }
    @IBAction func changePrey(_ sender: Any) {
        var randomItem = 0
        repeat{
            randomItem = Int(arc4random_uniform(UInt32(preyGroup.count)))
        }while(pickPrey == randomItem)
        pickPrey = randomItem
        prey.image = UIImage(named: preyGroup[pickPrey])
        catched.text = "耶~今晚吃\(dinnerGroup[pickPrey])"
        uncatch.text = "\(preyGroup[pickPrey])~~別跑啊~~"
    }
}

