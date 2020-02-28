
import UIKit
import MapKit

class AboutLocationViewController: UIViewController {
    
    @IBOutlet weak var avatarUIImageOutlet: UIImageView!
    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var textAboutLocationLabelOutlet: UILabel!

    
    var getElement = placesStruct(name: "", textAbout: "", photo: "", latitude: "", longitude: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarUIImageOutlet.image = UIImage(named: getElement.photo)
        nameLabelOutlet.text = getElement.name
        textAboutLocationLabelOutlet.text = getElement.textAbout
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func showOnMapButtonAction(_ sender: Any) {
    let latit:CLLocationDegrees = Double(getElement.latitude)!
    let longit:CLLocationDegrees = Double(getElement.longitude)!
    let regionDistance: CLLocationDistance = 1000
    let coordinates = CLLocationCoordinate2D(latitude: latit, longitude: longit)
    let regioonSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
    let option = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regioonSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regioonSpan.span)]
    let placeMark = MKPlacemark(coordinate: coordinates)
    let mapItemName = MKMapItem(placemark: placeMark)
    mapItemName.name = getElement.name
    mapItemName.openInMaps(launchOptions: option)
        
}

}
