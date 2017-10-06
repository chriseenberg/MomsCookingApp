//
//  MainViewController.swift
//  Moms Cooking App
//
//  Created by Christoffer Eenberg on 27/08/2017.
//  Copyright © 2017 Christoffer Eenberg. All rights reserved.
//

import UIKit
import MobileCoreServices

class MainViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var newMedia: Bool?
    
    @IBOutlet var saveBtn: UIBarButtonItem!
    @IBOutlet weak var pickedImage: UIImageView!
       
    @IBAction func createAlbumButton(_ sender: Any) {
        
    }
    
    @IBAction func saveImageToFolder(_ sender: Any) {
        //let imageData = UIImageJPEGRepresentation(pickedImage.image!, 0.6)
        //let compressedJPEGImage = UIImage(data: imageData!)
        //UIImageWriteToSavedPhotosAlbum(compressedJPEGImage!, nil, nil, nil)
        //CustomPhotoAlbum.albumName = "New cooking album"
        //CustomPhotoAlbum.shared.save(image: compressedJPEGImage!)
        //saveNotice()
    }
    @IBAction func activateCameraAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func selectPhotoButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(saveNotice(n:)), name: NSNotification.Name(rawValue: "successMsg"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(saveAlbumNotice(n:)), name: NSNotification.Name(rawValue: "createAlbumSuccess"), object: nil)
        
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = nil;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AlbumTableViewController" {
            let navController = segue.destination as? UINavigationController
            let albumTableViewController = navController?.viewControllers.first as! AlbumTableViewController
            
            let imageData = UIImageJPEGRepresentation(pickedImage.image!, 0.6)
            let compressedJPEGImage = UIImage(data: imageData!)
            albumTableViewController.image = compressedJPEGImage
        } else {
            return
        }
    }
    
    @objc
    func saveAlbumNotice(n: Notification) {
        let alertController = UIAlertController(title: "Album Saved!", message: "Your album was successfully saved", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc
    func saveNotice(n: Notification) {
        let alertController = UIAlertController(title: "Image Saved!", message: "Your picture was successfully saved", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        pickedImage.image = image
        navigationItem.leftBarButtonItem = self.saveBtn
        self.dismiss(animated: true, completion: nil);

    }
}
