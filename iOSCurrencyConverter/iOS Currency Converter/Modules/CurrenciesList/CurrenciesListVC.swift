//
//  CurrenciesListVC.swift
//  WiseCurrencyConverter
//
//  Created by Roman Resenchuk on 10-08-2023.
//

import UIKit

protocol CurrenciesListView: AnyObject {
    func refreshTable()
    func showError(message: String)
}

final class CurrenciesListVC: UIViewController, CurrenciesListView, Themed {
    
    // Section: - Themed Protocol Properties
    
    var theme: ThemeProvider = AppTheme.shared
    
    // Section: - Properties
    
    var presenter: CurrenciesListPresentable!
    
    // Section: - UI Properties
    
    @UsingAutoLayout private var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        return button
    }()
    
    @UsingAutoLayout private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose a currency"
        label.textAlignment = .left
        return label
    }()
    
    @UsingAutoLayout private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.autocorrectionType = .no
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search for a currency"
        return searchBar
    }()
    
    @UsingAutoLayout private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CurrencyCell.self, forCellReuseIdentifier: CurrencyCell.reuseIdentifier)
        return tableView
    }()
    
    // Section: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchCurrencies()
        setupTableView()
        setupSearchBar()
        setupUI()
        setupConstraints()
        setupUserInteraction()
        applyTheme()
    }
    
    // Section: - Setup Methods
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CurrencyCell.self, forCellReuseIdentifier: CurrencyCell.reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .interactive
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(titleLabel)
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            closeButton.widthAnchor.constraint(equalToConstant: 44),
            closeButton.heightAnchor.constraint(equalTo: closeButton.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupUserInteraction() {
        let closeAction = UIAction { [weak self] _ in
            self?.presenter.close()
        }
        closeButton.addAction(closeAction, for: .touchUpInside)
    }
    
    // Section: - View Protocol Methods
    
    func refreshTable() {
        tableView.reloadData()
    }
    
    func showError(message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default
        )
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // Section: Themed Protocol Methods
    
    func applyTheme() {
        view.backgroundColor = theme.mainBackgroundColor
        titleLabel.font = theme.titleFont
    }
}

extension CurrenciesListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.itemsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.reuseIdentifier, for: indexPath) as! CurrencyCell
        let items = presenter.items()
        cell.setup(with: items[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CurrencyCell.defaultHeight
    }
}

extension CurrenciesListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(index: Int(indexPath.row))
    }
}

// Section: - UISearchBarDelegate methods

extension CurrenciesListVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.didChangeSearchText(searchText: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
