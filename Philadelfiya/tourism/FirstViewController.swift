import UIKit

let myIndexPath = 0

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPlaces.count
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! FirstVCTableViewCell
        let oneElement = arrayPlaces[indexPath.row]
        cell.generalImageView.image = UIImage(named: oneElement.photo)
        cell.nameLabelOutlet.text = oneElement.name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DVC = storyboard.instantiateViewController(withIdentifier: "AboutLocationViewController") as! AboutLocationViewController
        let oneElementFromArray = arrayPlaces[indexPath.row]
        DVC.getElement = oneElementFromArray
        present(DVC, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        DatabaseViewController.fetchCoreData()
    }


}

