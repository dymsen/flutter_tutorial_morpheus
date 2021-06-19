import 'package:flutter/material.dart';

class InputDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: const MyInputDemo(),
    );
  }
}

class MyInputDemo extends StatefulWidget {
  const MyInputDemo({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => MyInputDemoState();
}

class MyInputDemoState extends State<MyInputDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Deine E-Mail-Adresse',
                    labelText: 'E-Mail-Adresse'
                  ),
                  onSaved: (value)=> print(value),
                  validator: (value) {
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 100,
                  maxLengthEnforced: true,                
                ),
                Center(
                  child: ElevatedButton(
                    child: Text("Senden"),
                    onPressed: _handleSubmitButton,
                                        ),
                                    )
                                  ],
                                  ),
                              ),
                            ),
                            )
                        );
                      }
                    
                      void _handleSubmitButton() {
  }
}
