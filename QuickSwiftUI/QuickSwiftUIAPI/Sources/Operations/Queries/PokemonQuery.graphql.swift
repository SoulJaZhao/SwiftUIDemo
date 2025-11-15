// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PokemonQuery: GraphQLQuery {
  public static let operationName: String = "Pokemon"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Pokemon($name: String!, $limit: Int, $offset: Int) { pokemon(where: { name: { _eq: $name } }, limit: $limit, offset: $offset) { __typename id name height weight pokemon_species_id pokemonabilities { __typename ability_id ability { __typename name } } } pokemonspecies(where: { name: { _eq: $name } }) { __typename id name pokemoncolor { __typename id name } } }"#
    ))

  public var name: String
  public var limit: GraphQLNullable<Int>
  public var offset: GraphQLNullable<Int>

  public init(
    name: String,
    limit: GraphQLNullable<Int>,
    offset: GraphQLNullable<Int>
  ) {
    self.name = name
    self.limit = limit
    self.offset = offset
  }

  public var __variables: Variables? { [
    "name": name,
    "limit": limit,
    "offset": offset
  ] }

  public struct Data: QuickSwiftUIAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { QuickSwiftUIAPI.Objects.Query_root }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("pokemon", [Pokemon].self, arguments: [
        "where": ["name": ["_eq": .variable("name")]],
        "limit": .variable("limit"),
        "offset": .variable("offset")
      ]),
      .field("pokemonspecies", [Pokemonspecy].self, arguments: ["where": ["name": ["_eq": .variable("name")]]]),
    ] }
    public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      PokemonQuery.Data.self
    ] }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var pokemon: [Pokemon] { __data["pokemon"] }
    /// An array relationship
    public var pokemonspecies: [Pokemonspecy] { __data["pokemonspecies"] }

    /// Pokemon
    ///
    /// Parent Type: `Pokemon`
    public struct Pokemon: QuickSwiftUIAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { QuickSwiftUIAPI.Objects.Pokemon }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("name", String.self),
        .field("height", Int?.self),
        .field("weight", Int?.self),
        .field("pokemon_species_id", Int?.self),
        .field("pokemonabilities", [Pokemonability].self),
      ] }
      public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        PokemonQuery.Data.Pokemon.self
      ] }

      public var id: Int { __data["id"] }
      public var name: String { __data["name"] }
      public var height: Int? { __data["height"] }
      public var weight: Int? { __data["weight"] }
      public var pokemon_species_id: Int? { __data["pokemon_species_id"] }
      /// An array relationship
      public var pokemonabilities: [Pokemonability] { __data["pokemonabilities"] }

      /// Pokemon.Pokemonability
      ///
      /// Parent Type: `Pokemonability`
      public struct Pokemonability: QuickSwiftUIAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { QuickSwiftUIAPI.Objects.Pokemonability }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("ability_id", Int?.self),
          .field("ability", Ability?.self),
        ] }
        public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          PokemonQuery.Data.Pokemon.Pokemonability.self
        ] }

        public var ability_id: Int? { __data["ability_id"] }
        /// An object relationship
        public var ability: Ability? { __data["ability"] }

        /// Pokemon.Pokemonability.Ability
        ///
        /// Parent Type: `Ability`
        public struct Ability: QuickSwiftUIAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { QuickSwiftUIAPI.Objects.Ability }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
          ] }
          public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            PokemonQuery.Data.Pokemon.Pokemonability.Ability.self
          ] }

          public var name: String { __data["name"] }
        }
      }
    }

    /// Pokemonspecy
    ///
    /// Parent Type: `Pokemonspecies`
    public struct Pokemonspecy: QuickSwiftUIAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { QuickSwiftUIAPI.Objects.Pokemonspecies }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("name", String.self),
        .field("pokemoncolor", Pokemoncolor?.self),
      ] }
      public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        PokemonQuery.Data.Pokemonspecy.self
      ] }

      public var id: Int { __data["id"] }
      public var name: String { __data["name"] }
      /// An object relationship
      public var pokemoncolor: Pokemoncolor? { __data["pokemoncolor"] }

      /// Pokemonspecy.Pokemoncolor
      ///
      /// Parent Type: `Pokemoncolor`
      public struct Pokemoncolor: QuickSwiftUIAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { QuickSwiftUIAPI.Objects.Pokemoncolor }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("name", String.self),
        ] }
        public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          PokemonQuery.Data.Pokemonspecy.Pokemoncolor.self
        ] }

        public var id: Int { __data["id"] }
        public var name: String { __data["name"] }
      }
    }
  }
}
