//
//  MyTextAlertView.swift
//  SwiftUI_Webview2
//
//  Created by hyorin song on 2021/12/26.
//

import Foundation
import UIKit
import SwiftUI

struct MyTextAlertView : UIViewControllerRepresentable {
    
    @Binding var textString: String
    @Binding var showAlert: Bool
    
    var title: String
    var message: String
    
    //처음
    func makeUIViewController(context: UIViewControllerRepresentableContext<MyTextAlertView>) ->  UIViewController {
        return UIViewController()
    }
    
    //값이 변경될때
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<MyTextAlertView>) {
        
        //uiAlertController가 없을때만 띄우겠다
        guard context.coordinator.uiAlertController == nil else {return}
        
        //showAlert 이 트루라면
        if self.showAlert{
            let uiAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            //alert 띄우겠다
            uiAlertController.addTextField(configurationHandler: { textField in
            textField.placeholder = "전달할 값을 입력하세요"
            textField.text = self.textString
            })
                
            uiAlertController.addAction(UIAlertAction(title: "취소", style: .destructive, handler: { _ in
                print("취소가 클릭되었다.")
                self.textString = ""
            }))
                
            uiAlertController.addAction(UIAlertAction(title: "보내기", style: .destructive, handler: { _ in
                print("취소가 클릭되었다.")
                if let textField = uiAlertController.textFields?.first,
                   let inputText = textField.text {
                    self.textString = inputText
                }
                
                uiAlertController.dismiss(animated: true, completion: {
                    print("보내기 버튼 클릭")
                    //self.textString = ""
                    self.showAlert = false
                })
            }))
            DispatchQueue.main.async {
                uiViewController.present(uiAlertController, animated: true, completion: {
                    self.showAlert = false
                    context.coordinator.uiAlertController = nil
                })
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        MyTextAlertView.Coordinator(self)
    }
    
    //중간의 매개체 UIKit의 델리겟 등의 이벤트를 받아주는 역할
    class Coordinator : NSObject {
        var uiAlertController: UIAlertController? //UIKit 뷰
        
        var myTextAlertView: MyTextAlertView //SwiftUi 뷰
        
        init(_ myTextAlertView : MyTextAlertView) {
            self.myTextAlertView = myTextAlertView
        }
    }
}

extension MyTextAlertView.Coordinator : UITextFieldDelegate {
    //글자가 입력이 될때
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string :String) -> Bool {
        if let text = textField.text as NSString? {
            self.myTextAlertView.textString = text.replacingCharacters(in: range, with: string)
        } else {
            self.myTextAlertView.textString = ""
        }
        return true
    }
}
