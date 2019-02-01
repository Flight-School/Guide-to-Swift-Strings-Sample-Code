public enum Style {
    case none
    case bold
    case italic
    case boldItalic
    case sansSerif(bold: Bool, italic: Bool)
    case script(bold: Bool)
    case fraktur(bold: Bool)
    case doubleStruck
    case monospace
}
