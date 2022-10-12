//
//  LoginViewController.swift
//  MiniMarket
//
//  Created by Sidney Okine on 10/10/2022.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    let inputFieldViewCell = InputFieldViewCell()
    let buttonCell = ButtonTableViewCell()
    
    lazy var bannerImage: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = #imageLiteral(resourceName: "6011")
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your phone number \nto get started"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Gilroy-Semibold", size: 30)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    lazy var TableViewHolder : UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(InputFieldViewCell.self, forCellReuseIdentifier: "input")
        table.register(ButtonTableViewCell.self, forCellReuseIdentifier: "button")
        table.allowsSelection = false
        table.isScrollEnabled = true
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9960784314, blue: 0.9960784314, alpha: 1)
        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        setupViews()
        
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    func setupViews(){
        view.addSubview(bannerImage)
        view.addSubview(textLabel)
        view.addSubview(TableViewHolder)
        bannerImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2.2).isActive = true
        bannerImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        bannerImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -15).isActive = true
        
        textLabel.topAnchor.constraint(equalTo: bannerImage.bottomAnchor, constant: 30).isActive = true
        textLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        TableViewHolder.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20).isActive = true
        TableViewHolder.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        TableViewHolder.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        TableViewHolder.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    }
    
}

extension LoginViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.section){
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "input", for: indexPath) as! InputFieldViewCell
                   cell.contentView.backgroundColor = .clear
                   return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "button", for: indexPath) as! ButtonTableViewCell
                   cell.contentView.backgroundColor = .clear
            return cell
        }
        
    }
    
    
}
