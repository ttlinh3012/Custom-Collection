//
//  InspirationCell.swift
//  TLUltravisual
//
//  Created by Tran Tuan Linh on 08/11/2023.
//

import UIKit

class InspirationCell: UICollectionViewCell {
    @IBOutlet var thumbHieght: NSLayoutConstraint!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageCoverView: UIView!
    @IBOutlet var thumbImage: UIImageView!
    
    var imageName: String = "" {
        didSet {
            imageView.image = UIImage(named: imageName)
            thumbImage.image = UIImage(named: imageName)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.cornerRadius = 8
        imageCoverView.layer.cornerRadius = 8
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        imageView.layer.cornerRadius = 8
        imageCoverView.layer.cornerRadius = 8
        // 1
        let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
        let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
        
        // 2
        let delta = 1 - ((featuredHeight - frame.height) / (featuredHeight - standardHeight))
        
        // 3
        let minAlpha: CGFloat = 0
        let maxAlpha: CGFloat = 0.4
        
        imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        
        let scale = max(0.65 + delta, 1)
        print("==> scale \(scale)")
        
        thumbImage.transform = scaleTransform(for: thumbImage,
                                              scaledBy: CGPoint(x: scale, y: scale),
                                              aroundAnchorPoint: CGPoint(x: 0, y: 1))
        
//        let targetWidth = thumbImage.frame.width
//        let targetHeight = thumbImage.frame.height
//        print("W: \(targetWidth) - H: \(targetHeight)")

//        thumbImage.transform = CGAffineTransform(scaleX: thumbscale, y: thumbscale)
        
//        let percent = frame.height / (featuredHeight)
        
//        print("percent \(percent)")
//        thumbHieght.constant = 60 * (delta)
        
//         Điều chỉnh vị trí để giữ nguyên khoảng cách bottom với superview
    }
    
    func scaleTransform(for view: UIView, scaledBy scale: CGPoint, aroundAnchorPoint relativeAnchorPoint: CGPoint) -> CGAffineTransform {
        let delta = view.bounds.width * 0.5
        let bounds = view.bounds
        let anchorPoint = relativeAnchorPoint
        view.anchorPoint = anchorPoint
        return CGAffineTransform.identity
            .translatedBy(x: -delta, y: delta)
            .translatedBy(x: anchorPoint.x, y: anchorPoint.y)
            .scaledBy(x: scale.x, y: scale.y)
            .translatedBy(x: -anchorPoint.x, y: -anchorPoint.y)
    }
}
