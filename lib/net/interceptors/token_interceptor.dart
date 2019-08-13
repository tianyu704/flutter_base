import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/db/sp/sp_key.dart';
import 'package:flutter_base/db/sp/sp_utils.dart';

import 'package:flutter_base/base/base_config.dart';

///Token拦截器
class TokenInterceptors extends InterceptorsWrapper {
  String _token;

  @override
  onRequest(RequestOptions options) async {
    //授权码
    if (_token == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    options.headers["authtoken"] = _token;
    return options;
  }

  @override
  onResponse(Response response) async {
    try {
      debugPrint("--------${response.statusCode.toString()}");
      if (response.statusCode == 200 &&
          response.headers.value("authtoken") != null) {
        _token = response.headers.value("authtoken");
        debugPrint(_token);
        await SpUtils().put(SpKey.token, _token);
      }
    } catch (e) {
      print(e);
    }
    return response;
  }

  ///清除授权
  clearAuthorization() {
    this._token = null;
    SpUtils().remove(SpKey.token);
  }

  ///获取授权token
  getAuthorization() async {
    String token = SpUtils().getString(SpKey.token);
    if (token == null) {
      //TODO
      //去登录
    } else {
      this._token = token;
      return token;
    }
  }
}
