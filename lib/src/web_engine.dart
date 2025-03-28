/// Abstract class for interacting with a web view's engine and capabilities.
abstract class WebEngine {
  /// Evaluate the given [code] in the web view and return the result.
  Future<T> eval<T>(String code);

  /// Call a method by it's [name] and [arguments] in the web view and return
  /// the result.
  Future<T> callMethod<T>(String name, List<dynamic> arguments);
}
