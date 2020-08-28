import 'package:flutter/material.dart';
import 'package:setma/screen/Login/login_screen.dart';
import 'package:setma/screen/Signup/components/background.dart';
import 'package:setma/screen/Signup/components/or_divider.dart';
import 'package:setma/screen/Signup/components/social_icon.dart';
import 'package:setma/screen/components/already_have_an_account_acheck.dart';
import 'package:setma/screen/components/rounded_button.dart';
import 'package:setma/screen/components/rounded_input_field.dart';
import 'package:setma/screen/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                "INSCRIPTION",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            */
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                "assets/images/icone.png",
                fit: BoxFit.contain,
                height: 128,
              ),
            ),
            RoundedInputField(
              hintText: "Votre prénom*",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Votre nom*",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Votre Email*",
              onChanged: (value) {},
              icon: Icons.mail,
            ),
            RoundedInputField(
              hintText: "Votre numéro de téléphone*",
              onChanged: (value) {},
              icon: Icons.call,
            ),
            RoundedInputField(
              hintText: "Le prénom d'un proche*",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Le nom d'un proche*",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Son numéro de téléphone*",
              onChanged: (value) {},
              icon: Icons.call,
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              hintText: "Confirmez le mot de passe*",
            ),
            RoundedButton(
              text: "S'INSCRIRE",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
