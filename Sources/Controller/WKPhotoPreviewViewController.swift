//
//  PhotoPreviewViewController.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2016/9/30.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

public class WKPhotoPreviewViewController: UIViewController {
    
    

    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    

    // MARK: - Storyboard
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    public override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }


}


class WKPreviewCollectionCell: UICollectionViewCell, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var imageContainerView: UIView!
    var imageView: UIImageView!
    
    var model: WKAssetModel?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        self.backgroundColor = UIColor.blackColor()
        
        scrollView = UIScrollView(frame: self.bounds)
        scrollView.bouncesZoom = true;
        scrollView.maximumZoomScale = 2.5;
        scrollView.minimumZoomScale = 1.0;
        scrollView.multipleTouchEnabled = true;
        scrollView.delegate = self;
        scrollView.scrollsToTop = false;
        scrollView.showsHorizontalScrollIndicator = false;
        scrollView.showsVerticalScrollIndicator = false;
        //        scrollView.autoresizingMask = .FlexibleWidth | .FlexibleHeight;
        scrollView.delaysContentTouches = false;
        scrollView.canCancelContentTouches = true;
        scrollView.alwaysBounceVertical = false;
        self.addSubview(scrollView);
        
        imageContainerView = UIView()
        imageContainerView.clipsToBounds = true
        scrollView.addSubview(imageContainerView)
        
        imageView = UIImageView()
        imageView.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        imageView.clipsToBounds = true
        imageContainerView.addSubview(imageView)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(singleTapHandler))
        self.addGestureRecognizer(singleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapHandler))
        doubleTap.numberOfTapsRequired = 2
        singleTap.requireGestureRecognizerToFail(doubleTap)
        self.addGestureRecognizer(doubleTap)
    }
    
    func recoverSubviews() {
        scrollView.setZoomScale(1.0, animated: false)
        self.resizeSubViews()
    }
    
    func resizeSubViews() {
        imageContainerView.origin = CGPointZero;
        imageContainerView.width = self.scrollView.width;
        
        let image = imageView.image
        let imageSize = image?.size ?? self.size
        if (imageSize.height / imageSize.width > self.height / self.scrollView.width) {
            imageContainerView.height = floor(imageSize.height / (imageSize.width / self.scrollView.width));
        } else {
            var height = imageSize.height / imageSize.width * self.scrollView.width;
            if (height < 1 || isnan(height)) {
                height = self.height
            }
            height = floor(height);
            imageContainerView.height = height;
            imageContainerView.centerY = self.height / 2;
        }
        if (imageContainerView.height > self.height && imageContainerView.height - self.height <= 1) {
            imageContainerView.height = self.height;
        }
        scrollView.contentSize = CGSize(width: self.scrollView.width, height: max(imageContainerView.height, self.height))
        scrollView.scrollRectToVisible(self.bounds, animated: false)
        scrollView.alwaysBounceVertical = imageContainerView.height <= self.height ? false : true
        imageView.frame = imageContainerView.bounds;
    }
    
    // MARK: - Config Data
    
    func setAssetModel(model: WKAssetModel) {
        self.model = model
        scrollView.setZoomScale(1.0, animated: false)
        // 获取图片
        
    }
    
    // MARK: - Action
    @objc func singleTapHandler(gesture: UITapGestureRecognizer) {
        
    }
    
    @objc func doubleTapHandler(gesture: UITapGestureRecognizer) {
        if (scrollView.zoomScale > 1.0) {
            scrollView.setZoomScale(1.0, animated: true)
        } else {
            let touchPoint = gesture.locationInView(self.imageView)
            let newZoomScale = scrollView.maximumZoomScale;
            let xsize = self.frame.size.width / newZoomScale;
            let ysize = self.frame.size.height / newZoomScale;
            scrollView.zoomToRect(CGRect(x: touchPoint.x - xsize / 2, y: touchPoint.y - ysize / 2, width: xsize, height: ysize), animated: true)
        }
    }
    
    
    // MARK: UIScrollViewDelegate
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageContainerView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        let offsetX = (scrollView.width > scrollView.contentSize.width) ? (scrollView.width - scrollView.contentSize.width) * 0.5 : 0.0;
        let offsetY = (scrollView.height > scrollView.contentSize.height) ? (scrollView.height - scrollView.contentSize.height) * 0.5 : 0.0;
        self.imageContainerView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX, scrollView.contentSize.height * 0.5 + offsetY);
    }
}


class WKAssetModel: NSObject {
    
}


class WKAlbumModel: NSObject {
    
}
