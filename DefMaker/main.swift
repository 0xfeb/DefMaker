//
//  main.swift
//  DefMaker
//
//  Created by 王渊鸥 on 2017/3/17.
//  Copyright © 2017年 王渊鸥. All rights reserved.
//

import Foundation

if CommandLine.arguments.count < 2 {
	print("[Wrong syntax]", "DefMaker ****.plist")
	exit(1)
}

let fileName = CommandLine.arguments[1]
guard let data = NSMutableDictionary(contentsOfFile: fileName) else {
	print("[Wrong]", "Can not load plist file")
	exit(2)
}

if let thirdApp = data["third_app"] {
	print("[Info]", "Third info already exists")
} else {
	let thirdApp = [
		"weixin": ["app_id":"11111", "app_sec":"111111"],
		"qq": ["app_id":"22222", "app_sec":"22222"],
		"alipay": ["app_id":"333333", "app_sec":"333333"],
		"weibo": ["app_id":"444444", "app_sec":"444444"]
	]
	
	data["third_app"] = thirdApp
}

if let curApp = data["current_app"] {
	print("[Info]", "Current app info already exists")
} else {
	let curApp = [
		"info": [
			"app_id":"aaaaa",
			"app_sec":"aaaaa",
			"channel":"AppStore"
		],
		"switchs":[
			"key0":"value0",
			"key1":"value1"
		],
		"base_urls":[
			"*":"https://api.xxx.com/",
			"user":"https://api.user.xxx.com/"
		]
	]
	
	data["current_app"] = curApp
}

data.write(toFile: fileName, atomically: true)
