//
//  HomeViewController.swift
//  instagram-Clone-NoSB
//
//  Created by Samet Korkmaz on 6.09.2024.
//

import UIKit

protocol HomeViewControllerInterface: AnyObject {
    func configureHomePage()
}

final class HomeViewController: UIViewController {
    private lazy var viewModel = HomeViewModel()
    
    private let appLogo: UIImageView = UIImageView()
    private let appTitle: UILabel = UILabel()
    private let dmMessagebutton: UIButton = UIButton()
    private var collectionView: UICollectionView!
    private let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidload()
    }
}

extension HomeViewController: HomeViewControllerInterface {
    
    func configureHomePage() {
        view.backgroundColor = .black
        
        // --MARK: App Logo
        view.addSubview(appLogo)
        appLogo.translatesAutoresizingMaskIntoConstraints = false
        appLogo.image = UIImage(named: "instaLogo")
        
        // --MARK: App Title
        view.addSubview(appTitle)
        appTitle.translatesAutoresizingMaskIntoConstraints = false
        appTitle.text = viewModel.appTitkle
        appTitle.textColor = .white
        appTitle.font = UIFont(name: "Futura", size: 28)
        
        // --MARK: DM Message Button
        view.addSubview(dmMessagebutton)
        dmMessagebutton.translatesAutoresizingMaskIntoConstraints = false
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .bold, scale: .large)
        let largeImage = UIImage(systemName: "message", withConfiguration: largeConfig)
        dmMessagebutton.setImage(largeImage, for: .normal)
        dmMessagebutton.tintColor = .white
        dmMessagebutton.addTarget(self, action: #selector(dmButtonnTapped), for: .touchUpInside)
        
        // --MARK: CollectionView
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 8
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Hücreyi kayıt etme (ReuseIdentifier ile)
        collectionView.register(HomeStoryCollectionViewCell.self, forCellWithReuseIdentifier: "storyCell")
        view.addSubview(collectionView)
        
        // --MARK: TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomePostTableViewCell.self, forCellReuseIdentifier: HomePostTableViewCell.Identifier.custom.rawValue)
        tableView.backgroundColor = .black
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        
        // Auto Layout constraints
        NSLayoutConstraint.activate([
            appLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            appLogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            appLogo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            
            appTitle.leadingAnchor.constraint(equalTo: appLogo.trailingAnchor, constant: 10),
            appTitle.topAnchor.constraint(equalTo: appLogo.topAnchor),
            appTitle.bottomAnchor.constraint(equalTo: appLogo.bottomAnchor),
            
            dmMessagebutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            dmMessagebutton.topAnchor.constraint(equalTo: appLogo.topAnchor),
            dmMessagebutton.bottomAnchor.constraint(equalTo: appLogo.bottomAnchor),
            dmMessagebutton.heightAnchor.constraint(equalTo: appLogo.heightAnchor),
            dmMessagebutton.widthAnchor.constraint(equalTo: appLogo.widthAnchor),
            
            collectionView.topAnchor.constraint(equalTo: appLogo.bottomAnchor, constant: 9),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func dmButtonnTapped(){
        let DM_VC = DMViewController()
        DM_VC.modalPresentationStyle = .fullScreen // Sayfayı tam ekran olarak sunma (opsiyonel)
        present(DM_VC, animated: true, completion: nil)
        
    }
}
//--MARK: CollectionView Extension
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // DataSource ve Delegate metodları
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // 10 öğe gösterilecek
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // dequeueReusableCell kullanarak hücreyi yeniden kullan
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyCell", for: indexPath) as! HomeStoryCollectionViewCell
        cell.configure(image: UIImage(systemName: "person")!, name: "samet.krkmzz")
        return cell
    }
}
//--MARK: TableView Extension
extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: HomePostTableViewCell = tableView.dequeueReusableCell(withIdentifier: HomePostTableViewCell.Identifier.custom.rawValue) as? HomePostTableViewCell else{
            return UITableViewCell()
        }
        cell.backgroundColor = .white
        cell.cellDataModel(model: PostModel(username: "samet.krkmzz", imageURL: ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height * 0.45
    }
    
}
#Preview("UIKit"){
    TabbarViewController()
}
