import Foundation
/// Linear search algorithm: return the index of the fiven target
/// O(N)
/// - Parameters
///     - collection: array of ints 
///     - target: search target

func linearSearch<T: Equatable>(_ collection:[T], _ target: T) -> Int?{
    for (index, element) in collection.enumerated() where element == target{
        return index
    }
    return nil
}

/// Linear search algorithm: return the index of the fiven target
/// O(log N)
/// - Parameters
///     - collection: array of ints 
///     - target: search target

func binarySearch<T: Comparable>(_ collection:[T], _ target: T) -> Int?{
    var left = 0
    var right = collection.count - 1

    while left <= right {
        let middle = Int(floor(Double(left + right) / 2.0))
        if collection[middle] < target {
            left = middle + 1
        } else if collection[middle] > target {
            right = middle - 1
        } else {
            return middle
        }
    }

    return nil
}

