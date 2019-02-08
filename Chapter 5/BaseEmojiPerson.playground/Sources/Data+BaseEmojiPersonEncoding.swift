import Foundation

let base: [Character] = [
    "👨", "👨‍🦰", "👨‍🦱", "👨‍🦲", "👨‍🦳",
    "👨🏻", "👨🏻‍🦰", "👨🏻‍🦱", "👨🏻‍🦲", "👨🏻‍🦳",
    "👨🏼", "👨🏼‍🦰", "👨🏼‍🦱", "👨🏼‍🦲", "👨🏼‍🦳",
    "👨🏽", "👨🏽‍🦰", "👨🏽‍🦱", "👨🏽‍🦲", "👨🏽‍🦳",
    "👨🏾", "👨🏾‍🦰", "👨🏾‍🦱", "👨🏾‍🦲", "👨🏾‍🦳",
    "👨🏿", "👨🏿‍🦰", "👨🏿‍🦱", "👨🏿‍🦲", "👨🏿‍🦳",
    "👩", "👩‍🦰", "👩‍🦱", "👩‍🦲", "👩‍🦳",
    "👩🏻", "👩🏻‍🦰", "👩🏻‍🦱", "👩🏻‍🦲", "👩🏻‍🦳",
    "👩🏼", "👩🏼‍🦰", "👩🏼‍🦱", "👩🏼‍🦲", "👩🏼‍🦳",
    "👩🏽", "👩🏽‍🦰", "👩🏽‍🦱", "👩🏽‍🦲", "👩🏽‍🦳",
    "👩🏾", "👩🏾‍🦰", "👩🏾‍🦱", "👩🏾‍🦲", "👩🏾‍🦳",
    "👩🏿", "👩🏿‍🦰", "👩🏿‍🦱", "👩🏿‍🦲", "👩🏿‍🦳",
    "🧑🏻", "🧑🏼", "🧑🏾", "🧑🏿"
]

extension Data {
    public func base🧑EncodedString() -> String {
        var output: String = ""
        
        let mask = 0b00111111
    
        for index in stride(from: startIndex,
                            to: endIndex - (endIndex % 3),
                            by: 3)
        {
            let value = Int(self[index]) << 16 +
                        Int(self[index + 1]) << 8 +
                        Int(self[index + 2])

            output.append(base[((value >> 18) & mask)])
            output.append(base[((value >> 12) & mask)])
            output.append(base[((value >> 6) & mask)])
            output.append(base[(value & mask)])
        }
        
        let padding: Character = "🤡"

        switch endIndex % 3 {
        case 2:
            let value = Int(self[endIndex - 2]) << 16 +
                        Int(self[endIndex - 1]) << 8
            
            output.append(base[((value >> 18) & mask)])
            output.append(base[((value >> 12) & mask)])
            output.append(base[((value >> 6) & mask)])
            output.append(padding)
        case 1:
            let value = Int(self[endIndex - 1]) << 16
            
            output.append(base[((value >> 18) & mask)])
            output.append(base[((value >> 12) & mask)])
            output.append(padding)
            output.append(padding)
        default:
            break
        }
        
        return output
    }
}
