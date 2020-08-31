import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:setma/screen/anciens/ListPatientScreen.dart';
//import 'package:setma/l10n/gallery_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen();

  @override
  Widget build(BuildContext context) {
    return TextFormFieldDemo();
  }
}

class TextFormFieldDemo extends StatefulWidget {
  const TextFormFieldDemo({Key key}) : super(key: key);

  @override
  TextFormFieldDemoState createState() => TextFormFieldDemoState();
}

class PersonData {
  String email = '';
  String password = '';
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      cursorColor: Theme.of(context).cursorColor,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          dragStartBehavior: DragStartBehavior.down,
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            semanticLabel: _obscureText ? ("Mot de passe") : ("Mot de passe"),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldDemoState extends State<TextFormFieldDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PersonData person = PersonData();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  String _validatePassword(String value) {
    final passwordField = _passwordFieldKey.currentState;
    if (passwordField.value.isEmpty) return "Veuillez saisir un mot de passe";
  }

  void _handleSubmitted() {
    final form = _formKey.currentState;
    if (!form.validate()) {
      showInSnackBar(
          "Veuillez corriger les erreurs en rouges avant de reessayer");
    }
    // _autoValidateMode =
    //     AutovalidateMode.always; // Start validating on every change.

    else {
      form.save();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListPatientScreen()),
      );
      // showInSnackBar(GalleryLocalizations.of(context)
      // .demoTextFieldNameHasPhoneNumber(person.name, person.phoneNumber));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cursorColor = Theme.of(context).cursorColor;
    const sizedBoxSpace = SizedBox(height: 24);

    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        // autovalidateMode: _autoValidateMode,
        child: Scrollbar(
          child: SingleChildScrollView(
            dragStartBehavior: DragStartBehavior.down,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                  height: 100.0,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                sizedBoxSpace,
                TextFormField(
                  cursorColor: cursorColor,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: ("votre adresse e-mail"),
                    labelText: ("adresse e-mail *"),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    person.email = value;
                  },
                ),
                sizedBoxSpace,
                PasswordField(
                  fieldKey: _passwordFieldKey,
                  helperText: ("Huite caractere maximum"),
                  labelText: ("Mot de passe *"),
                  validator: _validatePassword,
                  onFieldSubmitted: (value) {
                    setState(() {
                      person.password = value;
                    });
                  },
                ),
                sizedBoxSpace,
                Center(
                  child: RaisedButton(
                    hoverColor: Color(0xff0099FF),
                    child: Text("connecter",
                        style: TextStyle(color: Color(0xff3399ff))),
                    onPressed: _handleSubmitted,
                  ),
                ),
                sizedBoxSpace,
                Text("J'ais pas de compte"),
                Center(
                  child: RaisedButton(
                    child: Text("s'inscrire",
                        style: TextStyle(color: Color(0xff3399ff))),
                    onPressed: () {
                      // print("OK");
                      /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QrCodeScreen()),
                        
                      );*/
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
