//
//  ExploreVC.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit

class ExploreVC: UIViewController {

    //presentation
    var presenter: ExplorePresentation!

    //OUTLETS
    @IBOutlet weak var tableView: UITableView!
    private var videosArr = [VideoElement]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- configUI
    private func configUI(){
        tableView.register(UINib(nibName: "VideoContainerCell", bundle: nil), forCellReuseIdentifier: "VideoContainerCell")
        presenter.displayCategory(filename: .Assignment)
    }
}

//MARK:- ExploreVC Use Cases
extension ExploreVC: ExploreView{
    func didCategoryRecieved(videos: [VideoElement]) {
        videosArr = videos
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else{return}
            self.tableView.reloadData()
        }
    }
    
    func didErrorOccured() {
        print("error in loading json")
    }
}

//MARK:- UITableViewDelegate
extension ExploreVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREEN.height.load / 2 - 100
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return videosArr.count
    }
    
}

//MARK:- UITableViewDataSource
extension ExploreVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoContainerCell", for: indexPath) as? VideoContainerCell else {return UITableViewCell()}
        cell.presenter = presenter
        cell.titleLbl.text = videosArr[indexPath.section].title
        cell.VideoInfo = videosArr[indexPath.section].nodes
        return cell
    }
    
    
}
