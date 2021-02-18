//
//  MainTableViewController.swift
//  TestApp
//
//  Created by Mac on 2/14/21.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private var mainViewModel: MainViewModelType?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Missed calls"
        self.tableView.separatorStyle = .none
        self.tableView.register(WithoutNameTableViewCell.self, forCellReuseIdentifier: "cellWithoutName")
        
        mainViewModel = MainViewModel()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return mainViewModel?.numberOfRows() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let mainViewModel = mainViewModel,
              let cellViewModel = mainViewModel.cellViewModel(forIndexPath: indexPath) else { return UITableViewCell() }
        
        if let _ = cellViewModel.name {
            let cellWithName = tableView.dequeueReusableCell(withIdentifier: "cellWithName", for: indexPath) as! WithNameTableViewCell
            cellWithName.contactViewModel = cellViewModel
            return cellWithName
        } else {
            let cellWithoutName = tableView.dequeueReusableCell(withIdentifier: "cellWithoutName", for: indexPath) as! WithoutNameTableViewCell
            cellWithoutName.contactViewModel = cellViewModel
            return cellWithoutName
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.cellForRow(at: indexPath)?.selectionStyle = .none
        
        guard let mainViewModel = mainViewModel,
              let contactViewModel = mainViewModel.contactViewModel(forIndexPath: indexPath) else { return }
        
        let contactViewController = ContactViewController(contactViewModel: contactViewModel as! ContactViewModel, nibName: nil, bundle: nil)
        contactViewController.view.backgroundColor = .white
        contactViewController.title = "Missed call"
        let navigationController = UINavigationController(rootViewController: contactViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
}
