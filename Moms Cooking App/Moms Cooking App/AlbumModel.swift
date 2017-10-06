//
//  AlbumModel.swift
//  Moms Cooking App
//
//  Created by Christoffer Eenberg on 16/09/2017.
//  Copyright © 2017 Christoffer Eenberg. All rights reserved.
//

import Foundation
import Photos

class AlbumModel {
    let name:String
    let count:Int
    let collection:PHAssetCollection
    init(name:String, count:Int, collection:PHAssetCollection) {
        self.name = name
        self.count = count
        self.collection = collection
    }
}
