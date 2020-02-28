
import UIKit
import MapKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let latitude = 39.981108
    
    let longitude = -75.192894
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let location = CLLocationCoordinate2DMake(latitude, longitude)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: false)
        ceatAnotation()
    }
    


    func ceatAnotation(){
        for location in arrayPlaces {
            let annotation = MKPointAnnotation()
            annotation.title = location.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: Double(location.latitude)!, longitude: Double(location.longitude)!)
            
            mapView.addAnnotation(annotation)
        }
    }

}

