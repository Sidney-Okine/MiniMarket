//
//  ButtonTableViewCell.swift
//  MiniMarket
//
//  Created by Sidney Okine on 12/10/2022.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = true
        button.layer.cornerRadius = 10.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = #colorLiteral(red: 0.3490196078, green: 0.3333333333, blue: 0.5450980392, alpha: 1).cgColor
        button.layer.masksToBounds = true
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Gilroy-Semibold", size: 22)
        button.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3333333333, blue: 0.5450980392, alpha: 1)
        
        return button
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(continueButton)
        setupConstraints()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    func setupConstraints(){
        continueButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        continueButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 22).isActive = true
        continueButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -22).isActive = true

    }
    
}
