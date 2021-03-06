//
//  NewsEmptyDataSource.swift
//  Unwrap
//
//  Created by Paul Hudson on 09/08/2018.
//  Copyright © 2018 Hacking with Swift. All rights reserved.
//

import DZNEmptyDataSet
import UIKit

/// Manages all the rows in the News table view if news download failed.
class NewsEmptyDataSource: NSObject, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    /// A delegate we can report back to when the retry button is tapped.
    weak var delegate: NewsViewController?

    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "News"
        let attrs = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)]
        return NSAttributedString(string: str, attributes: attrs)
    }

    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "We couldn't download the news right now. Please tap the button below to try again."
        let attrs = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)]
        return NSAttributedString(string: str, attributes: attrs)
    }

    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return UIImage(bundleName: "News-Placeholder")
    }

    func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControlState) -> NSAttributedString? {
        let str = "Try Again"
        let attrs = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: UIFontTextStyle.callout)]
        return NSAttributedString(string: str, attributes: attrs)
    }

    /// Called when the retry button is tapped.
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        delegate?.fetchArticles()
    }
}
