//
//  AllCommentsViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 25/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class AllCommentsViewController: UIViewController {

    let PLACEHOLDER_TEXT = "Write something nice 🤗"
    
    @IBOutlet weak var viewNewComment: UIView!
    @IBOutlet weak var textViewNewComment: UITextView!
    @IBOutlet weak var tableViewComments: UITableView!
    
    @IBOutlet weak var constraintViewNewCommentHeight: NSLayoutConstraint!
    @IBOutlet weak var constraintViewNewCommentBottom: NSLayoutConstraint!
    
    @IBOutlet weak var constraintTextViewNewCommentHeight: NSLayoutConstraint!
    
    var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadComments()
        self.configureCommentsTableView()
        self.configureTextView()
        
        self.navigationItem.title = "\(comments.count) comments"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keybaordWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
   
    private func loadComments() {
        self.comments = Database.sharedInstance.getSomeComments()!
    }
    
    private func configureCommentsTableView() {
        tableViewComments.dataSource = self
        tableViewComments.delegate = self
        tableViewComments.rowHeight = UITableViewAutomaticDimension
        tableViewComments.estimatedRowHeight = 100.0
        
        tableViewComments.register(UINib(nibName: CommentTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: CommentTableViewCell.cellId)
    }
    
    private func configureTextView() {
        self.tableViewComments.tableFooterView = UIView()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.singleTapedd))
        tapGesture.cancelsTouchesInView = false
        self.tableViewComments.addGestureRecognizer(tapGesture)
        
        textViewNewComment.layer.cornerRadius = 5
        textViewNewComment.delegate = self
        
        textViewNewComment.textContainerInset = UIEdgeInsetsMake(5.0, 2.0, 3.0, 2.0)
        textViewNewComment.contentInset = UIEdgeInsetsMake(1.0, 0.0, 1.0, 0.0)
        
        textViewNewComment.isScrollEnabled = true
        textViewNewComment.scrollsToTop = false
        textViewNewComment.isUserInteractionEnabled = true
        textViewNewComment.translatesAutoresizingMaskIntoConstraints = false
        
        textViewNewComment.keyboardAppearance = .dark
        textViewNewComment.enablesReturnKeyAutomatically = true
        
        setTextViewAboveTabBar()
    }
    
    func setTextViewAboveTabBar() {
        if let tabbarHeight = self.tabBarController?.tabBar.frame.height {
            self.constraintViewNewCommentBottom.constant = tabbarHeight
        }
    }
    
    func singleTapedd(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func keyboardWillShow(_ notification: NSNotification) {
        
        // Get keyboard size
        let userInfo = notification.userInfo! as NSDictionary
        let keyboardFrame = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        let duration = userInfo.value(forKey: UIKeyboardAnimationDurationUserInfoKey) as! NSNumber
        
        self.constraintViewNewCommentBottom.constant = keyboardHeight
        UIView.animate(withDuration: duration.doubleValue) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    func keybaordWillHide(_ notification: NSNotification) {
        let userInfo = notification.userInfo! as NSDictionary
        let duration = userInfo.value(forKey: UIKeyboardAnimationDurationUserInfoKey) as! NSNumber
        
        setTextViewAboveTabBar()
        
        UIView.animate(withDuration: duration.doubleValue) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    func postComment(message: String) {
        let newComment = Comment()
        newComment.author = User.get(variant: 1)
        newComment.message = message
        
        comments.append(newComment)
        tableViewComments.reloadData()
    }


}

