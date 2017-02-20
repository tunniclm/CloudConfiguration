/*
 * Copyright IBM Corporation 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Configuration
import CloudFoundryEnv

/**
 Cloudant, MongoDB, Redis, PostgreSQL
 */

public enum ConfigurationManagerError: Error {
    case noServiceWithName(String)
    case invalidServiceCredentials
}

extension ConfigurationManager {
    private func ensureService(name: String) throws -> Service {
        guard let service = getService(spec: name) else {
            throw ConfigurationManagerError.noServiceWithName(name)
        }
        return service
    }

    public func getCloudantService(name: String) throws -> CloudantService {
        return try CloudantService(withService: ensureService(name: name))
    }

    public func getMongoDBService(name: String) throws -> MongoDBService {
        return try MongoDBService(withService: ensureService(name: name))
    }

    public func getRedisService(name: String) throws -> RedisService {
        return try RedisService(withService: ensureService(name: name))
    }

    public func getPostgreSQLService(name: String) throws -> PostgreSQLService {
        return try PostgreSQLService(withService: ensureService(name: name))
    }

    public func getMySQLService(name: String) throws -> MySQLService {
        return try MySQLService(withService: ensureService(name: name))
    }

    public func getDB2Service(name: String) throws -> DB2Service {
        return try DB2Service(withService: ensureService(name: name))
    }

    public func getAlertNotificationService(name: String) throws -> AlertNotificationService {
        return try AlertNotificationService(withService: ensureService(name: name))
    }

    public func getObjectStorageService(name: String) throws -> ObjectStorageService {
        return try ObjectStorageService(withService: ensureService(name: name))
    }

}
