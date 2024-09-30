//
//  ViewController.swift
//  AddOne
//
//  Created by Bhattarai, Diya on 12/5/23.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var bg: UIImageView!
    //var image = UIImageView()
    let screenBounds: CGRect = UIScreen.main.bounds
    
    @IBOutlet var scoreLab: UILabel!
    
    @IBOutlet var score: UIImageView!
    @IBOutlet var timeLab: UILabel!
    @IBOutlet var time: UIImageView!
    @IBOutlet var number: UIImageView!
    @IBOutlet var numLab: UILabel!
    @IBOutlet var field: UITextField!
    var s = 0;
    var timer = Timer()
    var timeNum = 0;
    var t = 10;
    var r = 0;
    var timeInt = "";
    var done  = false;

    var n = 0;
    var user = 0;
    var fixText = 0;
    override func viewDidLoad()
    {
        scoreLab.text = "\(s)"
        randomNum()
        //timeInt = "0\(t):\(timeNum)\(r)"
        timeLab.text = "00:10"
        
        
        //timeNum = 60
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func randomNum()
    {
        var x = String(Int.random(in: 0...9))
        x += String(Int.random(in: 0...9))
        x += String(Int.random(in: 0...9))
        x += String(Int.random(in: 0...9))
        numLab.text = x;
        n = Int(x)!
    }
    @IBAction func clicked(_ sender: Any)
    {
        if (!timer.isValid && !done)
        {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,selector: #selector(timerFunction), userInfo: nil, repeats:true)
        }
    }
    @objc func timerFunction()
    {
        
        t -= 1
        timeLab.text = "00:\(t)"
        if(t == 0){
            timer.invalidate()
            let alert = UIAlertController(title: "Game Over", message: "Score : \(s) ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { action in
                self.setUp();
            }))
            alert.addAction(UIAlertAction(title: "done", style: .destructive, handler: { action in
                exit(0)
            }))
            self.present(alert, animated: true, completion: nil)
            
            
            
            
        }
    }
    
    @IBAction func type(_ sender: UITextView)
    {
        guard let text = sender.text else {return}
        guard text.count == 4 else { return }
        guard let num = Int(text) else
        {
            
            print("no")
            return;
        }
        if(check(num))
        {
            s = s + 1
            
        }
        else
        {
            s = s - 1
        }
        scoreLab.text = "\(s)"
        new();
        //print(n)
        //fixText = Double(text) ?? 0;
        //field.text = "\(String(format: ".", text))"
        //print(field.text)
    }
    
    func check(_ key : Int) -> Bool
    {
        var x : String = String((n % 10) + 1)
        print(x)
        n = n/10;
        var insert : String = String(n % 10 + 1)
        if(Int(insert) == 10)
        {
            insert = String(0);
        }
        x.insert(insert.first!, at: x.startIndex)
        n = n/10
        
        insert = String(n % 10 + 1)
        if(Int(insert) == 10)
        {
            insert = String(0)
        }
        x.insert(insert.first!, at: x.startIndex)
        n = n/10
        
        insert = String(n % 10 + 1)
        if(Int(insert) == 10)
        {
            insert = String(0)
        }
        x.insert(insert.first!, at: x.startIndex)
        n = n/10
        //print(n)
        
        return Int(x) == key
    }
    func new()
    {
        scoreLab.text = "\(s)"
        field.text = ""
        randomNum()
    }
    func setUp()
    {
        s = 0;
        t = 10;
        //r = 0;
        
        timeLab.text = "00:10"
        
        new()
    }
    
    
}




