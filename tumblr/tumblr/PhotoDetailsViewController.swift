//
//  PhotoDetailsViewController.swift
//  tumblr
//
//  Created by Andres Gonzales on 9/24/19.
//  Copyright © 2019 Andres Gonzalez. All rights reserved.
//

import UIKit
import AlamofireImage


class PhotoDetailsViewController: UIViewController {

    
    @IBOutlet weak var photoDetails: UIImageView!
    
    
    
    var image: UIImage?

    var photo:[String:Any]?
    var url:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //photoDetail.image = image
       setImage()
        
    }
    private func setImage(){
        guard let photo = photo else {return}
        if let photos = photo["photos"] as? [[String:Any]]{
            let photo = photos[0]
            guard let originalSize = photo["original_size"] as? [String:Any] else {return}
            guard let urlString = originalSize["url"] as? String else {return}
            
            guard let url = URL(string: urlString) else {return}
            photoDetails.af_setImage(withURL: url)
        
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
