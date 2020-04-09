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
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonMultiplication: UIButton!
    @IBOutlet weak var buttonDivision: UIButton!
    @IBOutlet weak var buttonEqual: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonAC: UIButton!
    var provisionalNumber = String()//現在の数字の格納変数計算時にInt型にする
    var sample:Double! = nil//計算結果の格納変数
    var formula = String()//1つ手前までの計算式の格納変数。Clearのために使う
    var OperationSymbol = String() //演算記号の条件に使う
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //ラベルにボタンの数字と記号を反映させる
    @IBAction func PushButton0(_ sender: Any) {
        if  provisionalNumber != ""{//最初に0は使えないようにする
        calculator.text = "\(calculator.text!)" + "0"
            provisionalNumber += "0"
            
        }
    }
    
    @IBAction func PushButton1(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "1"
            provisionalNumber += "1"
    }
    
    @IBAction func PushButton2(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "2"
        provisionalNumber += "2"
    }
    @IBAction func PushButton3(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "3"
        provisionalNumber += "3"
    }
    @IBAction func PushButton4(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "4"
        provisionalNumber += "4"
    }
    @IBAction func PushButton5(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "5"
        provisionalNumber += "5"
    }
    @IBAction func PushButton6(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "6"
        provisionalNumber += "6"
    }
    @IBAction func PushButton7(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "7"
        provisionalNumber += "7"
    }
    @IBAction func PushButton8(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "8"
        provisionalNumber += "8"
    }
    @IBAction func PushButton9(_ sender: Any) {
        calculator.text = "\(calculator.text!)" + "9"
        provisionalNumber += "9"
    }
    
    
    
    //実際に計算する
    @IBAction func PushButtonPlus(_ sender: Any) {
        if provisionalNumber != "" {//数字が入力されているときに動作する
            if sample == nil {//一番最初は元となるSampleに格納する
                sample = Double(provisionalNumber)!
            }else if OperationSymbol == "Plus"{//一つ前の演算記号ボタンがプラスの時
            sample = sample + Double(provisionalNumber)!//入力した数字を今までの数字の合計と足す
            
            }else if OperationSymbol == "Minus"{
                sample = sample - Double(provisionalNumber)!//入力した数字を今までの数字の合計とひく
            }else if OperationSymbol == "Multiplication"{
                sample = sample * Double(provisionalNumber)!//入力した数字を今までの数字の合計とかける
            }else if OperationSymbol == "Division"{
                sample = sample / Double(provisionalNumber)!//入力した数字を今までの数字の合計と割る

            }
            provisionalNumber = ""//リセットする
            calculator.text = String(sample)
            calculator.text = "\(calculator.text!)" + "+"//ラベルにプラスの記号を表示する
            formula = calculator.text!//これまでの計算式を保存しておく
            OperationSymbol = "Plus"
        }
        
    }
    @IBAction func PushButtonMinus(_ sender: Any) {
        if provisionalNumber != "" {//数字が入力されているときに動作する
        if sample == nil {//一番最初は元となるSampleに格納する
            sample = Double(provisionalNumber)!
        }else if OperationSymbol == "Plus"{//一つ前の演算記号ボタンがプラスの時
        sample = sample + Double(provisionalNumber)!//入力した数字を今までの数字の合計と足す
        }else if OperationSymbol == "Minus"{
            sample = sample - Double(provisionalNumber)!//入力した数字を今までの数字の合計とひく
        }else if OperationSymbol == "Multiplication"{
            sample = sample * Double(provisionalNumber)!//入力した数字を今までの数字の合計とかける
        }else if OperationSymbol == "Division"{
            sample = sample / Double(provisionalNumber)!//入力した数字を今までの数字の合計と割る
        }
            provisionalNumber = ""//リセットする
            calculator.text = String(sample)
            calculator.text = "\(calculator.text!)" + "-"//ラベルに-の記号を表示する
            formula = calculator.text!//これまでの計算式を保存しておく
            OperationSymbol = "Minus"
        }
    }
    @IBAction func PushButtonMultiplication(_ sender: Any) {
        if provisionalNumber != "" {//数字が入力されているときに動作する
        if sample == nil {//一番最初は元となるSampleに格納する
            sample = Double(provisionalNumber)!
            provisionalNumber = ""//リセットする
            calculator.text = "\(calculator.text!)" + "+"//ラベルにプラスの記号を表示する
        }else if OperationSymbol == "Plus"{//一つ前の演算記号ボタンがプラスの時
        sample = sample + Double(provisionalNumber)!//入力した数字を今までの数字の合計と足す
        }else if OperationSymbol == "Minus"{
            sample = sample - Double(provisionalNumber)!//入力した数字を今までの数字の合計とひく
        }else if OperationSymbol == "Multiplication"{
            sample = sample * Double(provisionalNumber)!//入力した数字を今までの数字の合計とかけるる
        }else if OperationSymbol == "Division"{
            sample = sample / Double(provisionalNumber)!//入力した数字を今までの数字の合計と割る
        }
            provisionalNumber = ""//リセットする
            calculator.text = String(sample)
            calculator.text = "\(calculator.text!)" + "×"//ラベルに×の記号を表示する
            formula = calculator.text!//これまでの計算式を保存しておく
            OperationSymbol = "Multiplication"
        }
    }
    @IBAction func PushButtonDivision(_ sender: Any) {
        if provisionalNumber != "" {//数字が入力されているときに動作する
        if sample == nil {//一番最初は元となるSampleに格納する
            sample = Double(provisionalNumber)!
        }else if OperationSymbol == "Plus"{//一つ前の演算記号ボタンがプラスの時
        sample = sample + Double(provisionalNumber)!//入力した数字を今までの数字の合計と足す
        }else if OperationSymbol == "Minus"{
            sample = sample - Double(provisionalNumber)!//入力した数字を今までの数字の合計とひく
        }else if OperationSymbol == "Multiplication"{
            sample = sample * Double(provisionalNumber)!//入力した数字を今までの数字の合計とかける
        }else if OperationSymbol == "Division"{
            sample = sample / Double(provisionalNumber)!//入力した数字を今までの数字の合計と割る
        }
            provisionalNumber = ""//リセットする
            calculator.text = String(sample)
            calculator.text = "\(calculator.text!)" + "÷"//ラベルに÷の記号を表示する
            formula = calculator.text!//これまでの計算式を保存しておく
            OperationSymbol = "Division"
        }
    }
    
