import 'package:fl_rest_app/ap_service/api_service.dart';
import 'package:fl_rest_app/screens/home.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController nameController =
      TextEditingController(text: "mor_2314");
  TextEditingController passwordController =
      TextEditingController(text: "83r5^_");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      // SIX CREAT OF USERLOGIN
      body: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  labelText: 'username', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  labelText: 'username', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () async {
                    // apres test
                    final getToken = await ApiService().userLogin(
                        nameController.text, passwordController.text);
                    if (getToken['token'] != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Succes vore identiant tokn est ${getToken['token']}"),
                        backgroundColor: Colors.green,
                      ));
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Uersname or Password incorrect"),
                        backgroundColor: Colors.redAccent,
                      ));
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
