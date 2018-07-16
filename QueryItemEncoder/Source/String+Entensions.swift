extension String {
    mutating func dropZeroes() {
        var tmp = Substring(self)
        while tmp.last == "0" {
            tmp = tmp.dropLast()
        }
        if tmp.last == "." {
            tmp = tmp.dropLast()
        }
        self = String(tmp)
    }
}
