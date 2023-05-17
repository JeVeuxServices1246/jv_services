class Resource<T, G> {
  final T? data;
  final G? exception;
  Resource(this.data, this.exception);

  factory Resource.success(T successResp) {
    return Resource<T, G>(successResp, null);
  }

  factory Resource.exception(G exception) {
    return Resource<T, G>(null, exception);
  }
}
