
import UIKit



class FirstWithSityVC: UIViewController {
    @IBOutlet weak var imgageViewOutlet: UIImageView!
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var textAboutLabelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
