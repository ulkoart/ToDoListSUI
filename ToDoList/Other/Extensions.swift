//
//  Extensions.swift
//  ToDoList
//
//  Created by Улько Артем Викторович on 18.04.2024.
//

import Foundation

extension Encodable {
	func asDictionary() -> [String: Any] {
		guard
			let data = try? JSONEncoder().encode(self)
		else { return [:] }
		
		do {
			let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
			return json ?? [:]
		} catch {
			return [:]
		}
	}
}
