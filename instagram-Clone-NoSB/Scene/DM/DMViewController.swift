//
//  DMViewController.swift
//  instagram-Clone-NoSB
//
//  Created by Samet Korkmaz on 6.09.2024.
//

import UIKit

protocol DMViewControllerInterface: AnyObject{
    func configureDMPage()
}

class DMViewController: UIViewController {
    
    private lazy var viewModel = DMViewModel()

    private let backButton: UIButton = UIButton()
    private let usernamLabel: UILabel = UILabel()
    private let editButton: UIButton = UIButton()
    private let searchBar: UISearchBar = UISearchBar()
    private let mesajTitle: UILabel = UILabel()
    private let isteklerButton: UIButton = UIButton()
    private let dmTableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidload()
    }
    
    @objc func dmBackButtonTapped(){
        dismiss(animated: true, completion: nil)
    }
}

extension DMViewController: DMViewControllerInterface{
    
     func configureDMPage(){
        view.backgroundColor = .black
         
        //--MARK: Back Button
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .bold, scale: .large)
        let largeImage = UIImage(systemName: "arrow.backward", withConfiguration: largeConfig)
        backButton.setImage(largeImage, for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(dmBackButtonTapped), for: .touchUpInside)
         
        //--MARK: Username Label
         usernamLabel.text = viewModel.username
         usernamLabel.textColor = .white
         usernamLabel.font = .systemFont(ofSize: 20, weight: .medium)
         
        //--MARK: Edit Butoon
         let largeImage2 = UIImage(systemName: "square.and.pencil", withConfiguration: largeConfig)
         editButton.setImage(largeImage2, for: .normal)
         editButton.tintColor = .white
         
        //--MARK: SearchBar
         searchBar.placeholder = "Ara"
         searchBar.barTintColor = .black
         searchBar.tintColor = .white
         searchBar.searchTextField.textColor = .white
         searchBar.searchTextField.tintColor = .white
         //search bar da backgraound olmaz
         searchBar.searchBarStyle = .minimal
         searchBar.searchTextField.backgroundColor = .darkGray
         // Placeholder metni ve büyüteç rengini değiştirme
         if let textField = searchBar.value(forKey: "searchField") as? UITextField {
             // Placeholder rengi
             textField.attributedPlaceholder = NSAttributedString(string: "Ara", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
             
             // Büyüteç simgesi ve yazı rengi
             textField.leftView?.tintColor = .white
             textField.textColor = .white
         }
         
        //--MARK: Mesajlar title
         mesajTitle.text = "Mesajlar"
         mesajTitle.textColor = .white
         mesajTitle.font = .systemFont(ofSize: 20, weight: .bold)
        //--MARK: İstekler Button
         isteklerButton.setTitle("İstekler", for: .normal)
         isteklerButton.setTitleColor(UIColor(.white), for: .normal)
         isteklerButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        //--MARK: TableView
         dmTableView.backgroundColor = .black
         dmTableView.dataSource = self
         dmTableView.delegate = self
         dmTableView.register(DMTableViewCell.self, forCellReuseIdentifier: DMTableViewCell.Identifier.custom.rawValue)
        
         
        //--MARK: AddSubView
        [backButton, usernamLabel, editButton, searchBar, mesajTitle, isteklerButton, dmTableView].forEach { view.addSubview($0) }
        //--MARK: TransAuto
        [backButton, usernamLabel, editButton, searchBar, mesajTitle, isteklerButton, dmTableView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        
        NSLayoutConstraint.activate([
        
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            
            usernamLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 16),
            usernamLabel.topAnchor.constraint(equalTo: backButton.topAnchor),
            usernamLabel.bottomAnchor.constraint(equalTo: backButton.bottomAnchor),
            
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            editButton.topAnchor.constraint(equalTo: usernamLabel.topAnchor),
            editButton.bottomAnchor.constraint(equalTo: usernamLabel.bottomAnchor),
            
            searchBar.topAnchor.constraint(equalTo: backButton.bottomAnchor,constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            
            mesajTitle.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 5),
            mesajTitle.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor,constant: 5),
            
            isteklerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            isteklerButton.topAnchor.constraint(equalTo: mesajTitle.topAnchor),
            isteklerButton.bottomAnchor.constraint(equalTo: mesajTitle.bottomAnchor),
            
            dmTableView.topAnchor.constraint(equalTo: mesajTitle.bottomAnchor,constant: 5),
            dmTableView.leadingAnchor.constraint(equalTo: mesajTitle.leadingAnchor),
            dmTableView.trailingAnchor.constraint(equalTo: isteklerButton.trailingAnchor),
            dmTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
}

extension DMViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DMTableViewCell.Identifier.custom.rawValue, for: indexPath) as? DMTableViewCell else{
            return UITableViewCell()
        }

        cell.cellDataModel(model: MessageModel(userImage: "profilePhoto", userName: "samet.krkmzz", messageDetay: "Selam, napıyorsun?"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height * 0.1
    }
    
    
    
}

#Preview("UIKit"){
    TabbarViewController()
}
