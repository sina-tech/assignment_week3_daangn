//
//  lifeViewController.swift
//  assignment_week3_daangn
//
//  Created by 황신아 on 2023/01/05.
//

import UIKit

class lifeViewController: UIViewController{

    @IBOutlet weak var lifeTableView: UITableView!
    let lifeImageArray = ["l2.jpg","l1.jpg","","",""]
    let lifeUilabel1Array = ["분실/실종센터","분실/실종센터","취미생활","동네질문","취미생활"]
    let lifeUilabel2Array = ["찾아요 대화 방향 지하철 타고 있는 중에 옆좌석에 어떤 여자분이 대곡역 하차하시면서 이 아이를 놓고 내리셨어요. 주인분 찾습니다.", "찾아요 루이비통 지갑 분실 12/29에 대화동 또는 풍무동에서 분실한 것으로 예상됩니다 ㅠㅠ 차에서 옷을 꺼내다가 흘린 것 같아요","안녕하세요 현재 미용실에서 일하구 있는 사람입니다!! 제가 수요일 목요일 쉬고있는데 혹시 미용 봉사가 필요하신 분을 찾고있어요!! 연락 부탁드려요 :)","눈썰매장이나 썰매장 추천좀해주세요 입장료 주차 저렴한 곳요","혹시 동네에 늦게까지하는 카페 있나요???? 12시 정도요!"]
    let lifeUilabel3Array = [ "newage·고양시 일산동구 백석2동","솜꾸·풍무동","윤쭈·고양시 일산동구 장항동","정직한 당근거래해요·강서구 방화동","니제·강서구 방화동"]
    let lifeUilabel4Array = ["1시간 전","19분 전","1시간 전","1시간 전","1시간 전"]
    let lifeUilabel5Array = ["☺ 공감하기","☺ 공감하기","☺ 공감하기","궁금해요","☺ 공감하기"]
    let lifeUilabel6Array = ["💬댓글쓰기","💬댓글 1","💬댓글쓰기","💬답변하기","💬댓글 1"]
    let headerArray = ["주제","⚡️반짝모임","동네소식","겨울간식","동네질문","동네맛집","취미생활","일상"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
        
        lifeTableView.delegate = self
        lifeTableView.dataSource = self
        self.lifeTableView.rowHeight = 400
        lifeTableView.frame = lifeTableView.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 10))
        lifeTableView.register(UINib(nibName: "lifeTableViewCell", bundle: nil), forCellReuseIdentifier: "lifeTableViewCell")
        
    configureHeaderView()
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.text = "고촌읍"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        
    }


    
}
extension lifeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func configureHeaderView() {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//                self.collectionView.collectionViewLayout = layout
        let headerView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40), collectionViewLayout: layout)
        headerView.backgroundColor = .systemGray6
        headerView.isPagingEnabled = true
        headerView.isUserInteractionEnabled = true

        headerView.dataSource = self
        headerView.delegate = self
        headerView.register(UINib(nibName: "CollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CollectionViewCell")
        headerView.showsHorizontalScrollIndicator = false
        

        lifeTableView.tableHeaderView = headerView
    }

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
                                         
        cell.CLabel.text=headerArray[indexPath.row]
        cell.CLabel.layer.borderColor = UIColor.systemGray2.cgColor
        cell.CLabel.layer.borderWidth = 0.8
        cell.CLabel.layer.cornerRadius = 2.0
        return cell
    }

    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 20)
    }
    
    
}


////
extension lifeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 행의 개수
        return lifeUilabel1Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell UI
        let cell = lifeTableView.dequeueReusableCell(withIdentifier: "lifeTableViewCell", for: indexPath) as! lifeTableViewCell
        // indexPath.row => 행을 의미
        
        
        cell.lifeImageView.image = UIImage(named: lifeImageArray[indexPath.row])
        cell.lifeLabel1.text=lifeUilabel1Array[indexPath.row]
        cell.lifeLabel2.text=lifeUilabel2Array[indexPath.row]
        cell.lifeLabel3.text=lifeUilabel3Array[indexPath.row]
        cell.lifeLabel4.text=lifeUilabel4Array[indexPath.row]
        cell.lifeLabel5.text=lifeUilabel5Array[indexPath.row]
        cell.lifeLabel6.text=lifeUilabel6Array[indexPath.row]
        
        cell.lifeUiView.layer.borderWidth=0.2
        cell.lifeUiView.layer.borderColor = UIColor.gray.cgColor
        
//        if(lifeImageArray[indexPath.row] == nil){
//            cell.lifeImageView.isHidden = true
//
//        }
        
        cell.lifeImageView.layer.cornerRadius=10.0
        
        
        return cell
    }
}
