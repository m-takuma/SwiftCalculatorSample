import UIKit

class ViewController2: UIViewController {
    var CAL = CalculatorModel()
    override func viewDidLoad() {
        CAL.BunttonModel()
        let ButtonArray = CAL.ButtonArray
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
            switch i {
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
                print("該当するcaseなし")
            }
            switch i {
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
            case 9:
                 ButtonArray[i].setTitle("-", for: .normal)
            case 11:
                 ButtonArray[i].setTitle("×", for: .normal)
            case 15:
                 ButtonArray[i].setTitle("÷", for: .normal)
            default:
                print("該当するcaseなし")
            }
        }
        
        
        
        
        super.viewDidLoad()
        for i in 0..<20 {
            view.addSubview(ButtonArray[i])
            print(i)
        }
        print("開始しました")
    }
}
    

