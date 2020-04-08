import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculator: UILabel!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonEqual: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonAC: UIButton!
    var gg = String()//現在の数字の格納変数計算時にInt型にする
    var sample = Int()//計算結果の格納変数
    var x = String()//1つ手前までの計算式の格納変数。Clearのために使う
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //ラベルにボタンの数字と記号を反映させる
    @IBAction func PushButton0(_ sender: Any) {
        if gg == ""{//最初に0は使えないようにする
        }else{
            calculator.text = "\(calculator.text!)" + "0"
            gg += "0"
        }
    }
    @IBAction func PushButton1(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "1"
            gg += "1"
    }
    
    @IBAction func PushButton2(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "2"
        gg += "2"
    }
    @IBAction func PushButton3(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "3"
        gg += "3"
    }
    @IBAction func PushButton4(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "4"
        gg += "4"
    }
    @IBAction func PushButton5(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "5"
        gg += "5"
    }
    @IBAction func PushButton6(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "6"
        gg += "6"
    }
    @IBAction func PushButton7(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "7"
        gg += "7"
    }
    @IBAction func PushButton8(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "8"
        gg += "8"
    }
    @IBAction func PushButton9(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "9"
        gg += "9"
    }
    
    
    
    //実際に計算する
    @IBAction func PushButtonPlus(_ sender: Any) {
        if gg != "" {//数字が入力されているときに動作する
            sample = sample + Int(gg)!//入力した数字を今までの数字の合計と足す
            gg = ""//リセットする
            calculator.text = "\(calculator.text!)" + "+"//ラベルにプラスの記号を表示する
            x = calculator.text!//これまでの計算式を保存しておく
        }
        
    }
    
//結果を表示する
    @IBAction func PushButtonEqual(_ sender: Any) {
        if gg != "" {
            sample = sample + Int(gg)!//足す
            calculator.text = String(sample)//計算結果を表示する
            button0.isHidden = true//AC以外のボタンを押せなくする
            button1.isHidden = true
            button2.isHidden = true
            button2.isHidden = true
            button3.isHidden = true
            button4.isHidden = true
            button5.isHidden = true
            button6.isHidden = true
            button7.isHidden = true
            button8.isHidden = true
            button9.isHidden = true
            buttonPlus.isHidden = true
            buttonEqual.isHidden = true
            buttonC.isHidden = true
        }
    }
    @IBAction func PushButtonClear(_ sender: Any) {//入力中の数字をリセットする
            calculator.text = x//保存しておいた計算式を取り出す
            gg = ""//リセットする
    }
    
    @IBAction func PushButtonAllClear(_ sender: Any) {//全てリセットする
            calculator.text = ""
            gg = ""
            sample = 0
        if buttonEqual.isHidden == true {//イコールボタンで押せなくなったボタンを押せるようにする
            button0.isHidden = false
            button1.isHidden = false
            button2.isHidden = false
            button2.isHidden = false
            button3.isHidden = false
            button4.isHidden = false
            button5.isHidden = false
            button6.isHidden = false
            button7.isHidden = false
            button8.isHidden = false
            button9.isHidden = false
            buttonPlus.isHidden = false
            buttonEqual.isHidden = false
            buttonC.isHidden = false
            
        }
    }
}

