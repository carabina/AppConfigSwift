//
//  AppConfigLoadingCellView.swift
//  AppConfigSwift Pod
//
//  Library view: shared component
//  A cell to be used as a loading indicator, contains text and a spinner
//

import UIKit

public class AppConfigLoadingCellView : UIView {
    
    // --
    // MARK: Members
    // --
    
    @IBOutlet private var _contentView: UIView! = nil
    @IBOutlet private var _label: UILabel! = nil
    @IBOutlet private var _spinner: UIActivityIndicatorView! = nil

    
    // --
    // MARK: Properties which can be used in interface builder
    // --
    
    @IBInspectable var labelText: String = "" {
        didSet {
            _label.text = labelText
        }
    }
    
    var label: String? {
        set {
            _label!.text = newValue
        }
        get { return _label!.text }
    }
    
    
    // --
    // MARK: Initialization
    // --
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }
    
    public func loadFromNib() {
        AppConfigBundle.loadNibNamed("LoadingCell", owner: self, options: nil)
        _label.text = ""
        _spinner.startAnimating()
        self.addSubview(_contentView)
    }

    
    // --
    // MARK: Layout
    // --
    
    public override func sizeThatFits(size: CGSize) -> CGSize {
        let result: CGSize = _contentView.systemLayoutSizeFittingSize(CGSizeMake(size.width, 0), withHorizontalFittingPriority: UILayoutPriorityRequired, verticalFittingPriority: UILayoutPriorityFittingSizeLevel)
        return CGSizeMake(size.width, result.height)
    }
    
    public override func layoutSubviews() {
        let fittingSize: CGSize = sizeThatFits(frame.size)
        _contentView.frame = CGRectMake(0, 0, fittingSize.width, fittingSize.height)
    }
}