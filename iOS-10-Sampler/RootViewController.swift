//
//  ViewController.swift
//  iOS-10-Sampler
//
//  Created by Shuichi Tsutsumi on 9/3/16.
//  Copyright © 2016 Shuichi Tsutsumi. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {

    private let dataSource = SampleDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    // MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.samples.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? RootViewCell else {fatalError()}
        
        let sample = dataSource.samples[(indexPath as NSIndexPath).row]
        cell.showSample(sample)
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sample = dataSource.samples[(indexPath as NSIndexPath).row]
        
        navigationController?.pushViewController(sample.controller(), animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

