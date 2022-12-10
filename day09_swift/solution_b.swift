struct Position: Hashable {
    var x: Int = 0;
    var y: Int = 0;

    mutating func regulate(_ to: Position) {
        if (abs(to.x - self.x) > 1 || abs(to.y - self.y) > 1) {
            self.x += regulatedValue(from: self.x, to: to.x)
            self.y += regulatedValue(from: self.y, to: to.y)
        }
    }
    
    func regulatedValue(from: Int, to: Int) -> Int {
        return from == to ? 0 : (from > to ? -1 : 1)
    }
}

struct Rope {
    var knots: [Position] = []
    var visitedPositions: Set<Position> = []

    init(range: Int) {
        for _ in 1...range { 
          self.knots.append(Position()) 
        }
    }

    mutating func move(x: Int, y: Int) {
        knots[0].x += x
        knots[0].y += y
        
        for i in 1..<knots.count {
            knots[i].regulate(knots[i - 1])
        }
        
        visitedPositions.insert(knots.last!)
    }
}

var rope = Rope(range: 10)

while let line = readLine() {
    var x: Int = 0, y: Int = 0

    switch line.prefix(1) {
        case "R": x = 1
        case "L": x = -1
        case "D": y = 1
        default: y = -1
    }
    
    for i in 1...Int(line.dropFirst(2))! { 
        rope.move(x: x, y: y) 
    }
}
print(rope.visitedPositions.count)