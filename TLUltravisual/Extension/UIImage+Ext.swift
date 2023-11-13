//
//  UIImage+Ext.swift
//  TLUltravisual
//
//  Created by Tran Tuan Linh on 07/11/2023.
//

import UIKit

extension UIImage {
  
  var decompressedImage: UIImage {
    UIGraphicsBeginImageContextWithOptions(size, true, 0)
    draw(at: CGPoint.zero)
    let decompressedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return decompressedImage!
  }
  
}
