//
//  PhotoPicker.swift
//  Akmelha
//
//  Created by H on 17/06/1444 AH.
//

import SwiftUI
import UIKit

struct PhotoPicker: UIViewControllerRepresentable {
    let delegate:PhotoLibraryViewModel
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoPicker>) -> UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = delegate
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<PhotoPicker>) {
        
    }
}
