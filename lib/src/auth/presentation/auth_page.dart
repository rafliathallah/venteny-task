import 'package:auto_route/auto_route.dart';
import '../../../common_ui/common_colors.dart';
import '../../../common_ui/common_typography.dart';
import '../../../common_ui/widgets/common_textfield.dart';
import '../../../common_ui/widgets/common_dialog.dart';
import '../../../common_ui/widgets/common_rounded_button.dart';
import '../../../common_ui/widgets/common_text_from_field.dart';
import '../../../core/di/di_container.dart';
import '../../../navigation/router/router.dart';
import 'auth_login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_ui/widgets/common_error_widget.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: BlocProvider(
              create: (context) => diContainer<AuthLoginBloc>(),
              child: BlocConsumer<AuthLoginBloc,AuthLoginState>(
                listener:(context, state) {
                  if(state is AuthLoginSuccessState){
                    context.navigateTo(const MainRoute());
                  }
                  if(state is AuthLoginFailedState){
                    CommonDialog.showToastIcon(context: context,
                        message: state.errorDto.message,
                        whiteText: true,
                        color: CommonColors.red3B,
                        icon: const Icon(Icons.close_rounded,color: Colors.white,));
                  }
                },
                builder: (context, state) =>Center(child: buildBody(context, state)) ,
              )),
        ),
      ),
    );
  }
}

Widget buildBody(BuildContext context, AuthLoginState state) {
  final inputFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  return Column(
    children: [
      Image.asset('assets/images/ventenny.jpg'),
      Form(
        key: inputFormKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Venteny ToDo',style: CommonTypography.textH3,),
              Text('Welcome to Venteny Task Manajement Mobile App.\nEmployee Happiness.',style: CommonTypography.textInter14,),
              SizedBox(height: 20,),
              CommonTextField(hint: "Masukan Email",
                label: "Email",
                controller: emailController,
                validators: [
                  CommonTextFieldValidator.noEmpty,
                  CommonTextFieldValidator.email
                ],),
              const SizedBox(
                height: 16.0,
              ),
              CommonTextField(hint: "Masukan Password",
                  label: "Password",
                  controller: passController,
                  isObscureText: true,
                  validators: [
                    CommonTextFieldValidator.noEmpty,
                    CommonTextFieldValidator.min8Character,
                    CommonTextFieldValidator.max30Character
                  ],),

              const SizedBox(
                height: 20.0,
              ),
              CommonRoundedButton(
                color: CommonColors.orangeFF,
                loadingColor: Colors.white,
                loading: state is AuthLoginLoadingState ? true : false,
                onPressed: () {
                  if(inputFormKey.currentState?.validate()==true){
                    context.read<AuthLoginBloc>().add(AuthLoginProceedEvent(email: emailController.text,password: passController.text));
                  }
                },
                text: "Login",
                textStyle: CommonTypography.textH7.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
