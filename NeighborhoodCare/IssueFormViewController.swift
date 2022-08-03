//
//  IssueFormViewController.swift
//  NeighborhoodCare
//
//  Created by Juliano Costa Silva on 02/08/22.
//

import UIKit

class IssueFormViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldLocation: UITextField!
    @IBOutlet weak var textViewDescription: UITextView!
    @IBOutlet weak var imageViewIssue: UIImageView!
    @IBOutlet weak var buttonAddEdit: UIButton!
    
    var issue: Issue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let issue = issue {
            title = "Edit issue"
            textFieldName.text = issue.name
            textFieldLocation.text = issue.location
            textViewDescription.text = issue.desc
            buttonAddEdit.setTitle("Save Edited Issue", for: .normal)
            if let image = issue.image {
                imageViewIssue.image = UIImage(data: image)
            }
        }
    }

    private func selectPicture(_ sourceType: UIImagePickerController.SourceType) {
        view.endEditing(true)
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func selectImage(_ sender: Any) {
        let alert = UIAlertController(title: "Select image", message: "Select image source.", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
                self.selectPicture(.camera)
            }
            alert.addAction(cameraAction)
        }
        
        let libraryAction = UIAlertAction(title: "Foto Library", style: .default) { _ in
            self.selectPicture(.photoLibrary)
        }
        alert.addAction(libraryAction)
        
        let photosAction = UIAlertAction(title: "Foto Album", style: .default) { _ in
            self.selectPicture(.savedPhotosAlbum)
        }
        alert.addAction(photosAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        if issue == nil {
            issue = Issue(context: context)
        }
        issue?.name = textFieldName.text
        issue?.desc = textViewDescription.text
        issue?.location = textFieldLocation.text
        issue?.date = Date()
        issue?.image = imageViewIssue.image?.jpegData(compressionQuality: 0.9)
        
        do {
            try context.save()
            navigationController?.popViewController(animated: true)
        } catch {
            print(error)
        }
    }
}

extension IssueFormViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            imageViewIssue.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
}
