import UIKit

class GameViewController: UIViewController {

    private let mainView = MainView()
    private let kNumbersOfTapsRequiredForSpawn = 2
    private let kNumbersOfTapsRequiredForTermination = 3

    override func viewDidLoad() {
        view = mainView
        setupSpawnGestureRecognizer()
        
        super.viewDidLoad()
    }

    private func setupSpawnGestureRecognizer() {
        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        doubleTapGestureRecognizer.numberOfTapsRequired = kNumbersOfTapsRequiredForSpawn
        doubleTapGestureRecognizer.delegate = self
        mainView.addGestureRecognizer(doubleTapGestureRecognizer)
    }

    // MARK:- Gesture Recognizers Selectors

    @objc
    func doubleTapped(_ doubleTap: UITapGestureRecognizer) {
        let circle: Circle = Circle()
        let tripleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tripleTapped(_:)))
        tripleTapGestureRecognizer.numberOfTapsRequired = kNumbersOfTapsRequiredForTermination
        tripleTapGestureRecognizer.delegate = self
        circle.addGestureRecognizer(tripleTapGestureRecognizer)
        circle.center = doubleTap.location(in: mainView)
        mainView.addSubview(circle)
    }

    @objc func tripleTapped(_ tripleTap: UITapGestureRecognizer) {
        if let circleView = tripleTap.view {
            circleView.removeFromSuperview()
        }
        return
    }

}
