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

        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed(_:)))
        circle.addGestureRecognizer(longPressGestureRecognizer)

        mainView.addSubview(circle)
    }

    @objc
    func tripleTapped(_ tripleTap: UITapGestureRecognizer) {
        if let circleView = tripleTap.view {
            let deletionAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
                circleView.alpha = 0
                circleView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
            })
            deletionAnimator.addCompletion({ _ in
                circleView.removeFromSuperview()
            })
            deletionAnimator.startAnimation()
        }
        return
    }

    @objc
    func longPressed(_ longPress: UILongPressGestureRecognizer) {
        guard let circleView = longPress.view else { return }
        
        switch longPress.state {
        case .began:
            let beginningAnimator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: { [weak self] in
                self?.view.bringSubview(toFront: circleView)
                circleView.alpha = 0.7
                circleView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            })
            beginningAnimator.startAnimation()
        case .changed:
            return
        case .cancelled, .failed:
            let failureAnimator = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
                circleView.alpha = 1
                circleView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
            failureAnimator.startAnimation()
        case .ended:
            let completionAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
                circleView.alpha = 1
                circleView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
            completionAnimator.addCompletion({ _ in
                self.mainView.bringSubview(toFront: circleView)
            })
            completionAnimator.startAnimation()
        case .possible:
            break
        }

    }

}
