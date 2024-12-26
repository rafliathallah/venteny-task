import 'package:auto_route/auto_route.dart';
import '../../../common_ui/common_colors.dart';
import '../../../core/data/local/app_preferences.dart';
import '../../../core/di/di_container.dart';
import 'package:flutter/material.dart';

import '../../../navigation/router/router.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AppPreferences prefs;
  @override
  void initState() {
   prefs= diContainer<AppPreferences>();
    Future.delayed(const Duration(seconds: 2)).then((value){
      if((prefs.getToken() ??'').isNotEmpty){
        print("INI TOKENYA ${prefs.getToken()}");
      context.replaceRoute(const MainRoute());
      }else{
        print("GAK ADA TOKENYA");
        context.replaceRoute(const AuthRoute());
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.orangeFF,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(child: Image.asset('assets/images/venteny_logo.png',color: Colors.white,),),
      )
    );
  }
}

