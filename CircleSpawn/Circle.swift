import UIKit

class Circle: UIView {

    private let kSize: CGFloat = 100
    private let kInitialAlpha: CGFloat = 0

    init() {
        let customFrame = CGRect(origin: .zero, size: CGSize(width: kSize, height: kSize))
        super.init(frame: customFrame)
        setupView()
        addInitialAnimation()
    }

    private func setupView() {
        backgroundColor = UIColor.randomBrightColor()
        layer.cornerRadius = kSize/2
        alpha = kInitialAlpha
    }

    private func addInitialAnimation() {
        transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        let creationAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: { [weak self] in
            self?.alpha = 0.95
            self?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        creationAnimator.startAnimation()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
