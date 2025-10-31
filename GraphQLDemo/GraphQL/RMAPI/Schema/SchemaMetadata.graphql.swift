// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol RMAPI_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == RMAPI.SchemaMetadata {}

protocol RMAPI_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == RMAPI.SchemaMetadata {}

protocol RMAPI_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == RMAPI.SchemaMetadata {}

protocol RMAPI_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == RMAPI.SchemaMetadata {}

extension RMAPI {
  typealias SelectionSet = RMAPI_SelectionSet

  typealias InlineFragment = RMAPI_InlineFragment

  typealias MutableSelectionSet = RMAPI_MutableSelectionSet

  typealias MutableInlineFragment = RMAPI_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Character": return RMAPI.Objects.Character
      case "Characters": return RMAPI.Objects.Characters
      case "Info": return RMAPI.Objects.Info
      case "Query": return RMAPI.Objects.Query
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}