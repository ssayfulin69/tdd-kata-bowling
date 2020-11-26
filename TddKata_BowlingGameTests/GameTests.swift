import XCTest
@testable import TddKata_BowlingGame

class GameTests: XCTestCase {
    
    private var game: Game!
    
    override func setUp() {
        super.setUp()
        game = Game()
    }
    
    override func tearDown() {
        game = nil
        super.tearDown()
    }
    
    func testGutterGame() {
        roll(pins: 0, times: 20)
        XCTAssertEqual(game.score(), 0)
    }
    
    func testAllOnes() {
        roll(pins: 1, times: 20)
        XCTAssertEqual(game.score(), 20)
    }
    
    func testOneSpare() {
        rollSpare(whereFirstIs: 5)
        game.roll(3)
        roll(pins: 0, times: 17)
        XCTAssertEqual(game.score(), 16)
    }
    
    func testOneStrike() {
        rollStrike()
        game.roll(3)
        game.roll(4)
        roll(pins: 0, times: 16)
        XCTAssertEqual(game.score(), 24)
    }
    
    func testPrefectGame() {
        roll(pins: 10, times: 12)
        XCTAssertEqual(game.score(), 300)
    }
    
    // MARK: - Private
    
    private func roll(pins: Int, times: Int) {
        for _ in 1...times {
            game.roll(pins)
        }
    }
    
    private func rollSpare(whereFirstIs first: Int) {
        game.roll(first)
        game.roll(10 - first)
    }
    
    private func rollStrike() {
        game.roll(10)
    }
}
