sealed class ApiResult<T> {
  const ApiResult();
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final String error;
  const Failure(this.error);
}

extension ApiResultX<T> on ApiResult<T> {
  R when<R>({
    required R Function(T data) success,
    required R Function(String error) failure,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    } else {
      return failure((this as Failure<T>).error);
    }
  }

  R maybeWhen<R>({
    R Function(T data)? success,
    R Function(String error)? failure,
    required R Function() orElse,
  }) {
    if (this is Success<T> && success != null) {
      return success((this as Success<T>).data);
    } else if (this is Failure<T> && failure != null) {
      return failure((this as Failure<T>).error);
    }
    return orElse();
  }
}
