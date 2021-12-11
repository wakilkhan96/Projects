import 'package:flutter/material.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final formGlobalKey = GlobalKey<FormState>();

  final TextEditingController _ownerNameController = TextEditingController(text: 'Mr. X');
  final TextEditingController _carBrandController = TextEditingController(text: 'Mercedes');
  final TextEditingController _carNameController = TextEditingController(text: 'Mercedes Benz');
  final TextEditingController _carModelController = TextEditingController(text: 'BENZ-A16T');
  final TextEditingController _chassisNumberController = TextEditingController(text: '1MRMZ41DXCU997041');
  final TextEditingController _engineNumberController = TextEditingController(text: '52WVC10338');
  final TextEditingController _cylindersController = TextEditingController(text: '8');
  final TextEditingController _registrationYearController = TextEditingController(text: '2016');

  bool isPasswordValid(String password) => password.length == 6;

  bool isEmailValid(String email) {
    // Pattern pattern =
    //     r '^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    // RegExp regex = new RegExp(pattern);
    // return regex.hasMatch(email);
    return true;
  }
  void _submitForm() {
    if (formGlobalKey.currentState!.validate()) {
      final carData = {
        'Car Owner Name': _ownerNameController.text,
        'Car Brand Name': _carBrandController.text,
        'Car Name': _carNameController.text,
        'Car Model': _carModelController.text,
        'Chassis Number': _chassisNumberController.text,
        'Engine Number': _engineNumberController.text,
        'Cylinders': _cylindersController.text,
        'Registration Year': _registrationYearController.text,
      };
      print(carData.toString());

      // If the form passes validation, display a Snackbar.
      // Scaffold.of(context)
      //     .showSnackBar(SnackBar(content: Text('Registration sent')));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data sent.\n$carData\n\n\n'),
        ),
      );
      //_formKey.currentState.save();
      //_formKey.currentState.reset();
      //_nextFocus(_nameFocusNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Colors.blue[100],
            //   foregroundColor: Colors.black,
            //   title: Text('Car Data'),
            // ),
            body:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: formGlobalKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const Text(
                        "Car Data",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                      BuildTextFormField(
                        labelText: "Car Owner Name",
                        controller: _ownerNameController,
                      ),
                      const SizedBox(height: 24),
                      BuildTextFormField(
                        labelText: "Car Brand",
                        controller: _carBrandController,
                      ),
                      const SizedBox(height: 24),
                      BuildTextFormField(
                        labelText: "Car Name",
                        controller: _carNameController,
                      ),
                      const SizedBox(height: 24),
                      BuildTextFormField(
                        labelText: "Car Model",
                        controller: _carModelController,
                      ),
                      const SizedBox(height: 24),
                      BuildTextFormField(
                        labelText: "Chassis Number",
                        controller: _chassisNumberController,
                      ),
                      const SizedBox(height: 24),
                      BuildTextFormField(
                        labelText: "Engine Number",
                        controller: _engineNumberController,
                      ),
                      const SizedBox(height: 24),
                      BuildTextFormField(
                        labelText: "Cylinders",
                        controller: _cylindersController,
                      ),
                      const SizedBox(height: 24),
                      BuildTextFormField(
                        labelText: "Registration Year",
                        controller: _registrationYearController,
                      ),

                      const SizedBox(height: 50),
                      ElevatedButton(
                          onPressed: () {
                            _submitForm();

                          },
                          child: Text("Submit")
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            )
        ),
      ],
    );
  }
}

class BuildTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const BuildTextFormField({Key? key, required this.labelText, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      //maxLength: 6,
      obscureText: false,
      controller: controller,

    );
  }
}

