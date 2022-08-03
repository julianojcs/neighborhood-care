//
//  IViewControler+Context.swift
//  NeighborhoodCare
//
//  Created by Juliano Costa Silva on 02/08/22.
//

import UIKit  // Subistitui o Foundation
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
