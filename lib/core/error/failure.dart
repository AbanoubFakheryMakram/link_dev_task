
///
///
/// [Failure] interface
///
/// Each failure class must implement this interface
///
/// Sub-classes:
///   a- [ServerFailure]
///
abstract class Failure {}

///
/// The [ServerFailure] class is responsible for presenting the errors caused by remote data sources error
/// which holds [errorCode] inside it
///
/// [ServerFailure] extends [Failure] interface
///
/// [ServerFailure] is returned from the repositories after catching the [ServerFailure] thrown by the remote data sources
///
// code => 500
class InternalServerErrorFailure extends Failure {}

// code => 400
class BadRequestFailure extends Failure {}

// code => 401
class UnauthorizedFailure extends Failure {}

// code => 404
class NotFoundFailure extends Failure {}

// code 405
class MethodNotAllowedFailure extends Failure {}

// code 408
class ConnectionTimeoutFailure extends Failure {}

// socketFailure
class NoInternetConnectionFailure extends Failure {}

// HttpFailure
class MyHttpFailure extends Failure {}

// FormatFailure
class MyFormatFailure extends Failure {}

class UnknownFailure extends Failure {}