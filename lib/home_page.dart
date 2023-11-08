import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avater.png'),
                    radius: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Alomgir Store',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Telia, Shibpur, Narsingdi',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 0),
                title: Text(
                  'Profile',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                onTap: () {},
              ),
              Divider(
                endIndent: 50,
                color: Colors.blueGrey.shade100,
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 0),
                title: Text(
                  'Earning History',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                onTap: () {},
              ),
              Divider(
                endIndent: 50,
                color: Colors.blueGrey.shade100,
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 0),
                title: Text(
                  'Transaction History',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                onTap: () {},
              ),
              Divider(
                endIndent: 50,
                color: Colors.blueGrey.shade100,
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 0),
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                onTap: () {},
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text('LOGOUT',
                          style: TextStyle(
                              color: Colors.indigo.shade400,
                              letterSpacing: 2,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 17,
                        color: Colors.indigo.shade400,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text('Hello, world!'),
      ),
    );
  }
}
