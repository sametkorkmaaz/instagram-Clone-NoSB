//
//  HomeStoryCollectionViewCell.swift
//  instagram-Clone-NoSB
//
//  Created by Samet Korkmaz on 6.09.2024.
//

import UIKit

class HomeStoryCollectionViewCell: UICollectionViewCell {
    
    // Yuvarlak ImageView
    private let storyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40 // Boyutun yarısı (80x80 için)
        imageView.layer.masksToBounds = true // Köşeler dışındaki alanı kırp
        imageView.layer.borderColor = UIColor.red.cgColor // Sınır rengi
        imageView.layer.borderWidth = 2 // Sınır kalınlığı
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    // Altına Label
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Görünümleri hücreye ekleme
        contentView.addSubview(storyImageView)
        contentView.addSubview(nameLabel)
        
        // Auto Layout kısıtlamaları
        NSLayoutConstraint.activate([
            // ImageView'in ortada ve üstte olması
            storyImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            storyImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 0.8),
            storyImageView.widthAnchor.constraint(equalTo: storyImageView.heightAnchor),
            storyImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            nameLabel.leadingAnchor.constraint(equalTo: storyImageView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: storyImageView.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: storyImageView.bottomAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // İçeriği ayarlamak için yardımcı bir fonksiyon
    func configure(image: UIImage, name: String) {
        storyImageView.image = UIImage(named: "profilePhoto")
        nameLabel.text = name
    }
}

#Preview("UIKit"){
    HomeViewController()
}
