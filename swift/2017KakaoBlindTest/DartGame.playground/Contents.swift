import Cocoa

struct Regex {
    static let score = "[0-9]{1,2}"
    static let area = "[S|D|T]"
    static let bonus = "[*|#]"
    static let turn = "(\(score))(\(area))(\(bonus)?)"
}

func captureGroup(in string: String, by pattern: String) -> [String] {
    guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else { return [] }
    let range = NSRange(string.startIndex..., in: string)
    let matches = regex.matches(in: string, options: [], range: range)
    return matches.map { String(string[Range($0.range, in: string)!]) }
}

func calculateScore(of turn: String) -> Double? {
    let areaDict: [String: Double] = ["S": 1, "D": 2, "T": 3]
    guard let scoreString = captureGroup(in: turn, by: Regex.score).first else { return nil }
    guard let score = Double(scoreString) else { return nil }
    guard let area = captureGroup(in: turn, by: Regex.area).first else { return nil }
    guard let square = areaDict[area] else { return nil }
    return pow(score, square)
}

func solution(_ dartResult:String) -> Int {
    var scores: [Double] = []
    let bonusDict: [String: Double] = ["*": 2, "#": -1]
    let turns = captureGroup(in: dartResult, by: Regex.turn)
    for (index, turn) in turns.enumerated() {
        guard let score = calculateScore(of: turn) else { continue }
        scores.append(score)
        guard let bonus = captureGroup(in: turn, by: Regex.bonus).first else { continue }
        guard let bonusPoint = bonusDict[bonus] else { continue }
        if (index == 0 ) || (bonus == "#") {
            scores[index] *= bonusPoint
            continue
        } else {
            scores[index-1] *= bonusPoint
            scores[index] *= bonusPoint
        }
    }
    return Int(scores.reduce(0, { x, y in x + y }))
}

solution("1S2D*3T")
solution("1D2S#10S")
solution("1D2S0T")
solution("1S*2T*3S")
solution("1D#2S*3S")
solution("1T2D3D#")
solution("1D2S3T*")
