import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    lazy var persistantConteiner: NSPersistentContainer = {
        let conteiner = NSPersistentContainer(name: "Model")
        conteiner.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("fatal error CoreData")
            }
        })
        return conteiner
    }()
    
    func saveContext(){
        let context = persistantConteiner.viewContext
        if context.hasChanges {
            do {
                try context.save()
            }catch{
                let nsError = error as NSError
                fatalError("fatal error CoreData saveContext\(nsError)")
            }
        }
    }



}

