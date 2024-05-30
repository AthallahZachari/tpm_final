import 'package:flutter/material.dart';

import 'base.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  static Future<Map<String, dynamic>> exchange() async {
    return BaseNetwork.getExchange();
  }
}
