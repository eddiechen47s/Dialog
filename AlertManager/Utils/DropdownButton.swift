//
//  DialogButtonView.swift
//  AlertManager
//
//  Created by Eddie on 2021/7/29.
//

//import UIKit
//
//class DropdownButton: UIButton {
//    
//    var height = NSLayoutConstraint()
//    var dropView = DropDownView()
//    var isOpen: Bool = false
//    
//    override init(frame: CGRect) {
//        super.init(frame: .zero)
//        self.backgroundColor = .orange
//
//        dropView = DropDownView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        dropView.translatesAutoresizingMaskIntoConstraints = false
//        self.superview?.addSubview(dropView)
//        self.superview?.bringSubviewToFront(dropView)
////        self.addSubview(dropView)
//            dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//            dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//            dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
//            height = dropView.heightAnchor.constraint(equalToConstant: 0)
//
//   
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if !isOpen {
//            isOpen = true
//            NSLayoutConstraint.activate([self.height])
//            self.height.constant = 200
//            if dropView.tableView.contentSize.height > 200 {
//                self.height.constant = 150
//            } else {
//                self.height.constant = self.dropView.tableView.contentSize.height
//            }
//            NSLayoutConstraint.activate([self.height])
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
//                self.dropView.layoutIfNeeded()
//                self.dropView.center.y += self.dropView.frame.height / 2
//            }, completion: nil)
//        } else {
//            isOpen = false
//            NSLayoutConstraint.activate([self.height])
//            self.height.constant = 0
//            NSLayoutConstraint.activate([self.height])
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
//                self.dropView.layoutIfNeeded()
//                self.dropView.center.y -= self.dropView.frame.height / 2
//            }, completion: nil)
//        }
//    }
//    
//    override func didMoveToSuperview() {
//
//    }
//    
//////    willRemoveSubview
////    override func willRemoveSubview(_ subview: UIView) {
////        dropView = DropDownView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
////        self.superview?.addSubview(dropView)
////        self.superview?.bringSubviewToFront(dropView)
////        dropView.translatesAutoresizingMaskIntoConstraints = false
////        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
////        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
////        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
////        height = dropView.heightAnchor.constraint(equalToConstant: 0)
////    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//}
