//
//  ViewController.swift
//  QandA
//
//  Created by Tim Syu on 2018/12/3.
//  Copyright © 2018 Tim Syu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct QA{
        var image: String
        var choice: [String]
        var answer: Int
    }
    var num = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    var quesCount = 0
    var correctAnswer = 0
    var score = 0
    
    var question = [
        QA(image: "1.jpg", choice: ["郭采潔","利菁", "曲家瑞", "苗可麗"], answer: 4),
        QA(image: "2.jpg", choice: ["蕭亞軒", "溫嵐", "利菁", "楊瑾華"], answer: 2),
        QA(image: "3.jpg", choice: ["愛莉泱泱", "愛莉莎莎", "莎莉泱泱", "泱泱"], answer: 2),
        QA(image: "4.jpg", choice: ["夏于喬","宋芸樺", "王瞳", "以上皆非"], answer: 1),
        QA(image: "5.jpg", choice: ["陳信宏","胡瓜","胡自雄","胡志強"], answer: 1),
        QA(image: "6.jpg", choice: ["冠佑","品冠","星野源","劉在鎴"], answer: 1),
        QA(image: "7.jpg", choice: ["展榮","展瑞","展開","展元"], answer: 2),
        QA(image: "8.jpg", choice: ["郭彥均","郭彥輔","郭彥甫","郭彥鈞"], answer: 1),
        QA(image: "9.jpg", choice: ["空心菜", "菠菜","A菜","大陸妹"], answer: 2),
        QA(image: "10.jpg", choice: ["毛澤東", "毛澤西", "毛澤南", "毛澤北"], answer: 1),
        QA(image: "11.jpg", choice: ["丘逢甲", "丘逢乙", "丘逢丙", "丘逢丁"], answer: 1),
        QA(image: "12.jpg", choice: ["鈕承澤","屈中恆","宋少卿","以上皆非"], answer: 3),
        QA(image: "13.jpg", choice: ["董至成","草間彌生","菜頭","以上皆非"], answer: 1),
        QA(image: "14.jpg", choice: ["廖添甲","廖添乙","廖添丙","廖添丁"], answer: 4),
        QA(image: "15.jpg", choice: ["霍元甲","霍元乙","霍元丙","霍元丁"], answer: 1),
        QA(image: "16.jpg", choice: ["蘇西坡","蘇東坡","蘇南坡","蘇北坡"], answer: 2)
    ]
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet var questionChoices: [UIButton]!
    @IBOutlet weak var scoreLab: UILabel!
    @IBOutlet weak var questionNum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scoreLab.text = "你得到了\(String(score))分"
        show()
    }
    @IBAction func pressesChoice(_ sender: UIButton) {
        print (sender.tag)
        if sender.tag == correctAnswer{
            score = score + 10
            scoreLab.text = "你得到了\(String(score))分"
        }
        if quesCount == 10{
            alert()
        }
        else{
            show()
        }
    }
    @IBAction func pressesRestart(_ sender: UIButton) {
        initialize()
        show()
    }
    
    func show(){
        quesCount = quesCount + 1
        let randomNum = Int(arc4random_uniform(UInt32(num.count)))
        let value = num[randomNum]
        questionImage.image = UIImage(named: question[value].image)
        questionNum.text = "Question \(String(quesCount))"
        correctAnswer = question[value].answer
        print(correctAnswer)
        var Index = 0
        for i in 0..<questionChoices.count{
            questionChoices[i].setTitle(question[value].choice[Index], for: .normal)
            Index = Index + 1
        }
        num.remove(at: randomNum)
    }
    func initialize() {
        
        num = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
        quesCount = 0
        score = 0
        scoreLab.text = "你得到了\(String(score))分"
    }
    func alert(){
        let alertController = UIAlertController(
            title: "猜猜結束", message: "你得到了 \(score) 分", preferredStyle: .alert)
        
        let okAction = UIAlertAction(
            title: "確認", style: .default,
            handler:{
                (action: UIAlertAction!) -> Void in
        })
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

