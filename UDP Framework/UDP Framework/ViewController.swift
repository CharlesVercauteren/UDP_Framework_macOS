//
//  ViewController.swift
//  UDP Framework
//
//  Created by Charles Vercauteren on 12/01/2022.
//

import Cocoa
import Network

let ipAddress = "10.89.1.90"
let portNumber = "2000"

class ViewController: NSViewController {
    
    var udpClient = UDPFramework()

    @IBOutlet weak var textToSend: NSTextField!
    @IBOutlet weak var textReceived: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        udpClient.delegate = self

        //Create host
        let ip = ipAddress
        let host = NWEndpoint.Host(ip)
        //Create port
        let port = NWEndpoint.Port(portNumber)!
        //Create endpoint
        udpClient.connect(host: host, port: port)
    }

    @IBAction func sendPacket(_ sender: Any) {
        udpClient.sendPacket(text: textToSend.stringValue)
    }
    
}

extension ViewController: UDPMessages  {
    func serverReady() {
    }
    
    func receivedMessage(message: String) {
        textReceived.stringValue = message
    }
}

