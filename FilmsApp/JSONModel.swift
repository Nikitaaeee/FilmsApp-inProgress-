//
//  JSONModel.swift
//  FilmsApp
//
//  Created by Никита on 25.10.2021.
//

import Foundation

class JSONModel: Codable {
    var original_title: String?
    var poster_path: String?
    var release_date: String?
    var overview: String?
    var vote_average: String?
    var backdrop_path: String?
    
}

class TestModel {
    var testPic: String?
    var testTitle: String?
    var testYear: String?
    var testRating: String?
    
    init(testPic: String?, testTitle: String?, testYear: String?, testRating: String?) {
        self.testPic = testPic
        self.testTitle = testTitle
        self.testYear = testYear
        self.testRating = testRating
    }
}


var testArray: [TestModel] = [
    TestModel(testPic: "image1", testTitle: "Фильм 1", testYear: "2001", testRating: "4.7"),
    TestModel(testPic: "image2", testTitle: "Фильм 2", testYear: "2003", testRating: "4.1"),
    TestModel(testPic: "image3", testTitle: "Фильм 3", testYear: "2013", testRating: "4.3"),
    TestModel(testPic: "image4", testTitle: "Фильм 4", testYear: "2015", testRating: "4.8"),
    TestModel(testPic: "image5", testTitle: "Фильм 5", testYear: "2016", testRating: "9.0"),
    TestModel(testPic: "image6", testTitle: "Фильм 6", testYear: "2017", testRating: "4.6"),
    TestModel(testPic: "image7", testTitle: "Фильм 7", testYear: "2021", testRating: "6.9"),
    TestModel(testPic: "image8", testTitle: "Фильм 8", testYear: "2004", testRating: "5.3"),
    TestModel(testPic: "image9", testTitle: "Фильм 9", testYear: "2005", testRating: "1.4"),
    TestModel(testPic: "image10", testTitle: "Фильм 10", testYear: "2008", testRating: "5.8"),
    TestModel(testPic: "image11", testTitle: "Фильм 11", testYear: "2000", testRating: "4.9"),
    TestModel(testPic: "image12", testTitle: "Фильм 12", testYear: "2009", testRating: "4.3"),
    TestModel(testPic: "image13", testTitle: "Фильм 13", testYear: "2007", testRating: "1.9"),
    TestModel(testPic: "image14", testTitle: "Фильм 14", testYear: "2001", testRating: "8.5"),
    TestModel(testPic: "image15", testTitle: "Фильм 15", testYear: "2004", testRating: "7.7")
]
