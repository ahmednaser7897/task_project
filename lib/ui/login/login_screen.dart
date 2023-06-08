import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_project/app/extensions.dart';
import 'package:task_project/ui/componnents/componnents.dart';
import 'cubit/logein_cubit.dart';
import '../../../app/app_router.dart';
import '../../../app/app_sized_box.dart';
import '../../../app/di/di.dart';

import '../../../data/request/auth/login_request.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Future<void> login(LogeinCubit cubit) async {
    if (_formKey.currentState!.validate()) {
      cubit.login(
        loginRequestData: LoginRequestData(
            password: passwordController.text,
            userPhone: phoneController.text,
            userFirebaseToken: 'sjhgjsdhgjshdfgjksdfsjkg'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    phoneController.text = '+201159050444';
    passwordController.text = '12345678';

    return BlocProvider(
      create: (context) => getIt<LogeinCubit>(),
      child: Scaffold(
        body: buildScreenContent(),
      ),
    );
  }

  void routeToHome() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouter.homeScreen, arguments: true, (Route<dynamic> route) => false);
  }

  Widget buildScreenContent() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: loginRequestBuilder(),
      ),
    );
  }

  Widget loginRequestBuilder() {
    return BlocConsumer<LogeinCubit, LogeinState>(
      listener: (context, state) {
        if (state is ScLogeIn) {
          routeToHome();
        }
        if (state is ErorrLogeIn && state.failur.erorrMessege.isNotEmpty) {
          buildToast(context, state.failur.erorrMessege);
        }
      },
      builder: (context, cubit) => buildLoginView(),
    );
  }

  Widget buildLoginView() {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        buildLogInForm(),
        buildLogInProcces(),
      ],
    );
  }

  Column buildLogInForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const FlutterLogo(
          size: 70,
        ),
        const SizedBox(
          height: 50,
        ),
        RichText(
          text: const TextSpan(
            text: '',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            children: [
              TextSpan(
                  text: 'ahmed', style: TextStyle(color: Colors.blueAccent)),
              TextSpan(text: ' naser!'),
            ],
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        textFormField(phoneController, Icons.phone),
        const SizedBox(
          height: 10,
        ),
        textFormField(passwordController, Icons.password),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  TextFormField textFormField(TextEditingController controlle, IconData icon) {
    return TextFormField(
      controller: controlle,
      decoration: InputDecoration(
          suffixIcon: Icon(icon, color: Colors.black),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)))),
    );
  }

  Widget buildLogInProcces() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "forget password?",
                style: TextStyle(color: Colors.black),
              )),
          Builder(builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    color: Colors.blueAccent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    minWidth: 250,
                    onPressed: () {
                      login(LogeinCubit.get(context));
                    },
                    child: const Text(
                      'logIn',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            );
          }),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
