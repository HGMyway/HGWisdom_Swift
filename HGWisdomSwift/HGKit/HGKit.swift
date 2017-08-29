//
//  HGKit.swift
//  BabysCard_Swift
//
//  Created by 小雨很美 on 2017/6/28.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

import Foundation
import UIKit
extension UIImage
{


    class  func imageCorner (color: UIColor , rect: CGRect , alpha: CGFloat = 1.0) -> UIImage {

        let img = image(color: color, rect: rect, alpha: alpha)

        let fram = CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height)

        UIGraphicsBeginImageContextWithOptions(img.size, false, 1.0)
        UIBezierPath(roundedRect: fram, cornerRadius: rect.size.width/2.0).addClip()

        img.draw(in: fram)
        let imagee = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imagee!
    }
    class  func image (color: UIColor , rect: CGRect =  CGRect(x: 0, y: 0, width: 1, height: 1) , alpha: CGFloat = 1.0) -> UIImage {
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.setAlpha(alpha)

        context?.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return img!
    }
}





extension UINavigationController
{
    func resetNavigationbar()  {
        self.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationBar.shadowImage = nil;
        //
    }
    func setNavigationbarClear()  {
        setNavigationColor(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0))
    }
    func setNavigationColor(color: UIColor, alpha: CGFloat = 1.0)  {
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.setBackgroundImage(UIImage.image(color:color), for: .default)
    }
}

extension UIView{
	var height: CGFloat {
		set{
			self.frame = CGRect(origin: frame.origin, size: CGSize(width: frame.width, height: newValue))
		}
		get{
			return self.frame.height
		}
	}
	var width: CGFloat {
		set{
			self.frame = CGRect(origin: frame.origin, size: CGSize(width: newValue, height: frame.width))
		}
		get{
			return self.frame.width
		}
	}
	var top: CGFloat {
		set{
			self.frame = CGRect(origin: CGPoint(x: frame.minX, y: newValue), size: frame.size)
		}
		get{
			return self.frame.minY
		}
	}

	var left: CGFloat {
		set{
			self.frame = CGRect(origin: CGPoint(x: newValue, y: frame.minY), size: frame.size)
		}
		get{
			return self.frame.minX
		}
	}

	var bottom: CGFloat {
		set{
			self.frame = CGRect(origin: CGPoint(x: frame.minX, y: newValue - frame.height), size: frame.size)
		}
		get{
			return self.frame.maxY
		}
	}

	var right: CGFloat {
		set{
			self.frame = CGRect(origin: CGPoint(x: newValue - frame.width, y: frame.minY), size: frame.size)
		}
		get{
			return self.frame.maxX
		}
	}

}








