//
//  File.swift
//  
//
//  Created by shikhar on 29/09/23.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateMovie: Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("movies") // table name
            .id()
            .field("title", .string) // column name
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("movies").delete() // drop the table
    }
    
}
