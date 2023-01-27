//
//  myViewController.swift
//  assignment_week3_daangn
//
//  Created by 황신아 on 2023/01/06.
//

import UIKit

class myViewController: UIViewController {
    
    @IBAction func myUpLodeBtn(_ sender: Any) {
        
    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "myUploadViewController") as? myUploadViewController else { return }
                self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBOutlet weak var myTableView: UITableView!
    let myImageViewArray = [["my1.jpg","my2.jpg","my3.jpg","my4.jpg"],["my5.jpg","my6.jpg","my7.jpg","my8.jpg"],["my9.jpg","my10.jpg"],["my11.jpg","my12.jpg","my13.jpg"]]
    let myLabelArray = [["내 동네 설정","동네 인증하기","키워드 알림","관심 카테고리 설정"],["모아보기","당근가계부","받은 쿠폰함","내 단골 가게"],["동네생활 글/댓글","동네 가게 후기"],["비즈 프로필 만들기","동네홍보 글","지역광고"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(myTableView)
        
        myTableView.delegate = self
        myTableView.dataSource = self
        self.myTableView.rowHeight = 55
        myTableView.sectionFooterHeight = 0.0
        
        myTableView.register(UINib(nibName: "myTableViewCell", bundle: nil), forCellReuseIdentifier: "myTableViewCell")
       // myTableView.reloadData()
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.text = "나의 당근"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }


  
}

extension myViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return myImageViewArray.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [4,4,2,3][section]
    }
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // 행의 개수
//        return myImageViewArray.count
//    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell UI
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! myTableViewCell
        // indexPath.row => 행을 의미
        
        
        cell.myImage.image = UIImage(named: myImageViewArray[indexPath.section][indexPath.row])
        cell.myLabel.text = myLabelArray[indexPath.section][indexPath.row]
    
        return cell
        
    }
}
