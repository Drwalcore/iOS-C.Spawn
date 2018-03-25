import UIKit

class GameViewController: UIViewController {

    private let mainView = MainView()
    private let kNumbersOfTapsRequiredForSpawn = 2
    private let kNumbersOfTapsRequiredForTermination = 3

    override func viewDidLoad() {
        view = mainView
        setupSpawnGestureRecognizer()
        setupTerminationGestureRecognizer()
        
        super.viewDidLoad()
    }

    private func setupSpawnGestureRecognizer() {
        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        doubleTapGestureRecognizer.numberOfTapsRequired = kNumbersOfTapsRequiredForSpawn
        doubleTapGestureRecognizer.delegate = self
        mainView.addGestureRecognizer(doubleTapGestureRecognizer)
    }

    private func setupTerminationGestureRecognizer() {
        let tripleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tripleTapped(_:)))
        tripleTapGestureRecognizer.numberOfTapsRequired = kNumbersOfTapsRequiredForTermination
        mainView.circle.addGestureRecognizer(tripleTapGestureRecognizer)
    }

    // MARK:- Gesture Recognizers Selectors

    @objc
    func doubleTapped(_ doubleTap: UITapGestureRecognizer) {
        let circle: Circle = Circle()
        circle.center = doubleTap.location(in: mainView)
        mainView.addSubview(circle)
    }

    @objc func tripleTapped(_ tripleTap: UITapGestureRecognizer) {
        if let circleView = tripleTap.view {
            let terminationAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
                circleView.alpha = 0
                circleView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            })
            terminationAnimator.addCompletion { position in
                if position == .end {
                    circleView.removeFromSuperview()
                }
            }
            terminationAnimator.startAnimation()
        }
    }

}
