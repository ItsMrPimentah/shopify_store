abstract class BaseAPI<T> {
  Future<T> get({Map<String, String> headers});
}
