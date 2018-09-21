import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decode(_ plaintext: String, secret: String) -> String?
}

struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""

        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
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


struct NumbericNum: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        
        var encoded = ""
        let result = plaintext.trimmingCharacters(in: CharacterSet(charactersIn: "01234567890.").inverted)

            for character in result {
                let unicode = character.unicodeScalars.first!.value
                let shiftedUnicode = unicode + 5
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        var decoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - 5
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
}

struct SpecialChar: Cipher {
        
    func encode(_ plaintext: String, secret: String) -> String? {
            
        var encoded = ""
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        if plaintext.rangeOfCharacter(from: characterset.inverted) != nil {
            print("string contains special characters")
        }
            
        for Characterset in plaintext {
            let unicode = Characterset.unicodeScalars.first!.value
                let shiftedUnicode = unicode + 10
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
            return encoded
        }
        
        func decode(_ plaintext: String, secret: String) -> String? {
            var decoded = ""
            
            for Characterset in plaintext {
                let unicode = Characterset.unicodeScalars.first!.value
                let shiftedUnicode = unicode - 10
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                decoded = decoded + shiftedCharacter
            }
            return decoded
        }
}


