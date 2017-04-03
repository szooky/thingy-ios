//
//  ThingViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 11/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class ThingViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDetails: UILabel!
    

    @IBOutlet weak var buttonLikes: ThingyButton!
    @IBOutlet weak var buttonSeeAllComments: UIButton!
    
    @IBOutlet weak var tableViewStories: UITableView!
    @IBOutlet weak var tableViewComments: UITableView!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var constraintTableViewStoriesHeight: NSLayoutConstraint!
    @IBOutlet weak var constraintTableViewCommentsHeight: NSLayoutConstraint!
    
    var pageViewController: UIPageViewController?
    var thing: Thing?

    var contentImages = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        loadThingDetails()
        
        configurePageViewController()
        configurePageControl()
        
        configureStoriesTableView()
        setStoriesTableViewHeight()
        
        configureCommentsTableView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setCommentsTableViewHeight()

    }
    
    private func loadThingDetails() {
        if let thing = self.thing {
            labelTitle.text = thing.name
            labelDetails.text = thing.description
            
            if let gallery = thing.gallery {
                contentImages = gallery
            }
        }
    }
    
    func configureStoriesTableView() {
        tableViewStories.dataSource = self
        tableViewStories.delegate = self
        tableViewStories.rowHeight = 100.0
        tableViewStories.register(UINib(nibName: StoryTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: StoryTableViewCell.cellId)
    }
    
    func configureCommentsTableView() {
        tableViewComments.dataSource = self
        tableViewComments.delegate = self
        tableViewComments.rowHeight = UITableViewAutomaticDimension
        tableViewComments.estimatedRowHeight = 100.0
        
        tableViewComments.register(UINib(nibName: CommentTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: CommentTableViewCell.cellId)
        
        if let thing = self.thing, let comments = thing.comments {
        buttonSeeAllComments.setTitle("See all(\(   comments.count))", for: .normal)
        }
        
    }
    
    func setStoriesTableViewHeight() {
        if let thing = self.thing, let stories = thing.stories {
            let totalHeight = CGFloat(stories.count) * 100.0
            constraintTableViewStoriesHeight.constant = totalHeight
        }
    }
    
    func setCommentsTableViewHeight() {
        tableViewComments.sizeToFit()
        constraintTableViewCommentsHeight.constant = tableViewComments.contentSize.height
    }

    private func configurePageViewController() {
        let storyboard = UIStoryboard(name: "ThingStoryboard", bundle: nil)
        let pageController = storyboard.instantiateViewController(withIdentifier: "ThingGalleryPageViewController") as! UIPageViewController
        pageController.dataSource = self
        pageController.delegate = self
        
        if contentImages.count > 0 {
            let firstController = getItemController(itemIndex: 0)!
            let startingViewControllers = [firstController]
            pageController.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController

        addChildViewController(pageViewController!)
        pageViewController!.view.frame = containerView.frame
        
        self.containerView.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParentViewController: self)
    }
    
    private func configurePageControl() {
        pageControl.numberOfPages = contentImages.count
        pageControl.currentPage = 0
    }
    
    @IBAction func buttonLikesClicked(_ sender: ThingyButton) {
        if sender.isClicked {
            self.thing?.likes = 0
        } else {
            self.thing?.likes = 1
        }
        
        if let likesCount = thing?.likes {
            var emoji = "😞"
            if likesCount > 0 {
                emoji = "😎"
            }
            self.buttonLikes.setTitle("\(likesCount) \(emoji) liked", for: .normal)
        }
        
        sender.isClicked = !sender.isClicked
    }
 
    @IBAction func buttonSeeAllCommentsClicked(_ sender: UIButton) {
        let vcAllComments = AllCommentsViewController(nibName: "AllCommentsViewController", bundle: nil)
        self.navigationController?.pushViewController(vcAllComments, animated: true)
        
    }
}








