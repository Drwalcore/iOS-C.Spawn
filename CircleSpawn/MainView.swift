import UIKit

class MainView: UIView {

    private let circle: Circle = Circle(withX: 100, withY: 100)

    init() {
        super.init(frame: .zero)
        addSubview(circle)
        backgroundColor = .lightGray
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
