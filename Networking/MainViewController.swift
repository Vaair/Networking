//
//  MainViewController.swift
//  Networking
//
//  Created by Лера Тарасенко on 24.11.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

enum Actions: String, CaseIterable {
    case downloadImage = "Download Image"
    case get = "GET"
    case post = "POST"
    case ourCourses = "Our Courses"
    case uploadImage = "Upload Images"
}

private let reuseIdentifier = "Cell"
private let url = "https://jsonplaceholder.typicode.com/posts"
private let urlUploadImage = "https://api.imgur.com/3/image"

class MainViewController: UICollectionViewController {
    
    //let actions = ["Download Image", "GET", "POST", "Our Courses", "Upload Images"]
    let actions = Actions.allCases
   

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return actions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        cell.label.text = actions[indexPath.row].rawValue
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let action = actions[indexPath.row]
        
        switch action {
        case .downloadImage:
            performSegue(withIdentifier: "ShowImage", sender: self)
        case .get:
            NetworkManager.getRequest(url: url)
        case .post:
            NetworkManager.postRequest(url: url)
        case .ourCourses:
            performSegue(withIdentifier: "OurCourses", sender: self)
        case .uploadImage:
            NetworkManager.uploadImage(url: urlUploadImage)
        }
    }

}
