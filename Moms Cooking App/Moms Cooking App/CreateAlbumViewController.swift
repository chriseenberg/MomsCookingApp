//
//  CreateAlbumViewController.swift
//  Moms Cooking App
//
//  Created by Christoffer Eenberg on 16/09/2017.
//  Copyright © 2017 Christoffer Eenberg. All rights reserved.
//

import UIKit

class CreateAlbumViewController: UIViewController {
    
    @IBOutlet var albumNameTF: UITextField!
    
    @IBAction func dismissCreateAlbum(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAction(_ sender: UIButton) {
        if albumNameTF.text != "" {
            UDService.albumName = albumNameTF.text
            CustomPhotoAlbum.shared.createAlbum(albumName: UDService.albumName!)
            dismiss(animated: true, completion: notifySuccess)
        }
    }
    
    private func notifySuccess() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "createAlbumSuccess"), object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
