import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

String? extractFilenameFromUrl(String url) {
  RegExp regExp = RegExp('([^?/]*.(?:png|jpe?g|gif|webp))');
  Match match = regExp.firstMatch(url) as Match;
  return match.group(1);
}

Future<File?> saveNetworkImageToDownloads(String imageUrl) async {
  // Download and save the image
  try {
    final response = await http.get(Uri.parse(imageUrl));
    final downloadsDir = Directory('/storage/emulated/0/Download');
    // final downloadsDir = Directory('${extDir?.path}/Download');
    final filename = extractFilenameFromUrl(imageUrl);
    final file = File('${downloadsDir.path}/$filename');
    await file.writeAsBytes(response.bodyBytes);

    Fluttertoast.showToast(
      msg: 'File saved successfully',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
      fontSize: 16.0,
    );

    return file;
  } catch (e) {
    // Show toast message when an error occurs
    Fluttertoast.showToast(
      msg: 'Error saving file: $e',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
      fontSize: 16.0,
    );

    return null;
  }
}
