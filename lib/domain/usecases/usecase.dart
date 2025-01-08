// RT: represents the Return Type(RT) for a use case.
// Params: represents a container for the input parameter(s) required by a use case. Its primary role is to encapsulate
// the input data that a use case need to perform its business logic. The Params class representations are useful when a use case
// requires more that one parameter, but for consistency, i'm going to use a Params class even if it encapsulate a single parameter.
abstract class UseCase<RT, Params> {
  Future<RT> call(Params p);
}

// This class is used when a use case does not require any parameter.
class NoParams {}

class ToolUserIdParam {
  final int toolUserId;
  ToolUserIdParam({required this.toolUserId});
}

class ToolIdParam {
  final int toolId;

  ToolIdParam({required this.toolId});
}
