//
//  Extensions.swift
//  Social Media
//
//  Created by Camelia Braghes on 09.01.2023.
//

import Foundation

extension String {
    func fileName() -> String {
        return NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent ?? ""
    }
    
    func fileExtension() -> String {
        return NSURL(fileURLWithPath: self).pathExtension ?? ""
    }
}
