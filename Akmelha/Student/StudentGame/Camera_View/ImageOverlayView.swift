//
//  ImageOverlayView.swift
//  Akmelha
//
//  Created by H on 17/06/1444 AH.
//

import SwiftUI
import UIKit

struct ImageOverlayView: UIViewControllerRepresentable {
    var image:UIImage
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImageOverlayView>) -> UIViewController {
        
        let viewController = ImageOverlayViewController(image: image)
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ImageOverlayView>) {
        
    }
}
