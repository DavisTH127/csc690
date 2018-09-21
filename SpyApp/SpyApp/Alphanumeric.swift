//
//  File.swift
//  SpyApp
//
//  Created by Davis Hoang on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//
import Foundation

struct Alphanumeric: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {

        var encoded = ""
        if((plaintext).isAlphanumeric()){
            for character in plaintext {
                let unicode = character.unicodeScalars.first!.value
                let shiftedUnicode = unicode + 1
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
        }else{
            return "Not a AlphaNumeric"
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        var decoded = ""
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - 1
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
}

extension String {
    
    func isAlphanumeric() -> Bool {
        return self.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && self != ""
    }
    
    func isAlphanumeric(ignoreDiacritics: Bool = false) -> Bool {
        if ignoreDiacritics {
            return self.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil && self != ""
        }
        else {
            return self.isAlphanumeric()
        }
    }
    
}
