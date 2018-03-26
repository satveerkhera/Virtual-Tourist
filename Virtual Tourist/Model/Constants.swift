//
//  Constants.swift
//  Virtual Tourist
//
//  Created by Satveer Singh on 2/18/18.
//  Copyright © 2018 Satveer Singh. All rights reserved.
//

import UIKit

// MARK: - Constants

struct Constants {
    
    // MARK: Flickr
    struct Flickr {
        static let APIScheme = "https"
        static let APIHost = "api.flickr.com"
        static let APIPath = "/services/rest"
        
        static let SearchBBoxHalfWidth = 1.0
        static let SearchBBoxHalfHeight = 1.0
        static let SearchLatRange = (-90.0, 90.0)
        static let SearchLonRange = (-180.0, 180.0)
    }
    
    // MARK: Flickr Parameter Keys
    struct FlickrParameterKeys {
        static let Method = "method"
        static let APIKey = "api_key"
        static let GalleryID = "gallery_id"
        static let Extras = "extras"
        static let Format = "format"
        static let NoJSONCallback = "nojsoncallback"
        static let SafeSearch = "safe_search"
        static let Text = "text"
        static let BoundingBox = "bbox"
        static let latitude = "lat"
        static let logitude = "lon"
        static let Page = "page"
    }
    
    // MARK: Flickr Parameter Values
    struct FlickrParameterValues {
        static let SearchMethod = "flickr.photos.search"
        static let APIKey = "1aa68240cb299d66d9531ae70613dbee"
        static let ResponseFormat = "json"
        static let DisableJSONCallback = "1" /* 1 means "yes" */
        static let GalleryPhotosMethod = "flickr.galleries.getPhotos"
        static let GalleryID = "5704-72157622566655097"
        static let MediumURL = "url_m"
        static let UseSafeSearch = "1"
    }
    
    // MARK: Flickr Response Keys
    struct FlickrResponseKeys : Decodable {
        static let Status = "stat"
        static let Photos = "photos"
        static let Photo = "photo"
        static let Title = "title"
        static let MediumURL = "url_m"
        static let Pages = "pages"
        static let Total = "total"
        
    }
    
    
    // MARK: Flickr Response Values
    struct FlickrResponseValues {
        static let OKStatus = "ok"
    }
}
/*
 let dic = [ "photos": [
 "page": 1,
 "pages": 1,
 "perpage": 100,
 "total": 1,
 "photo":
 [ "id": "3184568924", "owner": "59787340@N00", "secret": "0fc26e8e2c", "server": "3258", "farm": 4, "title": "Nahal Giborim (Wadi Rushmiya) - Haifa", "ispublic": 1, "isfriend": 0, "isfamily": 0, "url_m": "https://farm4.staticflickr.com", "height_m": "333", "width_m": "500" ]
 ],
 "stat": "ok" ] as [String : AnyObject]
 
 */

// MARK: Flicker Response decoder
struct FlickerResponse : Decodable {
    var photos : Photos
}

struct Photos : Decodable {
    //var page : Int?
    //var pages : Int?
    //var perpage : Int?
    //var total : String?
    var photo : [Photo]
}

struct Photo : Decodable {
    var id : String?
    //var owner : String?
    //var secret : String?
    //var server : String?
    //var title :String?
    var url : String?

    private enum CodingKeys : String, CodingKey {
        case url = "url_m"
        //case id, owner, secret, server, title
        case id
    }
}

struct Location: Equatable {
    var latidute : Double
    var longitude : Double
    var photo : [Photo]?
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        return lhs.latidute == rhs.latidute && lhs.longitude == rhs.longitude
    }
}






