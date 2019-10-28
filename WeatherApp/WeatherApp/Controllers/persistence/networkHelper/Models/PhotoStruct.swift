//
//  PhotoStruct.swift
//  WeatherApp
//
//  Created by Kary Martinez on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let totalHits: Int
    let hits: [Hit]
    let total: Int
}


// MARK: - Hit
struct Hit: Codable {
    let largeImageURL: String
    let webformatHeight, webformatWidth, likes, imageWidth: Int
    let id, userID, views, comments: Int
    let pageURL: String
    let imageHeight: Int
    let webformatURL: String
    let type: TypeEnum
    let previewHeight: Int
    let tags: String
    let downloads: Int
    let user: String
    let favorites, imageSize, previewWidth: Int
    let userImageURL, previewURL: String

    enum CodingKeys: String, CodingKey {
        case largeImageURL, webformatHeight, webformatWidth, likes, imageWidth, id
        case userID = "user_id"
        case views, comments, pageURL, imageHeight, webformatURL, type, previewHeight, tags, downloads, user, favorites, imageSize, previewWidth, userImageURL, previewURL
    }
}

enum TypeEnum: String, Codable {
    case illustration = "illustration"
    case photo = "photo"
}

