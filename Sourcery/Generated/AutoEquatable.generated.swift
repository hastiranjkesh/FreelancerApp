// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


extension ProjectModel: Equatable {
  public static func ==(lhs: ProjectModel, rhs: ProjectModel) -> Bool {
    guard lhs.name == rhs.name else { return false }
    guard lhs.hours == rhs.hours else { return false }
    guard lhs.id == rhs.id else { return false }

    return true
  }
}
extension TimeModel: Equatable {
  public static func ==(lhs: TimeModel, rhs: TimeModel) -> Bool {
    guard lhs.date == rhs.date else { return false }
    guard lhs.hours == rhs.hours else { return false }
    guard lhs.projectId == rhs.projectId else { return false }
    guard lhs.timeId == rhs.timeId else { return false }

    return true
  }
}
