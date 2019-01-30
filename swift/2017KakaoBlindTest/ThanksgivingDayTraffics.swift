import Cocoa

extension String {

    func splitByWhiteSpace() -> [String] {
        return self.split(separator: " ").map { String($0) }
    }

    func splitByColon() -> [String] {
        return self.split(separator: ":").map { String($0) }
    }

}

typealias Seconds = Double

func convertTimeToSeconds(hours: Int, minutes: Int, seconds: Seconds) -> Seconds {
    let hoursToSec = Seconds(hours * 60 * 60)
    let minutesToSec = Seconds(minutes * 60)
    return hoursToSec + minutesToSec + seconds
}

func calculateTime(endTime: String, runTime: String) -> (start: Seconds, end: Seconds) {
    let endTimeStringSplit = endTime.splitByColon()
    let endTimeToSeconds = convertTimeToSeconds(hours: Int(endTimeStringSplit[0])!,
                                            minutes: Int(endTimeStringSplit[1])!,
                                            seconds: Double(endTimeStringSplit[2])!)
    let runTime = Seconds(runTime.dropLast())!
    let startTimeToSeconds = endTimeToSeconds - runTime + 0.001 - 0.9999
    return (start: startTimeToSeconds, end: endTimeToSeconds)
}

func preventDuplication(of time: Seconds, in dict: [Seconds: Int]) -> Seconds {
    if dict.keys.contains(time) {
        return preventDuplication(of: time - 0.0000001, in: dict)
    }
    return time
}

func makeLogList(by lines:[String]) -> [Seconds: Int] {
    var logs = [Seconds: Int]()
    var identifier = 0
    
    for line in lines {
        let lineSplit = line.splitByWhiteSpace()
        let time = calculateTime(endTime: lineSplit[1], runTime: lineSplit[2])
        
        let startSeconds = preventDuplication(of: time.start, in: logs)
        let endSeconds = preventDuplication(of: time.end, in: logs)
        
        logs[startSeconds] = identifier
        logs[endSeconds] = identifier
        identifier += 1
    }
    return logs
}

func solution(_ lines:[String]) -> Int {
    let logs = makeLogList(by: lines)
    var traffics = Array(repeating: false, count: lines.count)
    
    var trafficsPerSec = [Int]()
    
    for key in logs.keys.sorted() {
        let identifier: Int = logs[key]!
        
        traffics[identifier].toggle()
        
        let count = traffics.compactMap { $0 ? $0 : nil}.count
        trafficsPerSec.append(count)
    }
    
    return trafficsPerSec.max()!
}
