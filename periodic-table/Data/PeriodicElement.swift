//
//  PeriodicElement.swift
//  periodic-table
//
//  Created by Imran Mohammed on 11/08/19.
//  Copyright © 2019 Able. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let periodicElementList = try PeriodicElementList(json)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - PeriodicElementList
struct PeriodicElementList: Codable, Equatable {
  var elements: [Element]
}

// MARK: PeriodicElementList convenience initializers and mutators

extension PeriodicElementList {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(PeriodicElementList.self, from: data)
  }

  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }

  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }

  func with(
    elements: [Element]? = nil
    ) -> PeriodicElementList {
    return PeriodicElementList(
      elements: elements ?? self.elements
    )
  }

  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }

  static func readJSONFromFile(fileName: String = "PeriodicTableJSON") -> PeriodicElementList? {
    var json: PeriodicElementList?
    if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
      do {
        let fileUrl = URL(fileURLWithPath: path)
        // Getting data from JSON file using the file URL
        let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
        json = try? PeriodicElementList(data: data)
      } catch {
        // Handle error here
      }
    }
    return json
  }

}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Element
struct Element: Codable, Equatable, Hashable {
  let name: String
  let appearance: String?
  let atomicMass: Double
  let boil: Double?
  let category: String
  var color: String?
  let density: Double?
  let discoveredBy: String?
  let melt, molarHeat: Double?
  let namedBy: String?
  let number, period: Int
  let phase: Phase
  let source: String
  let spectralImg: String?
  let summary, symbol: String
  let xpos, ypos: Int
  let shells: [Int]
  let electronConfiguration: String
  let electronAffinity, electronegativityPauling: Double?
  let ionizationEnergies: [Double]

  enum CodingKeys: String, CodingKey {
    case name, appearance
    case atomicMass = "atomic_mass"
    case boil, category, color, density
    case discoveredBy = "discovered_by"
    case melt
    case molarHeat = "molar_heat"
    case namedBy = "named_by"
    case number, period, phase, source
    case spectralImg = "spectral_img"
    case summary, symbol, xpos, ypos, shells
    case electronConfiguration = "electron_configuration"
    case electronAffinity = "electron_affinity"
    case electronegativityPauling = "electronegativity_pauling"
    case ionizationEnergies = "ionization_energies"
  }
}

// MARK: Element convenience initializers and mutators

extension Element {

  init(data: Data) throws {
    self = try newJSONDecoder().decode(Element.self, from: data)
  }

  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }

  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }

  func with(
    name: String? = nil,
    appearance: String?? = nil,
    atomicMass: Double? = nil,
    boil: Double?? = nil,
    category: String? = nil,
    color: String?? = nil,
    density: Double?? = nil,
    discoveredBy: String?? = nil,
    melt: Double?? = nil,
    molarHeat: Double?? = nil,
    namedBy: String?? = nil,
    number: Int? = nil,
    period: Int? = nil,
    phase: Phase? = nil,
    source: String? = nil,
    spectralImg: String?? = nil,
    summary: String? = nil,
    symbol: String? = nil,
    xpos: Int? = nil,
    ypos: Int? = nil,
    shells: [Int]? = nil,
    electronConfiguration: String? = nil,
    electronAffinity: Double?? = nil,
    electronegativityPauling: Double?? = nil,
    ionizationEnergies: [Double]? = nil
    ) -> Element {
    return Element(
      name: name ?? self.name,
      appearance: appearance ?? self.appearance,
      atomicMass: atomicMass ?? self.atomicMass,
      boil: boil ?? self.boil,
      category: category ?? self.category,
      color: color ?? self.color,
      density: density ?? self.density,
      discoveredBy: discoveredBy ?? self.discoveredBy,
      melt: melt ?? self.melt,
      molarHeat: molarHeat ?? self.molarHeat,
      namedBy: namedBy ?? self.namedBy,
      number: number ?? self.number,
      period: period ?? self.period,
      phase: phase ?? self.phase,
      source: source ?? self.source,
      spectralImg: spectralImg ?? self.spectralImg,
      summary: summary ?? self.summary,
      symbol: symbol ?? self.symbol,
      xpos: xpos ?? self.xpos,
      ypos: ypos ?? self.ypos,
      shells: shells ?? self.shells,
      electronConfiguration: electronConfiguration ?? self.electronConfiguration,
      electronAffinity: electronAffinity ?? self.electronAffinity,
      electronegativityPauling: electronegativityPauling ?? self.electronegativityPauling,
      ionizationEnergies: ionizationEnergies ?? self.ionizationEnergies
    )
  }

  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

enum Phase: String, Codable, Equatable {
  case gas = "Gas"
  case liquid = "Liquid"
  case solid = "Solid"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
  let decoder = JSONDecoder()
  if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
    decoder.dateDecodingStrategy = .iso8601
  }
  return decoder
}

func newJSONEncoder() -> JSONEncoder {
  let encoder = JSONEncoder()
  if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
    encoder.dateEncodingStrategy = .iso8601
  }
  return encoder
}
