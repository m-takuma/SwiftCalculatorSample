import UIKit

class ButtonModel:UIViewController{
    var ButtonArray = [UIButton]()
    var NumberArray = [Int]()
    func BunttonModelBasic() {
        for i in 1...20 {
            let Button = UIButton()
            Button.tag = i
            Button.backgroundColor = .gray
            ButtonArray.append(Button)
        }
    }
    
}
