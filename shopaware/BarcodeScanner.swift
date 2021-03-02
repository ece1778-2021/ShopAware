//
//  BarcodeScanner.swift
//  shopaware
//
//  Created by Julyan Baruch on 2021-03-02.
//

import Foundation
import SwiftUI
import AVFoundation

struct BarcodeScanner: UIViewControllerRepresentable {
    @Binding var isbn: String?
    @Environment(\.presentationMode) private var presentrationMode
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.black
        context.coordinator.captureSession = AVCaptureSession()
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { fatalError()}
        let videoInput: AVCaptureDeviceInput(device: videoCaptureDevice)
    }
}
