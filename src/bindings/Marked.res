// Binding for the `marked` markdown parser.
// The named `marked` export renders a markdown string into HTML synchronously.
@module("marked") external parse: string => string = "marked"
