//
//  MovieManagerTests.swift
//  FoodFestTests
//
//  Created by Takasur Azeem on 25/08/2021.
//

import XCTest

@testable import FoodFest

class FoodManagerTests: XCTestCase {
    
    var sut: FoodsManager!
    
    let pizza = Food(name: "Pizza")
    let burger = Food(name: "Burger")
    let karahi = Food(name: "Chicken")
    let eggs = Food(name: "Eggs")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = FoodsManager()
        XCTAssertNotNil(sut)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_MoviesToSeeReturnsZero() {
        XCTAssertEqual(sut.foodsToTryCount, 0)
    }
    
    func testInit_FoodsTried_ReturnsZero() {
        XCTAssertEqual(sut.foodsTriedCount, 0)
    }
    
    // MARK: - Add & Query
    func testAdd_FoodToTry_ReturnsZero() {
        sut.addFood(food: pizza)
        
        XCTAssertEqual(sut.foodsToTryCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        sut.addFood(food: burger)
        
        let foodQueried = sut.foodToTryAtIndex(index: 0)
        XCTAssertEqual(foodQueried.name, burger.name)
    }
    
    // MARK: - Checking Off
    func testCheckOffFood_UpdatesFoodManagerCount() {
        sut.addFood(food: eggs)
        sut.checkOffFoodAtIndex(index: 0)
        
        XCTAssertEqual(sut.foodsToTryCount, 0)
        XCTAssertEqual(sut.foodsTriedCount, 1)
    }
    
    
    func testCheckOffFood_RemovesFoodFromArray() {
        sut.addFood(food: pizza)
        sut.addFood(food: burger)
        sut.checkOffFoodAtIndex(index: 0)
        
        XCTAssertEqual(sut.foodToTryAtIndex(index: 0).name, burger.name)
    }
    
    func testCheckOffFood_ReturnsFoodAtIndex() {
        sut.addFood(food: pizza)
        sut.addFood(food: burger)
        sut.checkOffFoodAtIndex(index: 0)
        
        let triedFood = sut.foodTriedAtIndex(index: 0)
        XCTAssertEqual(pizza.name, triedFood.name)
    }
    
    // MARK: - Clearing and resetting
    
    func testClearArrays_ReturnsArrayCountsOfZero() {
        sut.addFood(food: pizza)
        sut.addFood(food: burger)
        sut.checkOffFoodAtIndex(index: 1)
        
        XCTAssertEqual(sut.foodsToTryCount, 1)
        XCTAssertEqual(sut.foodsTriedCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.foodsToTryCount, 0)
        XCTAssertEqual(sut.foodsTriedCount, 0)
    }
    
    // MARK: - Mark Duplicates
    
    func testDupllicateFoods_ShouldNotBeAddedToArray() {
        sut.addFood(food: pizza)
        sut.addFood(food: pizza)
        
        XCTAssertEqual(sut.foodsToTryCount, 1)
    }
    
}
