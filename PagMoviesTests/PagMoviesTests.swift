//
//  PagMoviesTests.swift
//  PagMoviesTests
//
//  Created by Israel on 15/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import XCTest
@testable import PagMovies

class PagMoviesTests: XCTestCase {

    var sut:DetailsMovieViewController!
    var movie:Movie!
    var genres:[Genre]!
    
    override func setUp() {
        super.setUp()
        movie = getAPIMovieData()?[0]
        genres = getAPIGenreData()
        guard movie != nil else { return }
        guard genres != nil else { return }
        sut = DetailsMovieViewController()
        sut.movie = movie
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        guard movie != nil else { return }
        XCTAssertEqual(movie.title, sut.movie?.title, "Objetos Iguais")
        XCTAssert(movie.id != nil)
        XCTAssert(genres.count > 0 , "Teste retorno API")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    private func getAPIMovieData() -> [Movie]? {
        
        if let path = Bundle.main.path(forResource: "Movies", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let result = try? decoder.decode(Result.self, from: data) {
                    return result.results
                }
            } catch let error {
                print("Error: \(error)")
            }
        }
        return nil
    }
    
    private func getAPIGenreData() -> [Genre]? {
        
        if let path = Bundle.main.path(forResource: "Genres", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let genres = try? decoder.decode(Genres.self, from: data) {
                    return genres.genres
                }
            } catch let error {
                print("Error: \(error)")
            }
        }
        return nil
    }

}
