import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

import 'package:setma/l10n/gallery_localizations.dart';
import 'package:setma/screen/ListConsultationSreen.dart';

class InscriptionFinalScreen extends StatelessWidget {
  const InscriptionFinalScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("inscription"),
        backgroundColor: Color.fromRGBO(109, 221, 208, 1),
      ),
      body: TextFormFieldDemo(),
    );
  }
}

class TextFormFieldDemo extends StatefulWidget {
  const TextFormFieldDemo({Key key}) : super(key: key);

  @override
  TextFormFieldDemoState createState() => TextFormFieldDemoState();
}

class PersonData {
  String prenom = '';
  String nom = '';
  String telephone;
  String email = '';
  String password = '';
  String prenomProche = '';
  String nomProche = '';
  String emailMedecin = '';
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

  // AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();
  final _UsNumberTextInputFormatter _phoneNumberFormatter =
      _UsNumberTextInputFormatter();

  void _handleSubmitted() {
    final form = _formKey.currentState;
    if (!form.validate()) {
      // _autoValidateMode =
      //     AutovalidateMode.always; // Start validating on every change.
      showInSnackBar(
          "Veuillez corriger les erreurs en rouges avant de reessayer");
    } else {
      form.save();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListConsultation()),
      );

      // showInSnackBar(GalleryLocalizations.of(context)
      //     .demoTextFieldNameHasPhoneNumber(person.nom, person.telephone));
    }
  }

  String _validateNom(String value) {
    if (value.isEmpty) {
      return ("Veuillez indiquez votre nom");
    }
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return GalleryLocalizations.of(context)
          .demoTextFieldOnlyAlphabeticalChars;
    }
    return null;
  }

  String _validatePrenom(String value) {
    if (value.isEmpty) {
      return ("Veuillez indiquez votre prenom");
    }
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return GalleryLocalizations.of(context)
          .demoTextFieldOnlyAlphabeticalChars;
    }
    return null;
  }

  String _validateTelephone(String value) {
    final phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value)) {
      return ("Saisissez un ...");
    }
    return null;
  }

  String _validatePassword(String value) {
    final passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty) {
      return ("Veuillez saisir un mot de passe");
    }
    if (passwordField.value != value) {
      return ("Confirmez votre mot de passe");
    }
    return null;
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
                sizedBoxSpace,
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  cursorColor: cursorColor,
                  decoration: InputDecoration(
                    filled: true,
                    // icon: const Icon(Icons.person),
                    hintText: ("veuillez saisir votre prenom"),
                    labelText: ("votre prenom*"),
                  ),
                  onSaved: (value) {
                    person.prenom = value;
                  },
                  validator: _validatePrenom,
                ),
                sizedBoxSpace,

                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  cursorColor: cursorColor,
                  decoration: InputDecoration(
                    filled: true,
                    // icon: const Icon(Icons.person),
                    hintText: ("veuillez saisir votre nom"),
                    labelText: ("votre Nom*"),
                  ),
                  onSaved: (value) {
                    person.nom = value;
                  },
                  validator: _validateNom,
                ),
                sizedBoxSpace,
                TextFormField(
                  cursorColor: cursorColor,
                  decoration: InputDecoration(
                    filled: true,
                    // icon: const Icon(Icons.email),
                    hintText: ("votre adresse e-mail"),
                    labelText: ("adresse e-mail*"),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    person.email = value;
                  },
                ),
                sizedBoxSpace,
                TextFormField(
                  cursorColor: cursorColor,
                  decoration: InputDecoration(
                    filled: true,
                    //   icon: const Icon(Icons.phone),
                    hintText: ("veuillez saisir votre numero"),
                    labelText: ("numero de telephone*"),
                    prefixText: '+221 ',
                  ),
                  keyboardType: TextInputType.phone,
                  onSaved: (value) {
                    person.telephone = value;
                  },
                  maxLength: 14,
                  maxLengthEnforced: false,
                  validator: _validateTelephone,
                  // TextInputFormatters are applied in sequence.
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    // Fit the validating format.
                    _phoneNumberFormatter,
                  ],
                ),
                sizedBoxSpace,
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  cursorColor: cursorColor,
                  decoration: InputDecoration(
                    filled: true,
                    //  icon: const Icon(Icons.person),
                    hintText: ("veuillez saisir le prenom d'un proche"),
                    labelText: ("prenom d'un proche"),
                  ),
                  onSaved: (value) {
                    person.nom = value;
                  },
                  validator: _validateNom,
                ),
                sizedBoxSpace,

                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  cursorColor: cursorColor,
                  decoration: InputDecoration(
                    filled: true,
                    // icon: const Icon(Icons.person),
                    hintText: ("veuillez saisir le nom d'un proche"),
                    labelText: ("nom d'un proche"),
                  ),
                  onSaved: (value) {
                    person.nom = value;
                  },
                  validator: _validateNom,
                ),

                // sizedBoxSpace,
                // TextFormField(
                //   cursorColor: cursorColor,
                //   decoration: InputDecoration(
                //     border: const OutlineInputBorder(),
                //     hintText: GalleryLocalizations.of(context)
                //         .demoTextFieldTellUsAboutYourself,
                //     helperText: GalleryLocalizations.of(context)
                //         .demoTextFieldKeepItShort,
                //     labelText:
                //         GalleryLocalizations.of(context).demoTextFieldLifeStory,
                //   ),
                //   maxLines: 3,
                //  ),
                // sizedBoxSpace,
                // TextFormField(
                //   cursorColor: cursorColor,
                //   keyboardType: TextInputType.number,
                //   decoration: InputDecoration(
                //     border: const OutlineInputBorder(),
                //     labelText:
                //         GalleryLocalizations.of(context).demoTextFieldSalary,
                //     suffixText:
                //         GalleryLocalizations.of(context).demoTextFieldUSD,
                //   ),
                //   maxLines: 1,
                //     ),
                sizedBoxSpace,
                PasswordField(
                  fieldKey: _passwordFieldKey,
                  helperText: ("Huite caractere maximum"),
                  labelText: ("Mot de passe* "),
                  onFieldSubmitted: (value) {
                    setState(() {
                      person.password = value;
                    });
                  },
                ),
                sizedBoxSpace,
                TextFormField(
                  cursorColor: cursorColor,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: ("Confirmer votre mot de passe*"),
                  ),
                  maxLength: 8,
                  obscureText: true,
                  validator: _validatePassword,
                ),
                sizedBoxSpace,
                Center(
                  child: RaisedButton(
                    child: Text("Inscription",
                        style: Theme.of(context).textTheme.caption),
                    onPressed: _handleSubmitted,
                  ),
                ),
                sizedBoxSpace,
                Text("*Champ obligatoire"),

                sizedBoxSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Format incoming numeric text to fit the format of (###) ###-#### ##
class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newTextLength = newValue.text.length;
    final newText = StringBuffer();
    var selectionIndex = newValue.selection.end;
    var usedSubstringIndex = 0;
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10) selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
