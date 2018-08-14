//
//  CSProgressHUD.swift
//  CSProgressHUD
//
//  Created by Tung Thanh Nguyen on 4/19/17.
//  Copyright © 2017 Comtasoft. All rights reserved.
//

import Foundation
import UIKit

struct CSProgressHUDConstants
{
	static let HUD_STATUS_FONT: UIFont = UIFont.boldSystemFont(ofSize: 16.0)
	static let HUD_STATUS_COLOR: UIColor = UIColor.black

	static let HUD_SPINNER_COLOR: UIColor = UIColor(red: 185.0/255.0, green: 220.0/255.0, blue: 47.0/255.0, alpha: 1.0)
	static let HUD_BACKGROUND_COLOR: UIColor = UIColor(white: 0.0, alpha: 0.1)
	static let HUD_WINDOW_COLOR: UIColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.2)

	static let HUD_IMAGE_SUCCESS: UIImage = UIImage(named: "CSProgressHUD.bundle/progresshud-success.png", in: Bundle(for: CSProgressHUD.self), compatibleWith: nil)!
	static let HUD_IMAGE_INFORMATION: UIImage = UIImage(named: "CSProgressHUD.bundle/progresshud-information.png", in: Bundle(for: CSProgressHUD.self), compatibleWith: nil)!
	static let HUD_IMAGE_WARNING: UIImage = UIImage(named: "CSProgressHUD.bundle/progresshud-warning.png", in: Bundle(for: CSProgressHUD.self), compatibleWith: nil)!
	static let HUD_IMAGE_ERROR: UIImage = UIImage(named: "CSProgressHUD.bundle/progresshud-error.png", in: Bundle(for: CSProgressHUD.self), compatibleWith: nil)!
}

open class CSProgressHUD: UIView
{
	fileprivate var priWindow: UIWindow? = nil
	open override var window: UIWindow?
	{
		get
		{
			return priWindow
		}
		set
		{
			if newValue != nil
			{
				priWindow = newValue
			}
		}
	}

	var background: UIView?
	var hud: UIToolbar?
	var spinner: UIActivityIndicatorView?
	var image: UIImageView?
	var label: UILabel?

	public static let shared: CSProgressHUD = CSProgressHUD()

