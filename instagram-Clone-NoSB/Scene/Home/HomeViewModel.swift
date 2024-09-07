//
//  HomeViewModel.swift
//  instagram-Clone-NoSB
//
//  Created by Samet Korkmaz on 6.09.2024.
//

import Foundation

protocol HomeViewModelInterface{
    var view: HomeViewControllerInterface? { get set}
    
    func viewDidload()
}

final class HomeViewModel{
    weak var view: HomeViewControllerInterface?
    var appTitkle: String = "samstagram"
    

}

extension HomeViewModel: HomeViewModelInterface{
    
    func viewDidload() {
        view?.configureHomePage()
    }
}
