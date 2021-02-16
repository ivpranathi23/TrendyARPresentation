//
//  PickImagesForARViewController.swift
//  TrendyARPresentaion
//
//  Created by Venkata Pranathi on 10/08/19.
//  Copyright © 2019 RNTBCI. All rights reserved.
//

import UIKit
import  Photos

class PickImagesForARViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var selectImagesButton: UIButton!
    var selectedImages: [UIImage] = [UIImage]()
    
    var imagePickerController = UIImagePickerController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func checkPermsionToAccessGallery() {
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                    self.selectPhotofromlibrary()
                } else {
                    self.displayPermissionAlert()
                }
            })
        } else if photos == .authorized {
            self.selectPhotofromlibrary()
        } else if photos == .restricted || photos == .denied {
            self.displayPermissionAlert()
        }
        
    }
    
    func displayPermissionAlert() {
        let alert = UIAlertController(title: "Photo Library", message: "Photo Library access is absolutely necessary to use this app. Please enable it in Settings.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!)
        }))
        self.present(alert, animated: true)
    }
    
    func displayAlertMsg(alertMsg: String) {
        let alert = UIAlertController(title: "Alert", message: alertMsg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func selectPhotofromlibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
            self.imagePickerController.delegate = self
            self.imagePickerController.sourceType = .photoLibrary
            self.imagePickerController.allowsEditing = false
            
            self.present(self.imagePickerController, animated: true, completion: nil)
        }
    }

    @IBAction func selectImageButtonTapped(_ sender: Any) {
        self.checkPermsionToAccessGallery()
    }

    
    @IBAction func nextButtonTapped(_ sender: Any) {
        if self.selectedImages.count < 5 {
            self.displayAlertMsg(alertMsg: "You should select exactly 5 photos")
        } else {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "arvc") as? ViewController
            vc?.images = self.selectedImages
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let imageselected = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return
        }
        selectedImages.append(imageselected)
        if self.selectedImages.count == 0 {
            self.selectImagesButton.setTitle("Please select 5 More Images", for: .normal)
        } else if self.selectedImages.count == 1 {
            self.selectImagesButton.setTitle("Please select 4 More Images", for: .normal)

        } else if self.selectedImages.count == 2 {
            self.selectImagesButton.setTitle("Please select 3 More Images", for: .normal)
            
        } else if self.selectedImages.count == 3 {
            self.selectImagesButton.setTitle("Please select 2 More Images", for: .normal)
            
        } else if self.selectedImages.count == 4 {
            self.selectImagesButton.setTitle("Please select 1 More Image", for: .normal)
            
        } else if selectedImages.count == 5 {
            self.selectImagesButton.isHidden = true
        }
        
        self.imagePickerController.dismiss(animated: true, completion: nil)
        self.imagesCollectionView.reloadData()
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.imagePickerController.dismiss(animated: true, completion: nil)
    }
    
}

extension PickImagesForARViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.selectedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pickImageCell", for: indexPath) as? ImagePickerCollectionViewCell
        cell?.photoImageView.image = self.selectedImages[indexPath.row]
        return cell!
    }
    
}
