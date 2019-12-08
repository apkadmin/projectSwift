//
//  ImageViewFromURL.swift
//  demo23
//
//  Created by An Nguyen on 12/8/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView {
    func dowloadFromServer(url: URL) {
            URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func dowloadFromServer(link: String) {
        guard let url = URL(string: link) else { return }
        dowloadFromServer(url: url)
    }
}
