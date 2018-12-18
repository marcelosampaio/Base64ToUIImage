//
//  ViewController.swift
//  Base64ToUIImage
//
//  Created by Marcelo Sampaio on 18/12/18.
//  Copyright © 2018 Marcelo Sampaio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func convertBase64ToUIImage(_ sender: Any) {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        print("* DOCUMENTS FOLDER: \(paths[0])")
//        let documentsUrl = paths[0]
//        let debugFilename = documentsUrl.appendingPathComponent("debugOutputBase64_ForReading")
        let contents = getContentOfBudleFile()
        imageView.image = base64Convert(imageString: contents)
        print("..... FIM ........")
        
    }
    
    private func base64Convert(imageString: String) -> UIImage {
        let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
    }
    
//    func base64Convert(base64String: String?) -> UIImage{
//        if (base64String?.isEmpty)! {
//            return UIImage()
//        }else {
//            // !!! Separation part is optional, depends on your Base64String !!!
////            let temp = base64String?.components(separatedBy: ",")
//            let dataDecoded : Data = Data(base64Encoded: base64String!, options: .ignoreUnknownCharacters)!
//            let decodedimage = UIImage(data: dataDecoded)
//            return decodedimage!
//        }
//    }
//
    
    func getContentOfBudleFile() -> String {
        
        if let filepath = Bundle.main.path(forResource: "debugOutputBase64", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                print("👉 got contents")
                return contents
            } catch {
                // contents could not be loaded
                print("error 1")
                return String()
            }
        } else {
            // example.txt not found!
            print("error 2")
            return String()
        }
        
    }
    
    
}

