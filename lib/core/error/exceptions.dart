
///
/// [InternalServerErrorException] implements [Exception] interface
///

// code => 500
class InternalServerErrorException implements Exception {}

// code => 400
class BadRequestException implements Exception {}

// code => 401
class UnauthorizedException implements Exception {}

// code => 404
class NotFoundException implements Exception {}

// code 405
class MethodNotAllowedException implements Exception {}

// code 408
class ConnectionTimeoutException implements Exception {}

// socketException
class NoInternetConnectionException implements Exception {}

// HttpException
class MyHttpException implements Exception {}

// FormatException
class MyFormatException implements Exception {}

// For unexpected errors
class UnknownException implements Exception {}