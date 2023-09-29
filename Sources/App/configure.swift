import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(hostname: "localhost", username: "postgres", password: "", database: "moviesappdb"), as: .psql)

    app.migrations.add(CreateMovie())
    app.migrations.add(CreateReview())
    app.migrations.add(CreateActor())
    app.migrations.add(CreateMovieActor())
    app.migrations.add(AddPosterColumnToMovies())

    // register routes
    try routes(app)
}
