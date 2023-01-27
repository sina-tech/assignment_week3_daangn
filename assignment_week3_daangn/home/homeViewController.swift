//
//  homeViewController.swift
//  assignment_week3_daangn
//
//  Created by 황신아 on 2023/01/05.
//

import Foundation
import UIKit
import JJFloatingActionButton
import CoreData

class homeViewController: UIViewController{

   

    @IBOutlet weak var tableView: UITableView!
    
    let imageArray = ["h1.jpg","h2.jpg","h3.jpg","h4.jpg","h5.jpg","h6.jpg","h7.jpg","h8.jpg"]
    let uilabel1Array = ["태그호이어 아쿠아레이서 검판 41mm 쿼츠 판매합니다","아이폰 11 128GB 화이트", "샤넬 가방 은장 woc19","아이패드 파우치","울니트 오프숄더","맥케이지 딕슨(36사이즈)","애플 에어팟 맥스 팝니다 S급","기아 뉴 카렌스 UN 7인승 LPi 2.0"]
    let uilabel2Array = ["능곡동 · 1분 전","백석동 · 2분 전","고촌읍 · 30분 전","김포시 사우동 · 1분 전","풍무동 1일 전","서구 아라동 · 끌올 2분 전","백석동 · 1시간 전","중고차 직거래"]
    let uilabel3Array = ["700,000원","290,000원","490만원","9,000원","13,000원","520,000원","640,000원","330만원"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 플로팅 버튼 오픈소스
        let actionButton = JJFloatingActionButton()
        actionButton.buttonColor = .systemOrange
       
        actionButton.addItem(title: "내 물건 팔기", image: UIImage(named: "f1.jpg")) { item in
            // 다른 뷰 컨트롤러로 이동.
            
                let upViewController = self.storyboard?.instantiateViewController(withIdentifier: "uploadViewController") as! uploadViewController
                
            upViewController.modalPresentationStyle = .fullScreen
                
                self.present(upViewController, animated: true ,completion: nil)
            
            
        
        }
        
        
        
        actionButton.addItem(title: "중고차", image: UIImage(named: "f2.jpg")) { item in
          // do something
        }

        actionButton.addItem(title: "부동산", image: UIImage(named: "f3.jpg")) { item in
          // do something
        }

        actionButton.addItem(title: "농수산물", image: UIImage(named: "f4.jpg")) { item in
          // do something
        }

        actionButton.addItem(title: "과외/클래스", image: UIImage(named: "f5.jpg")) { item in
          // do something
        }

        actionButton.addItem(title: "알바", image: UIImage(named: "f6.jpg")) { item in
          // do something
        }

        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        //////////////

       
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 130
        
        tableView.register(UINib(nibName: "homeTableViewCell1", bundle: nil), forCellReuseIdentifier: "homeTableViewCell1")
        
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.text = "고촌읍"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
}

  


extension homeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 행의 개수
        return imageArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell UI
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell1", for: indexPath) as! homeTableViewCell1
        // indexPath.row => 행을 의미
        
        cell.uiImageView.image = UIImage(named: imageArray[indexPath.row])
        cell.label1.text=uilabel1Array[indexPath.row]
        cell.label2.text=uilabel2Array[indexPath.row]
        cell.label3.text=uilabel3Array[indexPath.row]
        return cell
        
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}
