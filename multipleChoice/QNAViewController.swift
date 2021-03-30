//
//  QNAViewController.swift
//  multipleChoice
//
//  Created by Ryan Chang on 2021/3/27.
//

import UIKit
var timer = Timer()



class QNAViewController: UIViewController {

    //所有的IBOutlet
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var selectionImageView: UIImageView!
    @IBOutlet weak var rightorwrong: UIImageView!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet weak var countLabel: UILabel!

    //要把分數傳到第二個view，所以使用IBSegueAction
    @IBSegueAction func finalscore(_ coder: NSCoder) -> scoreViewController? {
        let controller = scoreViewController(coder: coder)
        controller?.scores = score
        return controller
    }
    
    //問題集使用陣列儲存
    var q = [questions]()
    var i = 0
    var count = 1
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //在viewDidLoad裡面宣告所有的題目
        let q1 = questions(question: "Q1",selection: "Q1.a1" ,option: ["仍應停於Ａ區，讓行人優先通過","可向前騎入Ｂ區，並連續按鳴喇吧，催促行人","應直接繞過行人，前行通過入口"], answer: 1)
        let q2 = questions(question: "Q2", selection: "Q2.a2", option: ["A>B>C","C>B>A","B>C>A"], answer: 2)
        let q3 = questions(question: "Q3", selection: "Q3.a1", option: ["Ｂ車先行","Ａ車先行","搶先者即可先行"], answer: 1)
        let q4 = questions(question: "Q4", selection: "Q4.a2", option: ["幹道車應讓支道車先行","支道車應讓幹道車先行","因為汽車車速比較快"], answer: 2)
        let q5 = questions(question: "Q5", selection: "Q5.a2?", option: ["不可以","可以，但只能自前方車輛的右側超車","可以，只要小心通過就好"], answer: 2)
        let q6 =  questions(question: "Q6", selection: "Q6.a2", option: ["輪胎規格尺寸的記號","尋找『輪胎胎面磨耗只是平台』位置的導引記號","輪胎胎面寬度的記號"], answer: 2)
        let q7 = questions(question: "Q7", selection: "Q7.a1", option: ["A","B","C"], answer: 1)
        let q8 = questions(question: "Q8", selection: "Q8.a3", option: ["急加速","急減速","保持適當速度"], answer: 3)
        let q9 = questions(question: "Q9", selection: "Q9.a1", option: ["應先暫停並左右擺頭查看，等汽車通過後再繼續通行","應減速慢行，查看無其他來車後通行","不需理會標線，之需鳴按喇叭加速通過即可"], answer: 1)
        let q10 = questions(question: "Q10", selection: "Q10.a2", option: ["人車稀少，可以騎快車","依速限行駛，注意脧手標誌，並開亮頭燈","路燈照明設備良好，可以不用開頭燈"], answer: 2)
        let q11 = questions(question: "Q11", selection: "Q11.a2", option: ["對於闖紅燈之救護車，可不必避讓","不論號誌為何，應立即必讓優先通行","加速離開，以避免阻擋救護車執行任務"], answer: 2)
        let q12 = questions(question: "Q12", selection: "Q12.a1", option: ["A","B","C"], answer: 1)
        let q13 = questions(question: "Q13", selection: "Q13.a3", option: ["A  ","B","C"], answer: 3)
        let q14 = questions(question: "Q15", selection: "Q15.a1", option: ["A","B","C"], answer: 1)

        //依序加入陣列
        q.append(q1)
        q.append(q2)
        q.append(q3)
        q.append(q4)
        q.append(q5)
        q.append(q6)
        q.append(q7)
        q.append(q8)
        q.append(q9)
        q.append(q10)
        q.append(q11)
        q.append(q12)
        q.append(q13)
        q.append(q14)

        //打亂問題集裡面的排序
        q.shuffle()

        startGame()
    }
    
    //把問題依序丟進去題目裡面
    func startGame() {
        countLabel.text = "\(count)/10"
        questionImageView.image = UIImage(named: q[i].question)
        selectionImageView.image = UIImage(named: q[i].selection)
        //依序把選項放進去
        for x in 0...2{
            answerButtons[x].setTitle(q[i].option[x], for: UIControl.State.normal)
        }
    }
    
    //按鈕選擇
    @IBAction func choiceButton(_ sender: UIButton) {
        //用sender 來判斷跟答案是否相符，下次改版應該會使用每個按鈕的tag來識別
        if answerButtons.firstIndex(of: sender) ?? 0 + 1 == q[i].answer - 1 {
            rightorwrong.image = UIImage(named: "correct")
            score += 10
        }else {
            rightorwrong.image = UIImage(named: "wrong")
        }
        count += 1
        i += 1
        if count == 11 {
            //如果答題回答完10題之後，會使用performSegue把資料傳到另一個view
            performSegue(withIdentifier: "showScore", sender: nil)
            count = 1
            i = 0
            score = 0
        }else {
        startGame()
        }
    }
    
    //把分數歸零，並重新題目，圖片也清空
    @IBAction func returnBtn(_ sender: UIButton) {
        score = 0
        count = 1
        i = 0
        q.shuffle()
        
        //重新開始，所以清空imageView
        rightorwrong.image = nil
        startGame()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
