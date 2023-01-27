//
//  Post+CoreDataProperties.swift
//  assignment_week3_daangn
//
//  Created by 황신아 on 2023/01/08.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var pickedImage: Data?
    @NSManaged public var price: String?

}

extension Post : Identifiable {

}
