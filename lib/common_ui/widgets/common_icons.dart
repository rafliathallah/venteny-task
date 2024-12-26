import 'package:flutter/material.dart';

class CommonIcons {
  /// for class material icon
  ///
  static Image iconEdit = assetImage(
    'ic_edit.png',scale: 2.0
  );
  static Image iconDelete = assetImage(
    'ic_delete.png',scale: 2.0
  );
  static Image iconNote = assetImage(
    'ic_note.png',scale: 2.0
  );
  static Image iconScan = assetImage(
    'ic_scan.png',scale: 2.0
  );
  static Image iconSuccess = assetImage(
    'ic_success.png',scale: 2.0
  );
  static Image iconFailed = assetImage(
    'ic_failed.png',scale: 2.0
  );
  //
  //
  // static SvgPicture defaultSizeAssets(
  //   String filename, {
  //   Color? color,
  //   double width = 28,
  //   double height = 28,
  // }) {
  //   return SvgPicture.asset(
  //     getAssetPath(filename),
  //     color: color,
  //     width: width,
  //     height: height,
  //   );
  // }

  static String getAssetPath(String filename) {
    return "assets/icons/$filename";
  }
  static Image assetImage(String filename,{double scale =1,color}){
    return Image.asset(getAssetPath(filename),scale: scale,color: color,);
}
}
