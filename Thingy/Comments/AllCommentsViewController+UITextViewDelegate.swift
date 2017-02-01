//
//  AllCommentsViewController+UITextViewDelegate.swift
//  Thingy
//
//  Created by Filip Szukala on 01/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension AllCommentsViewController: UITextViewDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            clickedSendIn(textView)
            return false
        }
        return true
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView.text == PLACEHOLDER_TEXT {
            textView.text = ""
            textView.textColor = UIColor.black
        }
        
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        setTextViewHeightToContent(textView: textView)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            setPlaceholder()
        }
    }
    
    private func setPlaceholder() {
        textViewNewComment.text = PLACEHOLDER_TEXT
        textViewNewComment.textColor = UIColor.lightGray
    }
    
    private func setTextViewHeightToContent(textView: UITextView) {
        let textViewStartingHeight: CGFloat = 30
        
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        
        if newSize.height < textViewStartingHeight {
            newSize = CGSize(width: fixedWidth, height: textViewStartingHeight)
        }
        
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        
        let numLines = (textView.contentSize.height - CGFloat(8)) / textView.font!.lineHeight
        
        
        if newFrame.height >= textViewStartingHeight && numLines < 8 {
            self.textViewNewComment.frame = newFrame
            self.constraintTextViewNewCommentHeight.constant = newFrame.height
            self.constraintViewNewCommentHeight.constant = newFrame.height + 20
            self.textViewNewComment.setContentOffset(.zero, animated: false)
            self.textViewNewComment.setNeedsDisplay()
        }
    }
    
    private func clickedSendIn(_ textView: UITextView) {
        postComment(message: textView.text)
        setPlaceholder()
        setTextViewHeightToContent(textView: textView)
        textView.resignFirstResponder()
        scrollCommentsToBottom()
    }
    
    private func scrollCommentsToBottom() {
        let lastIndex = IndexPath(row: comments.count - 1, section: 0)
        tableViewComments.scrollToRow(at: lastIndex , at: .bottom, animated: true)
    }
    
}
