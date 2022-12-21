//
//  ShareSheet.swift
//  Akmelha
//
//  Created by Aldana on 21/12/2022.
//

import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    var items:[Any]
    func makeUIViewController(context: Context) -> UIViewController {
        let view = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return view
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}


