import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback show;
  SignupScreen(this.show, {super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();
  final PasswordConfirm = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    _focusNode2.addListener(() {
      setState(() {});
    });
    _focusNode3.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Text('Sign Up'),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              textfield(email, _focusNode1, 'Email', Icons.email),
              SizedBox(height: 10),
              textfield(password, _focusNode2, 'Password', Icons.lock),
              SizedBox(height: 10),
              textfield(
                  PasswordConfirm, _focusNode3, 'Confirm password', Icons.lock),
              SizedBox(height: 8),
              account(),
              SizedBox(height: 20),
              SignUP_bottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget account() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget SignUP_bottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        // onTap: () {
        //   AuthenticationRemote()
        //       .register(email.text, password.text, PasswordConfirm.text);
        // },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget textfield(TextEditingController _controller, FocusNode _focusNode,
      String typeName, IconData iconss) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
              prefixIcon: Icon(
                iconss,
                color:
                    _focusNode.hasFocus ? Colors.lightBlue : Color(0xffc5c5c5),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              hintText: typeName,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xffc5c5c5),
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.lightBlue,
                  width: 2.0,
                ),
              )),
        ),
      ),
    );
  }
}
