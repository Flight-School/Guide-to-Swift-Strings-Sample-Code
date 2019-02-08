import Foundation

"Avión".applyingTransform(.stripDiacritics, reverse: false)

"©".applyingTransform(.toXMLHex, reverse: false)

"🛂".applyingTransform(.toUnicodeName, reverse: false)

"マット".applyingTransform(.fullwidthToHalfwidth, reverse: false)

"""
안전 벨트를 휘게하십시오
""".applyingTransform(.toLatin, reverse: false)
