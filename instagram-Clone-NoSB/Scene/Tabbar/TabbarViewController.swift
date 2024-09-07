//
//  TabbarViewController.swift
//  instagram-Clone-NoSB
//
//  Created by Samet Korkmaz on 6.09.2024.
//

import UIKit

class TabbarViewController: UITabBarController, UITabBarControllerDelegate {

    private var selectionIndicator: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabbar()
        self.delegate = self
        //setupSelectionIndicator()
    }
    

    func configureTabbar(){
        tabBar.tintColor = .white
        tabBar.backgroundColor = .black
        tabBar.unselectedItemTintColor = .white
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let searchVC = SearchViewController()
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        let postVC = PostViewController()
        postVC.tabBarItem = UITabBarItem(title: "Post", image: UIImage(systemName: "plus.app"), selectedImage: UIImage(systemName: "plus.app.fill"))
        let notificationVC = NotificationViewController()
        notificationVC.tabBarItem = UITabBarItem(title: "Like", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        self.viewControllers = [homeVC, searchVC, postVC, notificationVC, profileVC]
    }
    
 /*   // Çizgi için UIView ekleme
    func setupSelectionIndicator() {
        let indicatorHeight: CGFloat = 3
        selectionIndicator = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width / CGFloat(tabBar.items?.count ?? 1), height: indicatorHeight))
        selectionIndicator.backgroundColor = .white
        tabBar.addSubview(selectionIndicator)
        
        updateIndicatorPosition(selectedIndex: selectedIndex)
    }

    // Seçilen index'e göre çizgiyi hareket ettir
    func updateIndicatorPosition(selectedIndex: Int) {
        let tabBarItemWidth = tabBar.frame.width / CGFloat(tabBar.items?.count ?? 1)
        UIView.animate(withDuration: 0.15) {
            self.selectionIndicator.frame.origin.x = CGFloat(selectedIndex) * tabBarItemWidth
        }
    }

    // Tab bar item seçildiğinde çizginin pozisyonunu güncelle
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let index = viewControllers?.firstIndex(of: viewController) else { return }
        updateIndicatorPosition(selectedIndex: index)
    } */
}

#Preview("UIKit"){
    TabbarViewController()
}
