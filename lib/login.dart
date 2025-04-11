import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 

class Log extends StatefulWidget {
  const Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

// Add this at the top

Future<void> _loginUser() async {
  setState(() => isLoading = true);

  try {
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    // Get the user ID
    final uid = userCredential.user?.uid;
    print(uid);

    // Fetch the role from Firestore
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('usercredentials').doc(uid).get();

    if (userDoc.exists) {
      final role = userDoc.get("role"); // or userDoc['role']

      if (role == 'Client') {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (role == 'Worker') {
        Navigator.pushReplacementNamed(context, '/work');
      } else {
        // Unknown role
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unknown role. Please contact support.')),
        );
      }
    } else {
      // User document not found
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User profile not found.')),
      );
    }
  } on FirebaseAuthException catch (e) {
    String errorMessage = 'Login failed. Please try again.';
    if (e.code == 'user-not-found') {
      errorMessage = 'No user found with this email.';
    } else if (e.code == 'wrong-password') {
      errorMessage = 'Incorrect password.';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  } finally {
    setState(() => isLoading = false);
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 147, 165),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 60),

              // FIX-it Title
              Center(
                child: Text(
                  "FIX-it",
                  style: GoogleFonts.permanentMarker(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 10.0,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4
                      ..color = Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Card Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Hire, Work, Build",
                        style: GoogleFonts.permanentMarker(
                          fontSize: 26,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Email Field
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: GoogleFonts.permanentMarker(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 247, 221, 221),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password Field
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: GoogleFonts.permanentMarker(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 247, 221, 221),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Login Button
                    ElevatedButton(
                      onPressed: isLoading ? null : _loginUser,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : Text(
                              "Login",
                              style: GoogleFonts.permanentMarker(fontSize: 22),
                            ),
                    ),
                    const SizedBox(height: 15),

                    // Sign Up Link
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpPage()),
                          );
                        },
                        child: Text(
                          "Don't have an account? Sign Up",
                          style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
