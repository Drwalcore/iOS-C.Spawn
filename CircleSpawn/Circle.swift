import UIKit

class Circle: UIView {

    let size: CGFloat = 100

    init(withX: CGFloat, withY: CGFloat) {
        let customFrame = CGRect(x: withX, y: withY, width: size, height: size)
        super.init(frame: customFrame)

        setRandomColor()
        setRoundness()
    }

    private func setRandomColor() {
        backgroundColor = UIColor.randomBrightColor()
    }

    private func setRoundness() {
        layer.cornerRadius = size/2
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
