import UIKit

class ViewController2: UIViewController {
    var ButtonMol = ButtonModel()
    var VC = ViewController()
    var CalculatorLabel = UILabel()
    var provisionalNumber = String()//現在の数字の格納変数計算時にInt型にする
    var sample:Double! = nil//計算結果の格納変数
    var formula = String()//1つ手前までの計算式の格納変数。Clearのために使う
    var OperationSymbol = String()//演算記号の条件に使う
    var Equal = String()
    
    
    override func viewDidLoad() {
        ButtonMol.BunttonModelBasic()
        let ButtonArray = ButtonMol.ButtonArray
        let frameSizeHeight = view.frame.size.height
        let frameSizeWidth = view.frame.size.width
        let tabBarFrameSizeHeight = tabBarController?.tabBar.frame.size.height
        let ButtonSize = 1 / 5 * frameSizeWidth
        let y = frameSizeHeight - tabBarFrameSizeHeight! - ButtonSize - (frameSizeWidth / 25)
        let x = frameSizeWidth / 25
        
        
        for i in 0..<20 {
            func ButtonInit(Number:Int,xSide:CGFloat,ySide:CGFloat){
                ButtonArray[Number].frame = .init(x: xSide, y:ySide, width: ButtonSize, height: ButtonSize)
            }
            switch i {//配置決め
            case 0...3:
                ButtonInit(Number: i, xSide: CGFloat(i + 1) * x + CGFloat(i) * ButtonSize, ySide: y)
            case 4...7:
                ButtonInit(Number: i, xSide: CGFloat(i % 4 + 1) * x + CGFloat(i % 4) * ButtonSize, ySide: y - x - ButtonSize)
            case 8...11:
                ButtonInit(Number: i, xSide: CGFloat(i % 8 + 1) * x + CGFloat(i % 8) * ButtonSize, ySide: y - 2 * (x + ButtonSize))
            case 12...15:
                ButtonInit(Number: i, xSide: CGFloat(i % 12 + 1) * x + CGFloat(i % 12) * ButtonSize, ySide: y - 3 * (x + ButtonSize))
            case 16...19:
                ButtonInit(Number: i, xSide: CGFloat(i % 16 + 1) * x + CGFloat(i % 16) * ButtonSize, ySide: y - 4 * (x + ButtonSize))
            default:
                print("該当するcaseなし\(i)")
            }
            
            CalculatorLabel.frame = .init(x: x, y: (y - 4 * (x + ButtonSize)) / 2, width: frameSizeWidth - CGFloat(2) * x, height: (y - 4 * (x + ButtonSize)) * 0.4)
            CalculatorLabel.font = .boldSystemFont(ofSize: ((y - 4 * (x + ButtonSize)) * 0.4) / 3)
            CalculatorLabel.backgroundColor = .clear
            CalculatorLabel.numberOfLines = 2
            CalculatorLabel.textAlignment = .right
            CalculatorLabel.text = ""
            
            switch i {//文字盤
            case 0:
                ButtonArray[i].setTitle("\(i)", for: .normal)
            case 4...6:
                let title = i - 3
                ButtonArray[i].setTitle("\(title)", for: .normal)
            case 8...10:
                let title = i - 4
                ButtonArray[i].setTitle("\(title)", for: .normal)
            case 12...14:
                let title = i - 5
                ButtonArray[i].setTitle("\(title)", for: .normal)
            case 1:
                ButtonArray[i].setTitle("C", for: .normal)
            case 2:
                ButtonArray[i].setTitle("AC", for: .normal)
                ButtonArray[i].backgroundColor = .red
            case 3:
                ButtonArray[i].setTitle("=", for: .normal)
            case 7:
                 ButtonArray[i].setTitle("+", for: .normal)
            case 11:
                 ButtonArray[i].setTitle("-", for: .normal)
            case 15:
                 ButtonArray[i].setTitle("×", for: .normal)
            case 19:
                 ButtonArray[i].setTitle("÷", for: .normal)
            default:
                print("該当するcaseなし\(i)")
            }
        }
        super.viewDidLoad()
        for i in 0..<20 {
            view.addSubview(ButtonArray[i])
             ButtonArray[i].addTarget(self, action: #selector(self.tapButton(_ :)), for: .touchUpInside)
        }
        view.addSubview(CalculatorLabel)
        print("開始しました")
    }
    
    
    @objc func tapButton(_ sender: UIButton){
        switch sender.tag {
        case 1:
            if Equal == "Equal"{
                CalculatorLabel.text = ""
                provisionalNumber = ""
                sample = nil
                formula = ""
                OperationSymbol = ""
            }
            if  provisionalNumber != ""{//最初に0は使えないようにする
            CalculatorLabel.text = "\(CalculatorLabel.text!)" + "0"
                provisionalNumber += "0"
            }
        case 5...7:
            if Equal == "Equal"{
                           Equal = ""
                           CalculatorLabel.text = ""
                           provisionalNumber = ""
                           sample = nil
                           formula = ""
                           OperationSymbol = ""
                       }
            let Number = sender.tag - 4
            CalculatorLabel.text = "\(CalculatorLabel.text!)" + "\(Number)"
                       provisionalNumber += "\(Number)"
        case 9...11:
            if Equal == "Equal"{
                Equal = ""
                CalculatorLabel.text = ""
                provisionalNumber = ""
                sample = nil
                formula = ""
                OperationSymbol = ""
                       }
            let Number = sender.tag - 5
            CalculatorLabel.text = "\(CalculatorLabel.text!)" + "\(Number)"
                       provisionalNumber += "\(Number)"
        case 13...15:
            if Equal == "Equal"{
                Equal = ""
                CalculatorLabel.text = ""
                provisionalNumber = ""
                sample = nil
                formula = ""
                OperationSymbol = ""
                   }
            let Number = sender.tag - 6
            CalculatorLabel.text = "\(CalculatorLabel.text!)" + "\(Number)"
                       provisionalNumber += "\(Number)"
        case 2://clear
            CalculatorLabel.text = formula//保存しておいた計算式を取り出す
            provisionalNumber = ""//リセットする
        case 3://allClear
            CalculatorLabel.text = ""
            provisionalNumber = ""
            sample = nil
            formula = ""
            OperationSymbol = ""
        case 4://イコール
            if sample != nil {
                switch OperationSymbol {
                case "Plus":
                    sample = sample + Double(provisionalNumber)!
                case "Minus":
                    sample = sample - Double(provisionalNumber)!
                case "Multiplication":
                    sample = sample * Double(provisionalNumber)!
                case "Division":
                    sample = sample / Double(provisionalNumber)!
                default:
                    print("caseがありません")
                }
                CalculatorLabel.text = String(sample)
                formula = ""
                Equal = "Equal"
            }
        case 8,12,16,20:
            if provisionalNumber != "" {
                if sample == nil{
                    sample = Double(provisionalNumber)!
                }else{
                    if Equal == "Equal"{
                        Equal = ""
                    }else{
                    switch OperationSymbol {
                    case "Plus":
                        sample = sample + Double(provisionalNumber)!
                    case "Minus":
                        sample = sample - Double(provisionalNumber)!
                    case "Multiplication":
                        sample = sample * Double(provisionalNumber)!
                    case "Division":
                        sample = sample / Double(provisionalNumber)!
                    default:
                        print("caseがありません")
                        }
                    }
                }
                CalculatorLabel.text = String(sample)
                switch sender.tag {
                case 8:
                    OperationSymbol = "Plus"
                    CalculatorLabel.text = "\(CalculatorLabel.text!)" + "+"
                case 12:
                    OperationSymbol = "Minus"
                    CalculatorLabel.text = "\(CalculatorLabel.text!)" + "-"
                case 16:
                    OperationSymbol = "Multiplication"
                    CalculatorLabel.text = "\(CalculatorLabel.text!)" + "×"
                case 20:
                    OperationSymbol = "Division"
                    CalculatorLabel.text = "\(CalculatorLabel.text!)" + "÷"
                default:
                    print("エラーです")
                }
                provisionalNumber = ""
                formula = CalculatorLabel.text!
            }else{
                if sample != nil {
                    CalculatorLabel.text = String(sample)
                    switch sender.tag {
                    case 8:
                        OperationSymbol = "Plus"
                        CalculatorLabel.text = "\(CalculatorLabel.text!)" + "+"
                    case 12:
                        OperationSymbol = "Minus"
                        CalculatorLabel.text = "\(CalculatorLabel.text!)" + "-"
                    case 16:
                        OperationSymbol = "Multiplication"
                        CalculatorLabel.text = "\(CalculatorLabel.text!)" + "×"
                    case 20:
                        OperationSymbol = "Division"
                        CalculatorLabel.text = "\(CalculatorLabel.text!)" + "÷"
                    default:
                        print("エラーです")
                    }
                    formula = CalculatorLabel.text!
                }
            }
        default:
            print("caseがありません")
        }
    }
}
    

