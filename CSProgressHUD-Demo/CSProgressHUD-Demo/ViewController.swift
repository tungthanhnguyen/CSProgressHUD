//
//  ViewController.swift
//  CSProgressHUD-Demo
//
//  Created by Tung Thanh Nguyen on 4/25/17.
//  Copyright © 2017 Comtasoft. All rights reserved.
//

import CSProgressHUD
import UIKit

class ViewController: UITableViewController
{
	var items: NSMutableArray?
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		self.title = "Custom Notifications"

		items = NSMutableArray()
		items?.add("Dismiss HUD")
		items?.add("Progress: no text")
		items?.add("Progress: short text")
		items?.add("Progress: longer text")
		items?.add("Success: no text")
		items?.add("Success: short text")
		items?.add("Information: no text")
		items?.add("Information: short text")
		items?.add("Warning: no text")
		items?.add("Warning: short text")
		items?.add("Error: no text")
		items?.add("Error: short text")
	}



	//////////////////////////////////////////////////////////////////////////////
	// MARK: - Table view data source

	override func numberOfSections(in tableView: UITableView) -> Int
	{
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return (items?.count)!
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
	{
		return 44.0
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		return self.tableView(tableView, cellWithText: items![indexPath.row] as! String)
	}

	func tableView(_ tableView: UITableView, cellWithText text: String) -> UITableViewCell
	{
		var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
		if cell == nil
		{
			cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
		}
		cell?.textLabel?.text = text
		return cell!
	}

	//////////////////////////////////////////////////////////////////////////////



	//////////////////////////////////////////////////////////////////////////////
	// MARK: - Table view delegate

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
	{
		tableView.deselectRow(at: indexPath, animated: true)

		switch indexPath.row
		{
		case 0:
			CSProgressHUD.dismiss()

		case 1:
			CSProgressHUD.show()

		case 2:
			CSProgressHUD.show("Please wait...")

		case 3:
			CSProgressHUD.show("Please wait. We need some more time to work out this situation.")

		case 4:
			CSProgressHUD.showSuccess()

		case 5:
			CSProgressHUD.showSuccess("That was great!")

		case 6:
			CSProgressHUD.showInformation()

		case 7:
			CSProgressHUD.showInformation("Everything is good.")

		case 8:
			CSProgressHUD.showWarning()

		case 9:
			CSProgressHUD.showWarning("Hmm... Something went unusual.")

		case 10:
			CSProgressHUD.showError()

		case 11:
			CSProgressHUD.showError("Something went wrong.")

		default:
			break;
		}
	}

	//////////////////////////////////////////////////////////////////////////////
}
