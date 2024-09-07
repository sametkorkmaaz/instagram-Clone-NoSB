//
//  SearchViewModel.swift
//  instagram-Clone-NoSB
//
//  Created by Samet Korkmaz on 6.09.2024.
//

import Foundation


protocol SearchViewModelInterface{
    var view: SearchViewInterface? { get set}
    
    func viewDidload()
}

final class SearchViewModel{
    weak var view: SearchViewInterface?
    
}

extension SearchViewModel: SearchViewModelInterface{
    func viewDidload() {
        view?.configurePage()
    }
    
    
    
}
