import UIKit

class GameViewController: UIViewController {

    private let mainView = MainView()
    private let kNumbersOfTapRequired = 2

    override func viewDidLoad() {
        view = mainView
        setupGestureRecognizer()
        
        super.viewDidLoad()
    }

    private func setupGestureRecognizer() {
        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        doubleTapGestureRecognizer.numberOfTapsRequired = kNumbersOfTapRequired
        doubleTapGestureRecognizer.delegate = self
        view.addGestureRecognizer(doubleTapGestureRecognizer)
    }

    @objc
    func doubleTapped(_ doubleTap: UITapGestureRecognizer) {
        let circle: Circle = Circle()
        circle.center = doubleTap.location(in: mainView)
        mainView.addSubview(circle)
    }

}
