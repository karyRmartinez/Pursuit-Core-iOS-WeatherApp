//
//  photoPersistence.swift
//  WeatherApp
//
//  Created by Kary Martinez on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

struct PhotosPersistenceHelper {
    
    private init() {}
    
    static let manager = PhotosPersistenceHelper()
    
    private let persistenceHelper = PersistenceHelper<Photo>(fileName: "allphotodxsads.plist")
    
    func savePhoto(photo: Photo) throws {
        try persistenceHelper.save(newElement: photo)
    }
    func getPhotos() throws -> [Photo] {
        return try persistenceHelper.getObjects()
    }
    

}
