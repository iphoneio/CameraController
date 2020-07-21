//
//  UCDevice.swift
//  CameraController
//
//  Created by Itay Brenner on 7/19/20.
//  Copyright © 2020 Itaysoft. All rights reserved.
//

import Foundation
import AVFoundation

typealias USBInterfacePointer = UnsafeMutablePointer<UnsafeMutablePointer<IOUSBInterfaceInterface190>>

class UVCDevice {
    let interface: USBInterfacePointer
    let processingUnitID: Int
    let cameraTerminalID: Int

    init(device: AVCaptureDevice) throws {
        let deviceInfo = try device.usbDevice()

        interface = deviceInfo.interface
        processingUnitID = deviceInfo.descriptor.processingUnitID
        cameraTerminalID = deviceInfo.descriptor.cameraTerminalID
    }

    deinit { _ = interface.pointee.pointee.Release(interface) }
}
