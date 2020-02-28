
import Foundation
import UIKit
import CoreData

var arrayCoreData : [NSManagedObject] = []

class DatabaseViewController: UIViewController {
    class func saveToCoreData(textAboutFishing : String, latitude : String, longitude : String ){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistantConteiner.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Place", in: managedContext)
        let moneyWay = NSManagedObject(entity: entity!, insertInto: managedContext)
        moneyWay.setValue(textAboutFishing, forKey: "textAbout")
        moneyWay.setValue(latitude, forKey: "latitude")
        moneyWay.setValue(longitude, forKey: "longitude")
        do {
            try managedContext.save()
            arrayCoreData.append(moneyWay)
            print(moneyWay)
        } catch let err as NSError {
            print("Error Core Data", err)
        }
    }

    class func fetchCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistantConteiner.viewContext
        let fetchRequst = NSFetchRequest<NSManagedObject>(entityName: "Place")
        do {
            arrayCoreData = try managedContext.fetch(fetchRequst)
            cycleData()
        } catch let err as NSError {
            print("Error with fetch CoreData", err)
        }
    }
    
    class func cycleData(){
            for item in arrayCoreData {
                let textAboutFishing = item.value(forKey: "textAbout") as! String
                let latitude = item.value(forKey: "latitude") as! String
                let longitude = item.value(forKey: "longitude") as! String
                let newElement = placesStruct(name: "", textAbout: textAboutFishing, photo: "", latitude: latitude, longitude: longitude)
                arrayPlaces.append(newElement)
            }
    }

}
