//
//  CategoriesTableViewController.swift
//  Embark
//
//  Created by Emmanuoel Haroutunian on 1/9/18.
//  Copyright © 2018 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
			
    }

}

extension CategoriesTableViewController {
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
}
