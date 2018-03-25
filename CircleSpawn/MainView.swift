import UIKit

class MainView: UIView {

    let circle: Circle = Circle()

    init() {
        super.init(frame: .zero)
        backgroundColor = .lightGray
        isUserInteractionEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
