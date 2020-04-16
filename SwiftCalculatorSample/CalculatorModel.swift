import UIKit

class CalculatorModel:UIViewController,UITabBarControllerDelegate{
    var ButtonArray = [UIButton]()
    var NumberArray = [Int]()
    func BunttonModel() {
        for i in 1...20 {
            let Button = UIButton()
            Button.tag = i
            Button.backgroundColor = .gray
            ButtonArray.append(Button)
        }
    }
}
