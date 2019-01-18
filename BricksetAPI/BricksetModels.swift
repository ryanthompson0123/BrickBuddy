//
//  Models.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/12/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import Foundation
import IGListKit

final class BricksetInstructions: Decodable, ListDiffable {
    let url: URL
    let description: String
    
    init(url: URL, description: String) {
        self.url = url
        self.description = description
    }
    
    // MARK: Decodable
    
    enum CodingKeys : String, CodingKey {
        case url = "URL"
        case description
    }
    
    // MARK: ListDiffable
    func diffIdentifier() -> NSObjectProtocol {
        return url.hashValue as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? BricksetInstructions else { return false }
        return url == object.url && description == object.description
    }
}

final class BricksetReview: Decodable, ListDiffable {
    let author: String?
    let datePosted: Date
    let overallRating: Int
    let buildingExperience: Int
    let playability: Int
    let valueForMoney: Int
    let title: String?
    let review: String?
    let isHTML: Bool
    
    enum CodingKeys: String, CodingKey {
        case author, datePosted, overallRating, buildingExperience, playability, valueForMoney, title, review
        case isHTML = "HTML"
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return author.hashValue as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? BricksetReview else { return false }
        return author == object.author && datePosted == object.datePosted && overallRating == object.overallRating && buildingExperience == object.buildingExperience && playability == object.playability && valueForMoney == object.valueForMoney && title == object.title && review == object.review && isHTML == object.isHTML
    }
}

final class BricksetSet: Decodable, ListDiffable {
    let id : Int
    let number : String?
    let numberVariant : Int
    let name : String?
    let year : String?
    let theme : String?
    let themeGroup : String?
    let subtheme : String?
    let pieces : String?
    let minifigs : String?
    let image : Bool
    let imageFilename : String?
    let thumbnailUrl : URL?
    let largeThumbnailUrl : URL?
    let imageUrl : URL?
    let bricksetUrl : URL?
    let released : Bool
    let owned : Bool
    let wanted : Bool
    let qtyOwned : Int
    let userNotes : String?
    let ACMDataCount : Int
    let ownedByTotal : Int
    let wantedByTotal : Int
    let UKRetailPrice : String?
    let USRetailPrice : String?
    let CARetailPrice : String?
    let EURetailPrice : String?
    let USDateAddedToSAH : String?
    let USDateRemovedFromSAH : String?
    let rating : Double
    let reviewCount : Int
    let packagingType : String?
    let availability : String?
    let instructionsCount : Int
    let additionalImageCount : Int
    let ageMin : String?
    let ageMax : String?
    let height : String?
    let width : String?
    let depth : String?
    let weight : String?
    let category : String?
    let notes : String?
    let userRating : String?
    let tags : String?
    let EAN : String?
    let UPC : String?
    let description : String?
    let lastUpdated : Date
    
    func formatTitle() -> String {
        
        let nameStr = name ?? "(no name)"
        let numStr = number ?? "(N/A)"
        
        return "\(numStr): \(nameStr)"
    }
    
    func formatTheme() -> String {
        guard let themeStr = theme else {
            return "(no theme)"
        }
        
        guard let subthemeStr = subtheme else {
            return themeStr
        }
        
        return "\(themeStr) > \(subthemeStr)"
    }
    
    
    // MARK: Decodable
    
    enum CodingKeys : String, CodingKey {
        case id = "setID"
        case number
        case numberVariant
        case name
        case year
        case theme
        case themeGroup
        case subtheme
        case pieces
        case minifigs
        case image
        case imageFilename
        case thumbnailUrl = "thumbnailURL"
        case largeThumbnailUrl = "largeThumbnailURL"
        case imageUrl = "imageURL"
        case bricksetUrl = "bricksetURL"
        case released
        case owned
        case wanted
        case qtyOwned
        case userNotes
        case ACMDataCount
        case ownedByTotal
        case wantedByTotal
        case UKRetailPrice
        case USRetailPrice
        case CARetailPrice
        case EURetailPrice
        case USDateAddedToSAH
        case USDateRemovedFromSAH
        case rating
        case reviewCount
        case packagingType
        case availability
        case instructionsCount
        case additionalImageCount
        case ageMin
        case ageMax
        case height
        case width
        case depth
        case weight
        case category
        case notes
        case userRating
        case tags
        case EAN
        case UPC
        case description
        case lastUpdated
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? BricksetSet else { return false }
        return number == object.number && numberVariant == object.numberVariant && name == object.name && year == object.year && theme == object.theme && themeGroup == object.themeGroup && subtheme == object.subtheme && pieces == object.pieces && minifigs == object.minifigs && image == object.image && imageFilename == object.imageFilename && thumbnailUrl == object.thumbnailUrl && largeThumbnailUrl == object.largeThumbnailUrl && imageUrl == object.imageUrl && bricksetUrl == object.bricksetUrl && released == object.released && owned == object.owned && qtyOwned == object.qtyOwned && wanted == object.wanted && userNotes == object.userNotes && ACMDataCount == object.ACMDataCount && ownedByTotal == object.ownedByTotal && wantedByTotal == object.wantedByTotal && UKRetailPrice == object.UKRetailPrice && USRetailPrice == object.USRetailPrice && CARetailPrice == object.CARetailPrice && EURetailPrice == object.EURetailPrice && USDateAddedToSAH == object.USDateAddedToSAH && USDateRemovedFromSAH == object.USDateRemovedFromSAH && rating == object.rating && reviewCount == object.reviewCount && packagingType == object.packagingType && availability == object.availability && instructionsCount == object.instructionsCount && additionalImageCount == object.additionalImageCount && ageMin == object.ageMin && ageMax == object.ageMax && height == object.height && width == object.width && depth == object.depth && weight == object.weight && category == object.category && notes == object.notes && userRating == object.userRating && tags == object.tags && EAN == object.EAN && UPC == object.UPC && description == object.description && lastUpdated == object.lastUpdated
    }
}
