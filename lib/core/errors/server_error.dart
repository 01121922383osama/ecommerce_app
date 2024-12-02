class ServerError implements Exception {
  final String errorMessage;
  const ServerError({this.errorMessage = "Somthing went wrong"});
}
