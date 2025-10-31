// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

extension RMAPI {
  struct SearchCharactersQuery: GraphQLQuery {
    static let operationName: String = "SearchCharacters"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query SearchCharacters($name: String!, $page: Int) { characters(page: $page, filter: { name: $name }) { __typename info { __typename next } results { __typename id name species } } }"#
      ))

    public var name: String
    public var page: GraphQLNullable<Int32>

    public init(
      name: String,
      page: GraphQLNullable<Int32>
    ) {
      self.name = name
      self.page = page
    }

    @_spi(Unsafe) public var __variables: Variables? { [
      "name": name,
      "page": page
    ] }

    struct Data: RMAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { RMAPI.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("characters", Characters?.self, arguments: [
          "page": .variable("page"),
          "filter": ["name": .variable("name")]
        ]),
      ] }
      static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        SearchCharactersQuery.Data.self
      ] }

      /// Get the list of all characters
      var characters: Characters? { __data["characters"] }

      /// Characters
      ///
      /// Parent Type: `Characters`
      struct Characters: RMAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { RMAPI.Objects.Characters }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("info", Info?.self),
          .field("results", [Result?]?.self),
        ] }
        static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          SearchCharactersQuery.Data.Characters.self
        ] }

        var info: Info? { __data["info"] }
        var results: [Result?]? { __data["results"] }

        /// Characters.Info
        ///
        /// Parent Type: `Info`
        struct Info: RMAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { RMAPI.Objects.Info }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("next", Int?.self),
          ] }
          static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            SearchCharactersQuery.Data.Characters.Info.self
          ] }

          /// Number of the next page (if it exists)
          var next: Int? { __data["next"] }
        }

        /// Characters.Result
        ///
        /// Parent Type: `Character`
        struct Result: RMAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { RMAPI.Objects.Character }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", RMAPI.ID?.self),
            .field("name", String?.self),
            .field("species", String?.self),
          ] }
          static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            SearchCharactersQuery.Data.Characters.Result.self
          ] }

          /// The id of the character.
          var id: RMAPI.ID? { __data["id"] }
          /// The name of the character.
          var name: String? { __data["name"] }
          /// The species of the character.
          var species: String? { __data["species"] }
        }
      }
    }
  }

}