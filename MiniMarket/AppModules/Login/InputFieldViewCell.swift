//
//  LoginTableViewCell.swift
//  MiniMarket
//
//  Created by Sidney Okine on 11/10/2022.
//

import UIKit

class InputFieldViewCell: UITableViewCell,UITextFieldDelegate {
    var inputFieldTextChange:((UITextField)->Void)?

    lazy var flagView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "flag")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    lazy var numLabel: UILabel = {
       let num = UILabel()
        num.translatesAutoresizingMaskIntoConstraints = false
        num.text = "+233"
        num.textColor = .black
        num.font = UIFont(name: "Gilroy-Semibold", size: 22)
        
        return num
    }()
    
    lazy var numberTextField: UITextField = {
        let numField = UITextField()
        let PlaceholderColor = NSAttributedString(string: "My Placeholder",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            numField.attributedPlaceholder = PlaceholderColor
            
        
        numField.translatesAutoresizingMaskIntoConstraints = false
        numField.placeholder = "eg. 0552012316"
        numField.font = UIFont(name: "Gilroy-Semibold", size: 22)
        numField.textColor = .black
        numField.backgroundColor = .clear
        numField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        numField.keyboardType = .numberPad
        numField.addTarget(self, action:#selector(textFieldDidChange(_:)), for: .editingChanged)
        
        return numField
    }()
    
    @objc func textFieldDidChange(_ textField: UITextField) {
          inputFieldTextChange?(textField)
        
    }
    lazy var bottomLine: UIView = {
       let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor.black
        
        return line
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(flagView)
        contentView.addSubview(numLabel)
        contentView.addSubview(numberTextField)
        contentView.addSubview(bottomLine)
        setupConstraints()
        numberTextField.delegate = self

    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For mobile numer validation
        if textField == numberTextField {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    func setupConstraints(){
        
        flagView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        flagView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        flagView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        flagView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25).isActive = true

        numLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17).isActive = true
        numLabel.leftAnchor.constraint(equalTo: flagView.rightAnchor, constant: 10).isActive = true


        numberTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3.5).isActive = true
        numberTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-100).isActive = true
        numberTextField.leftAnchor.constraint(equalTo: numLabel.rightAnchor, constant: 15).isActive = true

        bottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomLine.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-50).isActive = true
        bottomLine.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        bottomLine.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 3).isActive = true
    }
    
}
