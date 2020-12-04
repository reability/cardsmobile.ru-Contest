//
//  QRReaderView.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 29.11.2020.
//

import UIKit
import AVFoundation

final class QRReaderView: UIView, AVCaptureMetadataOutputObjectsDelegate {
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        /// Очень плохо так делать. Знаю. Тут вообще все плохо
        
        if captureSession == nil {
            
            DispatchQueue.global(qos: .background).async {
                DispatchQueue.main.async {
                    self.commomInit()
                }
            }
        }
        //layoutIfNeeded()
    }
    
    func commomInit() {
        
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        
        backgroundColor = UIColor.red
        
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()

        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        previewLayer.frame = layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(previewLayer)
        
        DispatchQueue.global(qos: .userInitiated).sync {
            self.captureSession.startRunning()
        }
    }
    
    func failed() {
        captureSession = nil
    }
    
    func start() {

        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }

    func stop() {

        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()

        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            onFound(code: stringValue)
        }
    }
    
    func onFound(code: String) {
        #warning("Not implemented")
    }
    
}