	open class func dismiss()
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudHide()
			}
		}
	}

	open class func show()
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudCreate(nil, image: nil, spin: true, hide: false, interaction: true)
			}
		}
	}

	open class func show(_ status: String)
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudCreate(status, image: nil, spin: true, hide: false, interaction: true)
			}
		}
	}

	open class func show(_ status: String, interaction: Bool)
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudCreate(status, image: nil, spin: true, hide: false, interaction: interaction)
			}
		}
	}

	open class func showSuccess()
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudCreate(nil, image: CSProgressHUDConstants.HUD_IMAGE_SUCCESS, spin: false, hide: true, interaction: true)
			}
		}
	}

	open class func showSuccess(_ status: String)
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudCreate(status, image: CSProgressHUDConstants.HUD_IMAGE_SUCCESS, spin: false, hide: true, interaction: true)
			}
		}
	}

	open class func showSuccess(_ status: String, interaction: Bool)
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudCreate(status, image: CSProgressHUDConstants.HUD_IMAGE_SUCCESS, spin: false, hide: true, interaction: interaction)
			}
		}
	}

	open class func showInformation()
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudCreate(nil, image: CSProgressHUDConstants.HUD_IMAGE_INFORMATION, spin: false, hide: true, interaction: true)
			}
		}
	}

	open class func showInformation(_ status: String)
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudCreate(status, image: CSProgressHUDConstants.HUD_IMAGE_INFORMATION, spin: false, hide: true, interaction: true)
			}
		}
	}

	open class func showInformation(_ status: String, interaction: Bool)
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudCreate(status, image: CSProgressHUDConstants.HUD_IMAGE_INFORMATION, spin: false, hide: true, interaction: interaction)
			}
		}
	}

	open class func showWarning()
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudCreate(nil, image: CSProgressHUDConstants.HUD_IMAGE_WARNING, spin: false, hide: true, interaction: true)
			}
		}
	}

	open class func showWarning(_ status: String)
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudCreate(status, image: CSProgressHUDConstants.HUD_IMAGE_WARNING, spin: false, hide: true, interaction: true)
			}
		}
	}

	open class func showWarning(_ status: String, interaction: Bool)
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudCreate(status, image: CSProgressHUDConstants.HUD_IMAGE_WARNING, spin: false, hide: true, interaction: interaction)
			}
		}
	}

	open class func showError()
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudCreate(nil, image: CSProgressHUDConstants.HUD_IMAGE_ERROR, spin: false, hide: true, interaction: true)
			}
		}
	}

	open class func showError(_ status: String)
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudCreate(status, image: CSProgressHUDConstants.HUD_IMAGE_ERROR, spin: false, hide: true, interaction: true)
			}
		}
	}

	open class func showError(_ status: String, interaction: Bool)
	{
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.async
			{
				self.shared.hudCreate(status, image: CSProgressHUDConstants.HUD_IMAGE_ERROR, spin: false, hide: true, interaction: interaction)
			}
		}
	}

	//////////////////////////////////////////////////////////////////////////////

	init()
	{
		super.init(frame: UIScreen.main.bounds)

		let delegate: UIApplicationDelegate? = UIApplication.shared.delegate
		if (delegate?.responds(to: #selector(getter: self.window)))!
		{
			self.window = delegate?.perform(#selector(getter: self.window)).takeRetainedValue() as! UIWindow?
		}
		else
		{
			self.window = UIApplication.shared.keyWindow
		}

		self.background = nil
		self.hud = nil
		self.spinner = nil
		self.image = nil
		self.label = nil

		self.alpha = 0.0
	}
	
	required public init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
	}

	//////////////////////////////////////////////////////////////////////////////

	func hudCreate(_ status: String?, image image_: UIImage?, spin: Bool, hide: Bool, interaction: Bool)
	{
		if self.hud == nil
		{
			self.hud = UIToolbar(frame: CGRect.zero)
			self.hud?.isTranslucent = true
			self.hud?.backgroundColor = CSProgressHUDConstants.HUD_BACKGROUND_COLOR
			self.hud?.layer.cornerRadius = 10.0
			self.hud?.layer.masksToBounds = true
			self.registerNotifications()
		}

		if self.hud?.superview == nil
		{
			if interaction == false
			{
				self.background = UIView(frame: (self.window?.frame)!)
				self.background?.backgroundColor = CSProgressHUDConstants.HUD_WINDOW_COLOR
				self.window?.addSubview(self.background!)
				self.background?.addSubview(self.hud!)
			}
			else
			{
				self.window?.addSubview(self.hud!)
			}
		}

		if self.spinner == nil
		{
			self.spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
			self.spinner?.color = CSProgressHUDConstants.HUD_SPINNER_COLOR
			self.spinner?.hidesWhenStopped = true
		}
		if self.spinner?.superview == nil
		{
			hud?.addSubview(self.spinner!)
		}

		if self.image == nil
		{
			self.image = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 28.0, height: 28.0))
		}
		if self.image?.superview == nil
		{
			self.hud?.addSubview(self.image!)
		}

		if self.label == nil
		{
			self.label = UILabel(frame: CGRect.zero)
			self.label?.font = CSProgressHUDConstants.HUD_STATUS_FONT
			self.label?.textColor = CSProgressHUDConstants.HUD_STATUS_COLOR
			self.label?.backgroundColor = UIColor.clear
			self.label?.textAlignment = NSTextAlignment.center
			self.label?.baselineAdjustment = UIBaselineAdjustment.alignCenters
			self.label?.numberOfLines = 0
		}
		if self.label?.superview == nil
		{
			self.hud?.addSubview(self.label!)
		}

		self.label?.text = status
		self.label?.isHidden = (status == nil) ? true : false

		self.image?.image = image_
		self.image?.isHidden = (image_ == nil) ? true : false

		if spin
		{
			self.spinner?.startAnimating()
		}
		else
		{
			self.spinner?.stopAnimating()
		}

		self.hudSize()
		self.hudPosition(nil)
		self.hudShow()

		if hide
		{
			self.timedHide()
		}
	}

	func registerNotifications()
	{
		//
	}

	func hudDestroy()
	{
		NotificationCenter.default.removeObserver(self)

		self.label?.removeFromSuperview()
		self.label = nil

		self.image?.removeFromSuperview()
		self.image = nil

		self.spinner?.removeFromSuperview()
		self.spinner = nil

		self.hud?.removeFromSuperview()
		self.hud = nil

		self.background?.removeFromSuperview()
		self.background = nil
	}

	//////////////////////////////////////////////////////////////////////////////

	func hudSize()
	{
		var labelRect: CGRect = CGRect.zero
		var hudWidth: CGFloat = 100.0
		var hudHeight: CGFloat = 100.0

		if self.label?.text != nil
		{
			let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): self.label?.font as Any]
			let options: NSStringDrawingOptions = [NSStringDrawingOptions.usesFontLeading, NSStringDrawingOptions.truncatesLastVisibleLine, NSStringDrawingOptions.usesLineFragmentOrigin]
			labelRect = ((self.label?.text)! as NSString).boundingRect(with: CGSize(width: 200.0, height: 300.0), options: options, attributes: attributes, context: nil)

			labelRect.origin.x = 12.0
			labelRect.origin.y = 66.0

			hudWidth = labelRect.size.width + 24.0
			hudHeight = labelRect.size.height + 80.0

			if hudWidth < 100.0
			{
				hudWidth = 100.0
				labelRect.origin.x = 0.0
				labelRect.size.width = 100.0
			}
		}

		self.hud?.bounds = CGRect(x: 0.0, y: 0.0, width: hudWidth, height: hudHeight)

		let imageX: CGFloat = hudWidth / 2.0
		let imageY: CGFloat = (self.label?.text == nil) ? hudHeight / 2.0 : 36
		self.spinner?.center = CGPoint(x: imageX, y: imageY)
		self.image?.center = (self.spinner?.center)!

		self.label?.frame = labelRect
	}

	func hudPosition(_ notification: Notification?)
	{
		var heightKeyboard: CGFloat = 0.0
		var duration: TimeInterval = 0.0

		if notification != nil
		{
			let info: NSDictionary = (notification?.userInfo)! as NSDictionary
			let keyboard: CGRect = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! CGRect
			duration = info.value(forKey: UIResponder.keyboardAnimationDurationUserInfoKey) as! TimeInterval
			if (notification?.name == UIResponder.keyboardWillShowNotification || notification?.name == UIResponder.keyboardDidShowNotification)
			{
				heightKeyboard = keyboard.size.height
			}
		}
		else
		{
			heightKeyboard = self.keyboardHeight()
		}

		let screen: CGRect = UIScreen.main.bounds
		let center: CGPoint = CGPoint(x: screen.size.width / 2.0, y: (screen.size.height - heightKeyboard) / 2.0)

		UIView.animate(withDuration: duration, delay: 0.0, options: UIView.AnimationOptions.allowUserInteraction,
			animations:
			{
				self.hud?.center = CGPoint(x: center.x, y: center.y)
			},
			completion: nil)

		if self.background != nil
		{
			self.background?.frame = (self.window?.frame)!
		}
	}

	func keyboardHeight() -> CGFloat
	{
		for testWindow: UIWindow in UIApplication.shared.windows
		{
			if testWindow.self.isEqual(UIWindow.self) == false
			{
				for possibleKeyboard: UIView in testWindow.subviews
				{
					if possibleKeyboard.description.hasPrefix("<UIPeripheralHostView")
					{
						return possibleKeyboard.bounds.size.height
					}
					else if possibleKeyboard.description.hasPrefix("<UIInputSetContainerView")
					{
						for hostKeyboard: UIView in possibleKeyboard.subviews
						{
							if hostKeyboard.description.hasPrefix("<UIInputSetHost")
							{
								return hostKeyboard.frame.size.height
							}
						}
					}
				}
			}
		}

		return 0.0
	}

	//////////////////////////////////////////////////////////////////////////////

	func hudShow()
	{
		if self.alpha == 0.0
		{
			self.alpha = 1.0
			self.hud?.alpha = 0.0
			self.hud?.transform = (self.hud?.transform.scaledBy(x: 1.4, y: 1.4))!
			let options: UIView.AnimationOptions = [UIView.AnimationOptions.allowUserInteraction, UIView.AnimationOptions.curveEaseOut]
			UIView.animate(withDuration: 0.15, delay: 0.0, options: options,
				animations:
				{
					self.hud?.transform = (self.hud?.transform.scaledBy(x: 1.0 / 1.4, y: 1.0 / 1.4))!
					self.hud?.alpha = 1.0
				},
				completion: nil)
		}
	}

	func hudHide()
	{
		if self.alpha == 1.0
		{
			let options: UIView.AnimationOptions = [UIView.AnimationOptions.allowUserInteraction, UIView.AnimationOptions.curveEaseIn]
			UIView.animate(withDuration: 0.15, delay: 0.0, options: options,
				animations:
				{
					self.hud?.transform = (self.hud?.transform.scaledBy(x: 0.7, y: 0.7))!
					self.hud?.alpha = 0.0
				},
				completion:
				{
					(finished) in

					self.hudDestroy()
					self.alpha = 0.0
				}
			)
		}
	}

	func timedHide()
	{
		let textLength: Int = ((self.label?.text != nil) && ((self.label?.text?.count)! > 15)) ? (self.label?.text?.count)! : 15
		let delay: TimeInterval = Double(textLength) * 0.08 + 0.5
		let deadline: DispatchTime = DispatchTime.now() + DispatchTimeInterval.seconds(Int(delay))
		DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async
		{
			DispatchQueue.main.asyncAfter(deadline: deadline)
			{
				self.hudHide()
			}
		}
	}
}
