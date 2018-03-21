import UIKit

class ViewController: UIViewController {

    private let mainView = MainView()
    private let kNumbersOfTapRequired = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView

    }

    override func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: view, action: #selector(doubleTapped))
        doubleTapGestureRecognizer.numberOfTapsRequired = kNumbersOfTapRequired
        self.addGestureRecognizer(doubleTapGestureRecognizer)
    }

    @objc
    func doubleTapped(sender: UITapGestureRecognizer) {
        print("tapCheck")
    }

}
