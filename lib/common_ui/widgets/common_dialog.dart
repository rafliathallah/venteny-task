import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../common_loading_dialog.dart';
import '../common_typography.dart';


class CommonDialog{

  static void showToastMessage(
      String? message,
      ) {
    Fluttertoast.showToast(
      msg: message ?? '',
      backgroundColor: Colors.black.withOpacity(0.3),
    );
  }
  static void showToastIcon({
    required BuildContext context,
    String? message,
    bool whiteText= false,
    Icon? icon,
    Color? color
}){
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color ?? Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon??const Icon(Icons.check),
          const SizedBox(
            width: 12.0,
          ),
          Text(message??'',style: CommonTypography.textBody.copyWith(color: whiteText?Colors.white:Colors.black),),
        ],
      ),
    );
    FToast fToast = FToast();
    fToast.init(context);

    fToast.showToast(child: toast);
  }

  static Future showCustomBottomSheet(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: PopScope(
            // Prevent back button from dismissing the bottom sheet
            canPop:true,
            child: GestureDetector(
              onTap: () {
                // Do nothing on tap to prevent closing the bottom sheet
              },
              child: widget,
            ),
          ),
        );
      },
    );
  }

  static void showDialogIsOffline(BuildContext context){
     showDialog(context: context,
         builder: (context) => SimpleDialog(title: const Text("Peringatan!",textAlign: TextAlign.center,),titleTextStyle: CommonTypography.textH6.copyWith(color: Colors.red),
         contentPadding: const  EdgeInsets.all(20),
         children: const[
           Text("Untuk menggunakan fitur ini anda harus terhubung jaringan internet",style: CommonTypography.textBody,)
         ],));
  }
  static Future showLoadingDialog(
      BuildContext context,
      ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return const CommonLoadingDialog();
      },
    );
  }
}