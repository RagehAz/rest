part of rest;

class Rest {
  // -----------------------------------------------------------------------------

  const Rest();

  // -----------------------------------------------------------------------------

  /// CREATE

  // --------------------
  ///
  static Future<http.Response> postMap({
    @required Map<String, dynamic> map,
    @required String rawLink,
    Map<String, String> headers,
    Encoding encoding,
    String invoker = '',
  }) async {

    http.Response _response;

    await tryAndCatch(
      invoker: 'REST : postMap : $invoker',
      functions: () async {

        /// POST REQUEST
        _response = await http.post(
          Uri.parse(rawLink),
          body: json.encode(map),
          headers: headers,
          encoding: encoding,
        );

      },

    );

    return _response;
  }
  // -----------------------------------------------------------------------------

  /// READ

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<http.Response> get({
    @required BuildContext context,
    @required String rawLink,
    @required String invoker,
    Map<String, String> headers,
    int timeoutSeconds = 10,
  }) async {

    http.Response _response;

    try {

      /// GET REQUEST
      _response = await http.get(
        Uri.parse(rawLink),
        headers: headers,
      ).timeout(
          Duration(seconds: timeoutSeconds),
          onTimeout: () async {
            blog('Rest.get timeout occurred');
            return null;
          }
      );

      // blog('rest.get : _response : ${_response?.body}');

    }
    on TimeoutException catch (error) {
      blog('Rest.get.TimeoutException : $invoker : error.message : ${error.message}');
    }
    on Exception catch (error) {
      blog('Rest.get.Exception : $invoker : error.message : $error');
    }

    // if (_response != null){
      // final response = await request.close().timeout(const Duration(seconds: 10));
    // }

    return _response;

  }
  // --------------------
  ///
  static Future<Uint8List> readBytes({
    @required String rawLink,
    String invoker = '',
    int timeoutSeconds = 2,
    Map<String, String> headers,
  }) async {

    Uint8List _uInts;

    await tryAndCatch(
      // context: context,
      invoker: 'REST : get : $invoker',
      functions: () async {

        /// GET REQUEST
        _uInts = await http.readBytes(
          Uri.parse(rawLink),
          headers: headers,
        ).timeout(
            Duration(seconds: timeoutSeconds),
            onTimeout: () async {
              blog('Rest.get timeout occurred');
              return null;
            }
        );


      },


    );

    return _uInts;

  }
  // -----------------------------------------------------------------------------

  /// UPDATE

  // --------------------
  ///
  static Future<http.Response> patchMap({
    @required Map<String, dynamic> input,
    @required String rawLink,
    Map<String, String> headers,
    Encoding encoding,
    String invoker = '',
  }) async {

    http.Response _response;

    await tryAndCatch(
      invoker: 'Rest : patch : $invoker',
      functions: () async {

        /// PATCH REQUEST
        _response = await http.patch(
          Uri.parse(rawLink),
          body: json.encode(input),
          headers: headers,
          encoding: encoding,
        );

      },

    );

    return _response;
  }
  // -----------------------------------------------------------------------------

  /// DELETE

  // --------------------
  ///
  static Future<http.Response> delete({
    @required String rawLink,
    Object body,
    Map<String, String> headers,
    Encoding encoding,
    String invoker = '',
  }) async {

    http.Response _response;

    await tryAndCatch(
      invoker: 'Rest : delete : $invoker',
      functions: () async {

        /// DELETE REQUEST
        _response = await http.delete(
          Uri.parse(rawLink),
          body: body,
          headers: headers,
          encoding: encoding,
        );

      },

    );

    return _response;

  }
  // -----------------------------------------------------------------------------

  /// ERROR HANDLING

  // --------------------
  /*
  /// TESTED : WORKS PERFECT
  static Future<http.Response> _checkUpResponse({
    @required http.Response response,
    @required String invoker,
    Function(http.Response response) onError,
  }) async {

    http.Response _output;

    /// RESPONSE IS NULL
    if (response == null){
      blog('REST : _checkUpResponse : response is null');
    }

    /// RESPONSE RECEIVED
    else {

      if (response.statusCode == 200){
        _output = response;
      }

      else if (response.statusCode >= 400){

        if (onError != null){
          onError(response);
        }

      }

    }

    return _output;
  }
   */
  // --------------------
  /*
  /// TESTED : WORKS PERFECT
  static Future<void> _onHttpError({
    @required BuildContext context,
    @required String error,
    @required String invoker,
  }) async {

    blog('onHttpError : $invoker : error : $error');

  }
   */
  // -----------------------------------------------------------------------------
}
