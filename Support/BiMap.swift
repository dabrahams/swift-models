
public struct BiMap<Key: Hashable, Value: Hashable> {
  public typealias Key = Key
  public typealias Value = Value

  var keyed: [Key:Value] = [:]
  // TODO: specialize where value is Int32 such that valued is actually an
  // array?
  var valued: [Value:Key] = [:]

  public init(mapping: [Key:Value]) {
    for (key, value) in mapping {
      keyed[key] = value
      valued[value] = key
    }
  }

  public mutating func reserveCapacity(_ minimumCapacity: Int) {
    keyed.reserveCapacity(minimumCapacity)
    valued.reserveCapacity(minimumCapacity)
  }

  public var count: Int {
    assert(keyed.count == valued.count,
           "keyed count: \(keyed.count), valued count: \(valued.count), \(self)")
    return keyed.count
  }

  public subscript(key: Key) -> Value? {
    get { return keyed[key] }
    set(value) {
      guard let value = value else { return }
      keyed[key] = value
      valued[value] = key
    }
  }

  public subscript(value: Value) -> Key? {
    get { return valued[value] }
    set(key) {
      guard let key = key else { return }
      keyed[key] = value
      valued[value] = key
    }
  }
}

extension BiMap: ExpressibleByDictionaryLiteral {
  public init(dictionaryLiteral elements: (Self.Key, Self.Value)...) {
    for (key, value) in elements {
      keyed[key] = value
      valued[value] = key
    }
  }
}
