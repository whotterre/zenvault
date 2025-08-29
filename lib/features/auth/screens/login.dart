import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  final bool rememberUser;
  final ValueChanged<bool?> onRememberChanged;
  final VoidCallback onSwitchToSignUp;
  const LoginWidget({
    super.key,
    required this.rememberUser,
    required this.onRememberChanged,
    required this.onSwitchToSignUp,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/auth/logo.png'),
          Text(
            'Welcome back to ZenVault',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "Let's get you right back on track",
            style: TextStyle(color: Color(0xFF7F7F7F)),
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(onPressed: () {}, child: const Text("Log In")),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: onSwitchToSignUp,
                  child: const Text("Sign Up"),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onSwitchToSignUp,
            child: Text("Don't have an account? Sign Up"),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: rememberUser, onChanged: onRememberChanged),
                    Text("Remember Me"),
                  ],
                ),
                Text(
                  "Forgot Password?",
                  style: TextStyle(color: Color(0xFF10b982)),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF10b982),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                // Go to next page
              },
              child: Text("Log In", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
