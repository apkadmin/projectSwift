//
//  View.swift
//  demo23
//
//  Created by An Nguyen on 12/4/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit

class UITextFieldAnimated: UIView {

  private var usernameLabelYAnchorConstraint: NSLayoutConstraint!
  private var usernameLabelLeadingAnchor: NSLayoutConstraint!

  public lazy var Label: UILabel! = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.alpha = 0.5
    return label
  }()

  public lazy var Input: UITextField! = {
    let textLabel = UITextField()
    textLabel.translatesAutoresizingMaskIntoConstraints = false
    return textLabel
  }()

  init() {
    super.init(frame: UIScreen.main.bounds)
    addSubview(Input)
    addSubview(Label)
    Input.delegate = self
    configureViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

    

  func configureViews() {
    let margins = self.layoutMarginsGuide
    
    usernameLabelYAnchorConstraint = Label.centerYAnchor.constraint(equalTo: Input.centerYAnchor, constant: 0)
    usernameLabelLeadingAnchor = Label.leadingAnchor.constraint(equalTo: Input.leadingAnchor, constant: 5)
   
    NSLayoutConstraint.activate([
      Input.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
      Input.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
      Input.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
      Input.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
      Input.topAnchor.constraint(equalTo: margins.topAnchor),
      Input.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
        usernameLabelYAnchorConstraint,
             usernameLabelLeadingAnchor,
        
    ])
  }

}

extension UITextFieldAnimated: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    return textField.resignFirstResponder()
  }

  func textFieldDidBeginEditing(_ textField: UITextField) {
    usernameLabelYAnchorConstraint.constant = -25
    usernameLabelLeadingAnchor.constant = 0
    performAnimation(transform: CGAffineTransform(scaleX: 0.8, y: 0.8))
  }

  func textFieldDidEndEditing(_ textField: UITextField) {
    if let text = textField.text, text.isEmpty {
      usernameLabelYAnchorConstraint.constant = 0
      usernameLabelLeadingAnchor.constant = 5
      performAnimation(transform: CGAffineTransform(scaleX: 1, y: 1))
    }
  }

  fileprivate func performAnimation(transform: CGAffineTransform) {
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
      self.Label.transform = transform
      self.layoutIfNeeded()
    }, completion: nil)
  }
}

