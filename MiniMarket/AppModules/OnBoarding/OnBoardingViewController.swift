//
//  ViewController.swift
//  MiniMarket
//
//  Created by Sidney Okine on 09/10/2022.
//

import UIKit

class OnBoardingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.09019607843, blue: 0.1450980392, alpha: 1)
        
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
        setupViews()
    }

    lazy var mainImage: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = #imageLiteral(resourceName: "girl")
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    lazy var welcome: UILabel = {
        let label = UILabel()
//        guard let gilroyFont = UIFont(name: "Gilroy-ExtraBold", size: UIFont.labelFontSize) else {
//            fatalError("""
//                Failed to load the "CustomFont-Light" font.
//                Make sure the font file is included in the project and the font name is spelled correctly.
//                """
//            )
//        }
        label.font = UIFont(name: "Gilroy-ExtraBold", size: 48)
        label.text = "Welcome \nto our store"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
       return label
    }()
    
    lazy var subtitle: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Get your ingredients faster and cheaper"
        label.textColor = .white
        return label
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = true
        button.layer.cornerRadius = 10.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = #colorLiteral(red: 0.3490196078, green: 0.3333333333, blue: 0.5450980392, alpha: 1).cgColor
        button.layer.masksToBounds = true
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 22)
        button.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3333333333, blue: 0.5450980392, alpha: 1)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapButton(){
        let destinationVC = LoginViewController()
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true)
//        self.navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    func setupViews(){
        view.addSubview(mainImage)
        view.addSubview(welcome)
        view.addSubview(subtitle)
        view.addSubview(continueButton)
        
        mainImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2.2).isActive = true
        mainImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        mainImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        welcome.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 25).isActive = true
        welcome.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        subtitle.topAnchor.constraint(equalTo: welcome.bottomAnchor, constant: 10).isActive = true
        subtitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
        
        continueButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-50).isActive = true
        continueButton.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 40).isActive = true
        continueButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22).isActive = true
        continueButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22).isActive = true
        
    }

}

