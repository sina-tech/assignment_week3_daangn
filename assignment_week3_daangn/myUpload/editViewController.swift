//
//  editViewController.swift
//  assignment_week3_daangn
//
//  Created by 황신아 on 2023/01/08.
//

import UIKit
import CoreData
import SnapKit


class editViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var editImage: UIImageView!
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var editPriceField: UITextField!
    
    
    
    
    @IBAction func addImage(_ sender: Any) {
        self.showImagePicker(selectedSource: .photoLibrary)
    }
    func showImagePicker(selectedSource: UIImagePickerController.SourceType){
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else{
            print("Selected Source not available")
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = selectedSource
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if var selectedImage = info[.originalImage] as? UIImage{
            editImage.image = selectedImage
        }
        else{
            print("Image not found")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    /////////////////////
    ///
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    let imagePicker = UIImagePickerController() // 사진, 앨범을 열 수 있는 이미지 피커 상수
    
    lazy var textView: UITextView = {
            let textView = UITextView()
            
            textView.font = .systemFont(ofSize: 16.0, weight: .medium)
            //textView.text = "고촌읍에 올릴 게시글 내용을 작성해주세요. (가품 및 판매금지 품목은 게시가 제한될 수 있어요.)"
            textView.backgroundColor = .white
            textView.textColor = .black
            
            textView.delegate = self
            
            return textView
        }()
    
    @IBAction func saveButton(_ sender: Any) {
        
        selectedPost.title = editTextField.text
        selectedPost.price = editPriceField.text
        selectedPost.pickedImage = editImage.image?.jpegData(compressionQuality: 1.0)
        selectedPost.content = textView.text
            
        DBManager.share.saveContext()
        
        dismiss(animated: true, completion: nil)
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textView)
        textView.snp.makeConstraints { make in make.top.equalTo(view.safeAreaLayoutGuide).inset(16.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.height.equalTo(textView.snp.width)
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 450
                                                             , left: 15, bottom: 80, right: 15))
            
            make.top.equalTo(editPriceField.snp.bottom).offset(40)
        }
        
        editTextField.text = selectedPost.title
        editPriceField.text=selectedPost.price
        editImage.image =  UIImage(data: selectedPost.pickedImage ?? Data()) ?? UIImage()
        textView.text = selectedPost.content
        
        self.imagePicker.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .placeholderText else { return }
        textView.textColor = .label
        textView.text = nil
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "고촌읍에 올릴 게시글 내용을 작성해주세요. (가품 및 판매금지 품목은 게시가 제한될 수 있어요.)"
            textView.textColor = .placeholderText
            
        }
        
    }
    

}
