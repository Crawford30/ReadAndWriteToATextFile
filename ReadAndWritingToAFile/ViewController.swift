//
//  ViewController.swift
//  ReadAndWritingToAFile
//
//  Created by JOEL CRAWFORD on 3/10/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let fileName = "Test"
        

        let documentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        
        let  fileURL = documentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        print("Filepath   \(fileURL.path)")
        
        ///Users/joelcrawford/Library/Developer/CoreSimulator/Devices/8F1C7520-F20A-416F-A253-CC4ACC8F3119/data/Containers/Data/Application/148DA0AA-4EFA-4355-B12D-0C0E16321E31/Documents/Test.txt
        
        
        //=======writing to the file =======
        
        let writeString = "Write this text to the file in swift"
        
        
        do {
            //========write the file here==========
            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed to write to URL")
            print(error)
            
        }
        
        
        //=======Reading from the file we just created===
        
        
        var readString = ""
        do {
            readString = try! String(contentsOf: fileURL)
        } catch let err as NSError {
            print("Failed to read from the file")
            print(err)
        }
        
        //======print content of the file=====
        
        print("Contents of the file \(readString)")
    }


}