//結果を表示する
    @IBAction func PushButtonEqual(_ sender: Any) {
        if sample != nil {
            if provisionalNumber != ""{//数字が入力されているときに動作する
            if OperationSymbol == "Plus"{//一つ前の演算記号ボタンがプラスの時
                sample = sample + Double(provisionalNumber)!//入力した数字を今までの数字の合計と足す
                
            }else if OperationSymbol == "Minus"{
                sample = sample - Double(provisionalNumber)!//入力した数字を今までの数字の合計とひく
                
            }else if OperationSymbol == "Multiplication"{
                sample = sample * Double(provisionalNumber)!//入力した数字を今までの数字の合計とかける
                
            }else if OperationSymbol == "Division"{
            sample = sample / Double(provisionalNumber)!//入力した数字を今までの数字の合計と割る
        }
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
            buttonMinus.isHidden = true
            buttonMultiplication.isHidden = true
            buttonDivision.isHidden = true
            buttonEqual.isHidden = true
            buttonC.isHidden = true
            
            provisionalNumber = ""//リセットする
            OperationSymbol = ""
            sample = nil
            formula = ""
                
            }
        }
    }
    @IBAction func PushButtonClear(_ sender: Any) {//入力中の数字をリセットする
            calculator.text = formula//保存しておいた計算式を取り出す
            provisionalNumber = ""//リセットする
    }
    
    @IBAction func PushButtonAllClear(_ sender: Any) {//全てリセットする
        calculator.text = ""
        provisionalNumber = ""
        sample = nil
        formula = ""
        OperationSymbol = ""
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
            buttonMinus.isHidden = false
            buttonMultiplication.isHidden = false
            buttonDivision.isHidden = false
            buttonEqual.isHidden = false
            buttonC.isHidden = false
        }
    }
}

