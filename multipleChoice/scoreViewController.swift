//
//  scoreViewController.swift
//  multipleChoice
//
//  Created by Ryan Chang on 2021/3/27.
//

import UIKit

class scoreViewController: UIViewController {

    @IBOutlet weak var showScoreLabel: UILabel!
    @IBOutlet weak var answerImageView: UIImageView!
    
    var scores :Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        showScore()
    }
    
    //判斷分數，並顯示圖片和成績。
    func showScore()  {
        if scores == 100 {
            showScoreLabel.text = "你的分數是\(String(scores))，\n真是太棒了"
            answerImageView.image = UIImage(named: "moto safe drive")
        }else if scores < 100 , scores >= 60 {
            showScoreLabel.text = "你的分數是\(String(scores))，\n有點差強人意..."
            answerImageView.image = UIImage(named: "moto safe drive")
        }else if scores < 60 {
            showScoreLabel.text = "你的分數不值得一提，\n來買雞腿飯的請去對面便當店！！！"
            answerImageView.image = UIImage(named: "license")
        }
        
        
    }

}
