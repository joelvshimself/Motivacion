import Foundation
import SwiftUI

struct CarouselItem: Identifiable, Codable {
    let id: UUID  //Universal Unic Identifier, every note and carousel must have it
    let title: String
    let description: String

    init(id: UUID = UUID(), title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
    }
}

struct CarouselCategory: Identifiable, Codable {  //Codable let transform info to json
    let id: UUID
    let title: String
    var items: [CarouselItem]

    init(id: UUID = UUID(), title: String, items: [CarouselItem] = []) {
        self.id = id
        self.title = title
        self.items = items
    }
}

