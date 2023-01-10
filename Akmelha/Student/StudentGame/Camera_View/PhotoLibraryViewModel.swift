//
//  PhotoLibraryViewModel.swift
//  Akmelha
//
//  Created by H on 17/06/1444 AH.
//


import Foundation
import Combine
import UIKit

class PhotoLibraryViewModel: NSObject, ObservableObject {
    @Published var selectedImage:UIImage = UIImage()
    @Published var showImageAndButton = false
    @Published var showImageViewOverlay = false
    @Published var showPicker = false
    
    func startRecognition() {
        showImageViewOverlay.toggle()
    }
}

extension PhotoLibraryViewModel: UIImagePickerControllerDelegate,
                                 UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage = image
            showImageAndButton = true
        }
        showPicker = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        showPicker = false
    }
}
