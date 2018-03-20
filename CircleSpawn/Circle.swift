import UIKit

class Circle: UIView {

    let size: CGFloat = 100

    init() {
        let customFrame = CGRect(x: 0, y: 0, width: size, height: size)
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

extension CGFloat {
    static func random() -> CGFloat {
        return random(min: 0.0, max: 1.0)
    }

    static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        assert(max > min)
        return min + ((max - min) * CGFloat(arc4random()) / CGFloat(UInt32.max))
    }
}

extension UIColor {
    static func randomBrightColor() -> UIColor {
        return UIColor(hue: .random(),
                       saturation: .random(min: 0.5, max: 1.0),
                       brightness: .random(min: 0.7, max: 1.0),
                       alpha: 1.0)
    }
}
