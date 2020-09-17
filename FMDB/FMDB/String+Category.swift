//
//  String+Category.swift
//  FMDB
//
//  Created by Liu Tao on 2020/9/17.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

extension String {
    
    static func homeDir() -> String {
        
        let homeDiretory = NSHomeDirectory()
        return homeDiretory
    }
    
    static func cacheDir() -> String {
        
        let cachePath2 = NSHomeDirectory() + "/Library/Caches"
        return cachePath2
    }
    
    static func DocumentsDir() -> String {
        
        let documentPath = NSHomeDirectory() + "/Documents"
        return documentPath
    }
    
    static func TmpDir() -> String {
        
        let tmpDir = NSHomeDirectory() + "/tmp"
        return tmpDir
    }
}
