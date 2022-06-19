

class OxsResult<T, Fail> {
  T? success;
  Fail? failure;

  OxsResult.success({this.success});
  OxsResult.inValid({this.failure});
}

