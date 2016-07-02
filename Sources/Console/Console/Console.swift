#if os(Linux)
    import Glibc
#else
    import Darwin
#endif

/**
    Protocol for powering styled Console I/O.
*/
public protocol Console {
    func output(_ string: String, style: ConsoleStyle, newLine: Bool)
    func input() -> String
    func clear(_ clear: ConsoleClear)
}

extension Console {
    /**
        Out method with plain default and newline.
    */
    public func output(_ string: String, style: ConsoleStyle = .plain, newLine: Bool = true) {
        output(string, style: style, newLine: newLine)
    }

    public func wait(seconds: Double) {
        let factor = 1000 * 1000
        let microseconds = seconds * Double(factor)
        usleep(useconds_t(microseconds))
    }
}