/// class that manages and retries to execute an asynchronous function on input
class RetryFunction {
  int _retryCounter = 0;
  Future<T> retry<T>(
    Future<T> Function() method, {
    int retryCounter = 2,
    int millisecondsRetryDelay = 300,
  }) async {
    try {
      final result = await method.call();
      _retryCounter = 0;
      return result;
    } catch (e) {
      _retryCounter += 1;
      if (_retryCounter > retryCounter) {
        rethrow;
      } else {
        return await Future.delayed(
                Duration(milliseconds: millisecondsRetryDelay))
            .then<T>((_) async => await retry<T>(method,
                retryCounter: retryCounter,
                millisecondsRetryDelay: millisecondsRetryDelay));
      }
    }
  }
}
