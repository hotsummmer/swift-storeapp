//
//  StorePresenter.swift
//  StoreApp
//
//  Created by 조재흥 on 19. 4. 19..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

class StorePresenter: NSObject {

    private let storeItems = StoreItems()
    
}

extension StorePresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeItems.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeItemCell",
                                                 for: indexPath)
        return cell
    }
}