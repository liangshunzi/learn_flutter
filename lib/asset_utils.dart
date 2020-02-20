import 'package:flutter/services.dart';

class AssetsUtils{


  static Future<String> loadAssetsString(String filePath) async { 
     return await rootBundle.loadString(filePath); 
  }
}