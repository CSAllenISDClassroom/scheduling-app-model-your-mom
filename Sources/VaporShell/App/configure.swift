/*
VaporShell provides a minimal framework for starting Vapor projects.
Copyright (C) 2021, 2022 CoderMerlin.com
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import Vapor

// UNCOMMENT-DATABASE to configure database example
import Fluent
import FluentMySQLDriver

// configures your application
public func configure(_ app: Application) throws {
    // UNCOMMENT-PUBLIC to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // UNCOMMENT-DATABASE to configure database example
    var tls = TLSConfiguration.makeClientConfiguration()
    tls.certificateVerification = .none

    guard let hostname = Environment.get("AHSSchedule_DB_HOSTNAME"),
          let username = Environment.get("AHSSchedule_DB_USERNAME"),
          let password = Environment.get("AHSSchedule_DB_PASSWORD"),
          let database = Environment.get("AHSSchedule_DB_NAME") else {
        fatalError("DB configuration missing from environemnt")
    }
          
    app.databases.use(.mysql(
                        hostname: hostname,
                        port: MySQLConfiguration.ianaPortNumber,
                        username: username,
                        password: password,
                        database: database,
                        tlsConfiguration: tls
                      ), as: .mysql)
 
   // Set local port
    guard let portString = Environment.get("VAPOR_LOCAL_PORT"),
          let port = Int(portString) else {
        fatalError("Failed to determine VAPOR LOCAL PORT from environment")
    }
    app.http.server.configuration.port = port

    // Set local host
    guard let hostname = Environment.get("VAPOR_LOCAL_HOST") else {
        fatalError("Failed to determine VAPOR LOCAL HOST from environment")
    }
    app.http.server.configuration.hostname = hostname

    // register routes
    try routes(app)
}

