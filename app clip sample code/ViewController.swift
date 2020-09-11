//
//  ViewController.swift
//  app clip sample code
//
//  Created by Daniel Vela on 11/09/2020.
//  Copyright © 2020 veladan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var codeTextField: UITextField!
  @IBOutlet weak var qrImage: UIImageView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    }

  @IBAction func generateQRTapped(_ sender: Any) {
    let image = generateQRCode(from: codeTextField.text ?? "")
    qrImage.image = image
  }

  private func generateQRCode(from string: String) -> UIImage? {
      let data = string.data(using: String.Encoding.ascii)

      if let filter = CIFilter(name: "CIQRCodeGenerator") {
          filter.setValue(data, forKey: "inputMessage")
          let transform = CGAffineTransform(scaleX: 3, y: 3)

          if let output = filter.outputImage?.transformed(by: transform) {
              return UIImage(ciImage: output)
          }
      }

      return nil
  }
}
