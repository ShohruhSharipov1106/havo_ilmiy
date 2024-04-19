import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

abstract class MyFunctions {
  static String formatHour(String time, {String? format = 'HH:mm'}) =>
      Jiffy.parse(time).format(pattern: format);

  static String getDurationTime(int sec) {
    final minutes = sec ~/ 60;
    if (sec > 60 && sec % 60 != 0) {
      final seconds = sec % 60;
      return seconds < 10 ? '$minutes:0$seconds' : '$minutes:$seconds';
    } else if (sec < 60 && sec % 60 != 0) {
      return sec < 10 ? '0:0$sec' : '0:$sec';
    } else if (sec % 60 == 60) {
      return minutes.toString();
    }
    return '0:00';
  }

  static Future<ImageInfo> getImageInfo(
      BuildContext context, String image) async {
    AssetImage assetImage = AssetImage(image);
    ImageStream stream =
        assetImage.resolve(createLocalImageConfiguration(context));
    Completer<ImageInfo> completer = Completer();
    stream.addListener(ImageStreamListener((ImageInfo imageInfo, _) {
      return completer.complete(imageInfo);
    }));
    return completer.future;
  }

  static String formatDate(String date, {String? format = 'MM.dd.yyyy'}) =>
      Jiffy.parseFromDateTime(DateTime.parse(date)).format(pattern: format);

  static String getFormatCostFromInt(String priceString,
      [bool showCurrency = true]) {
    int price = int.parse(priceString.split('.')[0]);
    if (price == 0) {
      return '0 UZS';
    } else {
      final oldCost = StringBuffer(price.toString());
      final newCost = StringBuffer();

      for (var i = 0; i < oldCost.length; i++) {
        if ((oldCost.length - i) % 3 == 0 && i != 0) newCost.write(' ');
        newCost.write(oldCost.toString()[i]);
      }
      return '$newCost${showCurrency ? ' UZS' : ''}';
    }
  }

  static double getRadiusFromZoom(double zoom) {
    return 40000 / pow(2, zoom) > 1 ? 40000 / pow(2, zoom) : 1;
  }
}
