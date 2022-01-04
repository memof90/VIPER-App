//
//  User.swift
//  VIPER-Air
//
//  Created by Memo Figueredo on 3/1/22.
//

import Foundation

struct Users: Codable {
    let results : [UserResult]?
    let info :Info?

    enum CodingKeys: String, CodingKey {
        case results
        case info
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([UserResult].self, forKey: .results)
        self.info = try container.decode(Info.self, forKey: .info)
    }
}

// MARK: - Info
struct Info: Codable {
    let seed: String?
    let results: Int?
    let page: Int?
    let version: String?

    enum CodingKeys: String, CodingKey {
        case seed
        case results
        case page
        case version
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.seed = try container.decode(String.self, forKey: .seed)
        self.results = try container.decode(Int.self, forKey: .results)
        self.page = try container.decode(Int.self, forKey: .page)
        self.version = try container.decode(String.self, forKey: .version)
    }
}

// MARK: - Results
struct UserResult: Codable {
    let gender: String?
    let name : Name?
    let location: Location?
    let email : String?
    let login: Login?
    let dob : Dob?
    let registered: Registered?
    let phone: String?
    let cell: String?
    let id : ID?
    let picture: Picture?
    let nat: String?



    enum CodingKeys: String, CodingKey {
        case gender
        case name
        case location
        case email
        case login
        case dob
        case registered
        case phone
        case cell
        case id
        case picture
        case nat
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.name = try container.decode(Name.self, forKey: .name)
        self.location = try container.decode(Location.self, forKey: .location)
        self.email = try container.decode(String.self, forKey: .email)
        self.login = try container.decode(Login.self, forKey: .login)
        self.dob = try container.decode(Dob.self, forKey: .dob)
        self.registered = try container.decode(Registered.self, forKey: .registered)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.cell = try container.decode(String.self, forKey: .cell)
        self.id = try container.decode(ID.self, forKey: .id)
        self.picture = try container.decode(Picture.self, forKey: .picture)
        self.nat = try container.decode(String.self, forKey: .nat)
    }
}


struct Name : Codable {
    let title: String?
    let first: String?
    let last: String?
}

struct Location: Codable {
    let street: Street?
    let city: String?
    let state: String?
    let postcode: Int?
    let coordinates: Coordinates?
    let timezone: TimeZone?
    
   

    enum CodingKeys: String, CodingKey  {
        case street
        case city
        case state
        case postcode
        case coordinates
        case timezone
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.street = try container.decode(Street.self, forKey: .street)
        self.city = try container.decode(String.self, forKey: .city)
        self.state = try container.decode(String.self, forKey: .state)
        self.postcode = try container.decode(Int.self, forKey: .postcode)
        self.coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
        self.timezone = try container.decode(TimeZone.self, forKey: .timezone)
    }
}

struct Street: Codable {
    let number: Int?
    let name: String?

    enum CodingKeys: String, CodingKey  {
        case number
        case name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decode(Int.self, forKey: .number)
        self.name = try container.decode(String.self, forKey: .name)
    }
}

struct Coordinates: Codable {
    let latitude: String?
    let longitude: String?

    enum CodingKeys: String, CodingKey  {
        case latitude
        case longitude
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.latitude = try container.decode(String.self, forKey: .latitude)
        self.longitude = try container.decode(String.self, forKey: .longitude)
    }


}


struct TimeZone: Codable {
    let offset : String?
    let description: String?


    enum CodingKeys: String, CodingKey  {
        case offset
        case description
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.offset = try container.decode(String.self, forKey: .offset)
        self.description = try container.decode(String.self, forKey: .description)
    }
}

struct Login : Codable{
    let uuid: String?
    let username: String?
    let password: String?
    let salt : String?
    let md5: String?
    let sha1: String?
    let sha256: String?

    enum CodingKeys: String, CodingKey  {
        case uuid
        case username
        case password
        case salt
        case md5
        case sha1
        case sha256
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uuid = try container.decode(String.self, forKey: .uuid)
        self.username = try container.decode(String.self, forKey: .username)
        self.password = try container.decode(String.self, forKey: .password)
        self.salt = try container.decode(String.self, forKey: .salt)
        self.md5 = try container.decode(String.self, forKey: .md5)
        self.sha1 = try container.decode(String.self, forKey: .sha1)
        self.sha256 = try container.decode(String.self, forKey: .sha256)
    }

}

struct Dob: Codable {
    let date : String?
    let age: Int?

    enum CodingKeys: String, CodingKey  {
        case date
        case age
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date =  try container.decode(String.self, forKey: .date)
        self.age =  try container.decode(Int.self, forKey: .age)
    }
}

struct Registered: Codable {

    let date : String?
    let age : Int?

    enum CodingKeys: String, CodingKey  {
        case date
        case age
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date =  try container.decode(String.self, forKey: .date)
        self.age =  try container.decode(Int.self, forKey: .age)
    }
}

struct ID: Codable {
    let name : String?
    let value: String?

    enum CodingKeys: String, CodingKey  {
        case name
        case value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name =  try container.decode(String.self, forKey: .name)
        self.value = try container.decode(String.self, forKey: .name)
    }

}


struct Picture: Codable {
    let large: String?
    let medium: String?
    let thumbnail: String?

    enum CodingKeys: String, CodingKey  {
        case large
        case medium
        case thumbnail
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.large = try container.decode(String.self, forKey: .large)
        self.medium = try container.decode(String.self, forKey: .medium)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
    }
}




