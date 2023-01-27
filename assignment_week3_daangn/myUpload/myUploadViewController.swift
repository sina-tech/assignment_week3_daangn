//
//  myUploadViewController.swift
//  assignment_week3_daangn
//
//  Created by 황신아 on 2023/01/07.
//

import UIKit
import CoreData
var myindex = 0
var selectedPost : Post!

class myUploadViewController: UIViewController{

    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    override func viewDidLoad() {
       
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 130
        
        tableView.register(UINib(nibName: "myUploadTableViewCell", bundle: nil), forCellReuseIdentifier: "myUploadTableViewCell")
    }
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        posts = DBManager.share.fetchPost()
        tableView.reloadData()
    }
    

  
}

extension myUploadViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 행의 개수
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell UI
        let cell = tableView.dequeueReusableCell(withIdentifier: "myUploadTableViewCell", for: indexPath) as! myUploadTableViewCell
        
        let aPost = posts[indexPath.row]
        cell.labelTitle?.text=aPost.title
        cell.labelPrice?.text=aPost.price
        cell.imageViewPicked?.image =  UIImage(data: aPost.pickedImage ?? Data()) ?? UIImage()
        cell.menuButton = {[unowned self] in
            let ac = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
                    let update = UIAlertAction(title: "게시글 수정", style: .default) { (_) in
                        //myindex = indexPath.row
                        //print(myindex)
                        
                        selectedPost = posts[indexPath.row]
                        
                        let toeditViewController = self.storyboard?.instantiateViewController(withIdentifier: "editViewController") as! editViewController
                        
                        toeditViewController.modalPresentationStyle = .fullScreen
                        
                        self.present(toeditViewController, animated: true ,completion: nil)
                        
                    }
            let delete = UIAlertAction(title: "삭제", style: .default) { (_) in
                        DBManager.share.context.delete(self.posts[indexPath.row])
                DBManager.share.saveContext()
                posts.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                        
            }
                    let close = UIAlertAction(title: "닫기", style: .cancel, handler: nil)
                    ac.addAction(update)
                    ac.addAction(delete)
                    ac.addAction(close)
                    self.present(ac, animated: true, completion: nil)
                    
                
        }
        return cell
        
    }
        
        
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}
