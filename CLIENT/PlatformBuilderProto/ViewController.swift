//
//  ViewController.swift
//  PlatformBuilderProto
//
//  Created by aravind on 20/07/20.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    let dataRepository = DataRepository.shared

    var layouts: [Layout] = [] {
        didSet {
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .black
        self.title = "UI Builder"
        prepareBuilderModel()
        
        self.table.delegate = self
        self.table.dataSource = self
        self.table.register(UINib.init(nibName: "LayoutCell", bundle: nil), forCellReuseIdentifier: "LayoutCell")
    }


    
    func prepareBuilderModel() {
        dataRepository.getBinderUI { (builder, result) in
            guard let builder = builder else {return}
            self.layouts = builder
        }
    }
}


extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return layouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LayoutCell") as! LayoutCell
        
        let layout = layouts[indexPath.row]
        cell.setData(id: layout.id, content: layout.title, key: layout.content)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
