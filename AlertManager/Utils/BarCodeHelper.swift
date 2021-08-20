//
//  BarCodeHelper.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/17.
//

import UIKit

struct BarcodeHelper {
    // BarCode
    static func genDisplayCode(by text: String, type: Descriptor, size: CGSize) -> UIImage? {
        let data = text.data(using: .ascii)
        if let filter = CIFilter(name: type.rawValue) {
            filter.setValue(data, forKey: "inputMessage")
            guard let image = filter.outputImage else {
                return nil
            }

            let imageSize = image.extent.size
            let transform = CGAffineTransform(scaleX: size.width / imageSize.width,
                                                   y: size.height / imageSize.height)
            let scaledImage = image.transformed(by: transform)
            
            let context:CIContext = CIContext.init(options: nil)
           let cgImage:CGImage = context.createCGImage(scaledImage, from: scaledImage.extent)!
            let img: UIImage = UIImage.init(cgImage: cgImage)
            return img
        }
        return nil
    }

    // QRCode
    static func genQRCode(by text: String) -> UIImage? {
//        genBarCode(by: text, type: "CIQRCodeGenerator", size: <#CGSize#>)
        return UIImage()
    }
}
