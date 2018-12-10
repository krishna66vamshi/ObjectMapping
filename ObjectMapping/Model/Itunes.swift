//
//  Itunes.swift
//  ObjectMapping
//
//  Created by vamshi on 24/11/18.
//  Copyright © 2018 vamshi. All rights reserved.
//

import Foundation
import ObjectMapper

struct ItunesModel: Mappable {
    
    var title:String?
    var country:String?
    var name:String?
    var uri:String?
    var results:[results]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        title <- map["feed.title"]
        country <- map["feed.country"]
        name <- map["feed.author.name"]
        uri <- map["feed.author.uri"]
        results <- map["feed.results"]
    
    }
    
}

struct results:Mappable {
    var artistName:String?
    var kind:String?
    var artworkUrl100:String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        artistName <- map["artistName"]
        kind <- map["kind"]
        artworkUrl100 <- map["artworkUrl100"]
    }
    
    
}
