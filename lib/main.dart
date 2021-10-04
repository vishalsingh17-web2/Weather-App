import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/Pages/homepage.dart';
import 'package:geolocator/geolocator.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.poppins().fontFamily),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best),
        builder: (context, AsyncSnapshot<Position> snapshot) {
          if (snapshot.hasData) {
            return HomePage(
                place: snapshot.data!.latitude.toString() +
                    ',' +
                    snapshot.data!.longitude.toString());
          } else {
            return Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/location.jpg'),
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Allow Weather to use your location",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text(
                        "Allow",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
