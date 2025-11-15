// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == QuickSwiftUIAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == QuickSwiftUIAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == QuickSwiftUIAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == QuickSwiftUIAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "ability": return QuickSwiftUIAPI.Objects.Ability
    case "pokemon": return QuickSwiftUIAPI.Objects.Pokemon
    case "pokemonability": return QuickSwiftUIAPI.Objects.Pokemonability
    case "pokemoncolor": return QuickSwiftUIAPI.Objects.Pokemoncolor
    case "pokemonspecies": return QuickSwiftUIAPI.Objects.Pokemonspecies
    case "query_root": return QuickSwiftUIAPI.Objects.Query_root
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
