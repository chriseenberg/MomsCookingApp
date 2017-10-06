//
//  AlbumTableViewController.swift
//  Moms Cooking App
//
//  Created by Christoffer Eenberg on 16/09/2017.
//  Copyright © 2017 Christoffer Eenberg. All rights reserved.
//

import UIKit

class AlbumTableViewController: UITableViewController {
    var albums = [AlbumModel]()
    var image: UIImage?
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        albums = CustomPhotoAlbum.shared.getAllPhotoAlbums()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableViewSimcard: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.tableView.rowHeight = 75
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        cell.albumName?.text = albums[indexPath.row].name
        let count = String(albums[indexPath.row].count)
        cell.count?.text = count + " pictures in album"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(albums.count)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = albums[indexPath.row]
        UDService.albumName = album.name
        CustomPhotoAlbum.albumName = album.name
        CustomPhotoAlbum.shared.save(image: image!)
        dismiss(animated: true, completion: notifySuccess)
    }
    
    private func notifySuccess() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "successMsg"), object: nil)
    }
}
