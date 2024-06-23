import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thozhil_flutter_app/screens/dashboard_screen.dart';
import 'package:thozhil_flutter_app/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    var assetsImage = const AssetImage('assets/thozhil_logo.png');
    var image = Image(image: assetsImage, fit: BoxFit.cover, height: 50);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(children: [
            Flexible(
              flex: 2, // 20% of the screen
              child: Container(
                color: Colors.white,
                child: Center(
                  child: image,
                ),
              ),
            ),
            Flexible(
              flex: 8, // 80% of the screen
              child: ClipRRect(
                borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(100.0)),
                child: Container(
                    padding: const EdgeInsets.all(30),
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      maxWidth: maxWidth,
                      maxHeight: maxHeight,
                    ),
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('LOGIN',
                            style: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: TextField(
                                obscureText: true,
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Text("Forgot password ?",
                                      style: TextStyle(color: Colors.white70)),
                                ))
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DashboardScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                fixedSize: Size(maxWidth / 3, 50)),
                            child: Text("Login",
                                style: GoogleFonts.dmSans(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpScreen()),
                              );
                            },
                            child: RichText(
                              text: const TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(color: Colors.white70),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    )),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
