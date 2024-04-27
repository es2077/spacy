/* This is just a custom exception to indicate that something went wrong. */
exception Graphql_error(string)

@val
external graphQLServerUrlBackend: string = "process.env.NEXT_HASURA_GRAPHQL_API"

@val
external graphQLServerUrlFrontend: string = "process.env.NEXT_PUBLIC_HASURA_GRAPHQL_API"

let isBrowser = %raw(`graphQLServerUrlBackend => graphQLServerUrlBackend == undefined`)

let graphQLServerUrl = isBrowser(graphQLServerUrlBackend)
  ? graphQLServerUrlFrontend
  : graphQLServerUrlBackend

/**
 * A standard fetch that sends our operation and variables to the
 * GraphQL server, and then decodes and returns the response.
 */
let fetchQuery: option<string> => RescriptRelay.Network.fetchFunctionPromise = (
  authToken,
  operation,
  variables,
  _cacheConfig,
  _uploadables,
) => {
  open Fetch
  Js.log(`Calling ${graphQLServerUrl} with token ${authToken->Belt.Option.getWithDefault("none")}`)
  fetchWithInit(
    graphQLServerUrl,
    RequestInit.make(
      ~method_=Post,
      ~credentials=Include,
      ~body=Js.Dict.fromList(list{
        ("query", Js.Json.string(operation.text)),
        ("variables", variables),
      })
      ->Js.Json.object_
      ->Js.Json.stringify
      ->BodyInit.make,
      ~headers=HeadersInit.make({
        "content-type": "application/json",
        "accept": "application/json",
        // for SSR only
        "cookie": authToken->Belt.Option.map(authToken => `spacy_auth=${authToken};`),
      }),
      (),
    ),
  ) |> Js.Promise.then_(resp =>
    if Response.ok(resp) {
      Response.json(resp)
    } else {
      Js.Promise.reject(Graphql_error("Request failed: " ++ Response.statusText(resp)))
    }
  )
}

let make = (~records=?, ~authToken=?, ()) => {
  let network = RescriptRelay.Network.makePromiseBased(~fetchFunction=fetchQuery(authToken), ())
  let source = RescriptRelay.RecordSource.make(~records?, ())
  let store = RescriptRelay.Store.make(
    ~source,
    ~gcReleaseBufferSize=10 /* This sets the query cache size to 10 */,
    (),
  )

  RescriptRelay.Environment.make(~network, ~store, ())
}
