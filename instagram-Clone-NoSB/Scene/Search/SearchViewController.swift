//
//  SearchViewController.swift
//  instagram-Clone-NoSB
//
//  Created by Samet Korkmaz on 6.09.2024.
//

import UIKit

protocol SearchViewInterface: AnyObject{
    func configurePage()
}

final class SearchViewController: UIViewController {
    private lazy var viewModel = SearchViewModel()
    
    private let searcBar: UISearchBar = UISearchBar()
    private let detayButton: UIButton = UIButton()
    private var searchTableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidload()
    }

}

extension SearchViewController: SearchViewInterface{
    
    func configurePage() {
        view.backgroundColor = .black
        //--MARK: SearchBar
        searcBar.placeholder = "Ara"
        searcBar.barTintColor = .black
        searcBar.tintColor = .white
        searcBar.searchTextField.textColor = .white
        searcBar.searchTextField.tintColor = .white
        searcBar.searchBarStyle = .minimal
        searcBar.searchTextField.backgroundColor = .darkGray
        // Placeholder metni ve büyüteç rengini değiştirme
        if let textField = searcBar.value(forKey: "searchField") as? UITextField {
            // Placeholder rengi
            textField.attributedPlaceholder = NSAttributedString(string: "Ara", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            // Büyüteç simgesi ve yazı rengi
            textField.leftView?.tintColor = .white
            textField.textColor = .white
        }
        
        //--MARK: detayButton Draw
        detayButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        detayButton.tintColor = .white

        // --MARK: TableView
        searchTableView.backgroundColor = .black
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.Identifier.custom.rawValue)        //--MARK: AddSubView
        [searcBar, detayButton, searchTableView].forEach{
            view.addSubview($0)
        }
        //--MARK: Trans Auto
        [searcBar, detayButton, searchTableView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        searchTableView.dataSource = self
        searchTableView.delegate = self
        

        NSLayoutConstraint.activate([
            searcBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searcBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searcBar.trailingAnchor.constraint(equalTo: detayButton.leadingAnchor),
            searcBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            detayButton.topAnchor.constraint(equalTo: searcBar.topAnchor),
            detayButton.bottomAnchor.constraint(equalTo: searcBar.bottomAnchor),
            detayButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            detayButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.12),
            
            searchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchTableView.topAnchor.constraint(equalTo: searcBar.bottomAnchor,constant: 0),
            searchTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    
    
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: SearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.Identifier.custom.rawValue, for: indexPath) as? SearchTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height * 0.3
    }
    
    
}

#Preview(){
    SearchViewController()
}
