import 'package:flutter/material.dart';
import 'package:setma/screen/Login/components/background.dart';
//import 'package:setma/screen/Signup/signup_screen.dart';
import 'package:setma/screen/components/already_have_an_account_acheck.dart';
import 'package:setma/screen/components/rounded_button.dart';
import 'package:setma/screen/components/rounded_input_field.dart';
import 'package:setma/screen/components/rounded_password_field.dart';
import 'package:setma/screen/Signup/signup_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:setma/screen/Medecin/accueil/accueil.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      print("CODE BARRE : " + barcodeScanRes);
      if (barcodeScanRes != "-1") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              //print("OK");
              return SignUpScreen();
            },
          ),
        );
      }
      //_scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*
              Text(
                "CONNEXION",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'JoseFin',
                  fontSize: 30.0,
                  color: kPrimaryColor,
                ),
              ),
              */
              SizedBox(height: size.height * 0.03),
              // SvgPicture.asset(
              //   "assets/icons/login.svg",
              //   height: size.height * 0.35,
              // ),
              Padding(
                padding: const EdgeInsets.only(right: 68.0, left: 68.0),
                child: Image.asset(
                  "assets/images/icone.png",
                  fit: BoxFit.contain,
                  height: 128,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Image.asset(
                "assets/images/texteLogo.png",
                fit: BoxFit.contain,
                height: 100,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Votre Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  Navigator.pop(context);
                  runApp(Accueil());
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  scanQR();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
