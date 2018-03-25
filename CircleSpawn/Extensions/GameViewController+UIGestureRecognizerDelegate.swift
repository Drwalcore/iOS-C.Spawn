import UIKit

extension GameViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRequireFailureOf proceedingGestureRecognizer: UIGestureRecognizer) -> Bool {

        if let proceedingGestureRecognizer = proceedingGestureRecognizer as? UITapGestureRecognizer,
               proceedingGestureRecognizer.numberOfTapsRequired == 3 {
            return true
        }

        return false
    }
}
