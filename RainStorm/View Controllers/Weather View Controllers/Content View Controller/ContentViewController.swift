//
//  WeakViewController.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/3/22.
//

import UIKit


protocol ContentViewControllerDelegate: AnyObject {
        func controllerDidRefresh(_ controller: ContentViewController)
    }

final class ContentViewController: UIViewController {
    
    weak var delegate: ContentViewControllerDelegate?
    
    var viewModel: ContentViewModel! {
        didSet {
            refreshControl.endRefreshing()
            guard let viewModel = viewModel else {
                return
            }
            
            setupViewModel(viewModel: viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.isHidden = true
            tableView.rowHeight = UITableView.automaticDimension
            tableView.dataSource = self
            tableView.separatorInset = .zero
            tableView.showsVerticalScrollIndicator = false
            
            tableView.refreshControl = refreshControl
        }
    }
    
    @IBOutlet var tableLoading: UIActivityIndicatorView! {
        didSet {
            tableLoading.startAnimating()
            tableLoading.hidesWhenStopped = true
        }
    }
    
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        
        refreshControl.tintColor = UIColor.base
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        
        return refreshControl
    }()
    
    @objc private func refresh(_ sender: UIRefreshControl) {
        delegate?.controllerDidRefresh(self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
  
    
    func setupViewModel(viewModel: ContentViewModel) {
        tableLoading.stopAnimating()
        
        tableView.reloadData()
        tableView.isHidden = false
    }

}


extension ContentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.numberOfDays ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentTableViewCell.reuseIdentifier, for: indexPath) as? ContentTableViewCell else {
            fatalError("Unable to dequeue Content table view cell")
        }
        
        cell.configureContentTableCell(viewModel: viewModel.tableCellViewModel(indexOfDay: indexPath.row + 1))
        
        
        return cell
    }
    
    
}
