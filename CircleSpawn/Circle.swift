import UIKit

class Circle: UIView {

    let size: CGFloat = 100

    init() {
        let customFrame = CGRect(origin: .zero, size: CGSize(width: size, height: size))
        super.init(frame: customFrame)
        setupView()
    }

    private func setupView() {
        backgroundColor = UIColor.randomBrightColor()
        layer.cornerRadius = size/2
        alpha = 1

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
