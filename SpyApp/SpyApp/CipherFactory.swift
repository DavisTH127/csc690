import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "Alphanumeric": Alphanumeric(),
        "Numeric":NumbericNum(),
        "SpecialCharacter": SpecialChar(),
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
