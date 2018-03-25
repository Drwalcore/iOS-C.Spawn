import UIKit

class Circle: UIView {

    let size: CGFloat = 100

    init(withX: CGFloat, withY: CGFloat) {
        let customFrame = CGRect(x: withX, y: withY, width: size, height: size)
        super.init(frame: customFrame)

        setupView()
    }

    private func setupView() {
        backgroundColor = UIColor.randomBrightColor()
        layer.cornerRadius = size/2
        alpha = 0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
