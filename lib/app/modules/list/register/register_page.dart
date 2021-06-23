import 'package:flutter_modular/flutter_modular.dart';
import 'package:finished_games_register/app/modules/list/register/register_store.dart';
import 'package:flutter/material.dart';
import 'package:finished_games_register/app/styles/gradient_containers.dart'
as gradientComp;

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({key, this.title = 'RegisterPage'}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}
class RegisterPageState extends ModularState<RegisterPage, RegisterStore> {
  final RegisterStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final fullMediaWidth = MediaQuery.of(context).size.width;
    final fullMediaHeight = MediaQuery.of(context).size.height;

    Widget publisherPage(context) {
      return Container(
        alignment: Alignment.center,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [],
        ),
      );
    }
    return WillPopScope(
        onWillPop: () async {
          Modular.to.pushReplacementNamed('/lists');
        },
      child: Scaffold(
        appBar: gradientComp.appBarGradient(context, "Register Page"),
        body: gradientComp.backgroundGradient(context, publisherPage(context)),
      )
    );
  }
}