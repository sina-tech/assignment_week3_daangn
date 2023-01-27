//
//  chatViewController.swift
//  assignment_week3_daangn
//
//  Created by 황신아 on 2023/01/06.
//

import UIKit

class chatViewController: UIViewController{
    
    @IBOutlet weak var chatTableView: UITableView!
    
    let chatImageView1 = ["c1.jpg","c1.jpg","dg.jpg"]
    let chatImageView2 = ["m1.jpg","m2.jpg",""]
    let chatUilabel1Array = ["Dkgk","몬주","당근이"]
    let chatUilabel2Array = ["원당동 · 1달 전","대화동 · 1달 전","1달 전"]
    let chatUilabel3Array = ["Dkgk님이 이모티콘을 보냈어요.","몬주님이 이모티콘을 보냈어요","(두근두근)하이님의 첫거래 시도를 축하드려요!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        self.chatTableView.rowHeight = 80
        
        chatTableView.register(UINib(nibName: "chatTableViewCell", bundle: nil), forCellReuseIdentifier: "chatTableViewCell")
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.text = "채팅"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }


  
}

extension chatViewController: UITableViewDelegate, UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // 행의 개수
    return chatUilabel2Array.count
}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell UI
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "chatTableViewCell", for: indexPath) as! chatTableViewCell
        // indexPath.row => 행을 의미
        
        
        cell.cImageView1.image = UIImage(named: chatImageView1[indexPath.row])
        cell.cImageView2.image = UIImage(named: chatImageView2[indexPath.row])
        cell.chatLabel1.text=chatUilabel1Array[indexPath.row]
        cell.chatLabel2.text=chatUilabel2Array[indexPath.row]
        cell.chatLabel3.text=chatUilabel3Array[indexPath.row]
        
        return cell
        
    }
}

