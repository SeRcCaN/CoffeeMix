//
//  Extension.swift
//  CoffeeMix
//
//  Created by Sercan Burak AĞIR on 22.03.2018.
//  Copyright © 2018 Sercan Burak AĞIR. All rights reserved.
//


import UIKit

let imageCach = NSCache<AnyObject, AnyObject>()

extension UIImageView{
    
    func loadImagesUsingCacheWithUrlString(urlString: String){
        
        if let cachedImage = imageCach.object(forKey: urlString as AnyObject) as? UIImage{
            self.image = cachedImage
            return
        }
        
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            DispatchQueue.main.async{
                if let downloadedImage = UIImage(data: data!){
                    imageCach.setObject(downloadedImage, forKey: urlString as AnyObject)
                    self.image = downloadedImage
                }
            }
        }).resume()
    }
}


