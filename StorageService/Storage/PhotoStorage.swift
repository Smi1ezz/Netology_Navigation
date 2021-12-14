//
//  PhotoStorage.swift
//  Navigation
//
//  Created by admin on 29.09.2021.
//

import UIKit
import Foundation

public struct Photo {
    public let label: String
    public let image: String
    public let images: [String]
}

public struct Photogallery {
    public static let photos: [Photo] = [
        Photo(label: "ph1", image: "ph1", images: hz),
        Photo(label: "ph2", image: "ph2", images: hz),
        Photo(label: "ph3", image: "ph3", images: hz),
        Photo(label: "ph4", image: "ph4", images: hz),
        Photo(label: "ph5", image: "ph5", images: hz),
        Photo(label: "ph6", image: "ph6", images: hz),
        Photo(label: "ph7", image: "ph7", images: hz),
        Photo(label: "ph8", image: "ph8", images: hz),
        Photo(label: "ph9", image: "ph9", images: hz),
        Photo(label: "ph10", image: "ph10", images: hz),
        Photo(label: "ph11", image: "ph11", images: hz),
        Photo(label: "ph12", image: "ph12", images: hz),
        Photo(label: "ph13", image: "ph13", images: hz),
        Photo(label: "ph14", image: "ph14", images: hz),
        Photo(label: "ph15", image: "ph15", images: hz),
        Photo(label: "ph16", image: "ph16", images: hz),
        Photo(label: "ph17", image: "ph17", images: hz),
        Photo(label: "ph18", image: "ph18", images: hz),
        Photo(label: "ph19", image: "ph19", images: hz),
        Photo(label: "ph20", image: "ph20", images: hz)
    ]
}

public var photogalleryStore: [UIImage]? = {
    guard Photogallery.photos.count > 0 else { return nil }
    var imgs = [UIImage]()
    for image in Photogallery.photos {
        imgs.append(UIImage(named: "\(image.image)")!)
    }
    return imgs
}()

let hz = ["ph1", "ph2", "ph3", "ph4", "ph5", "ph6", "ph7", "ph8", "ph9", "ph10","ph1", "ph2", "ph3", "ph4", "ph5", "ph6", "ph7", "ph8", "ph9", "ph10","ph11", "ph12", "ph13", "ph14", "ph15", "ph16", "ph17", "ph18", "ph19", "ph20"]


