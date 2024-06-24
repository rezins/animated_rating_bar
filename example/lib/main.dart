import 'package:animated_rating_bar/animated_rating_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Rating Bar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      home: RatingScreen(),
    );
  }
}

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {

  ValueNotifier<int> reset = ValueNotifier(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Animated Rating Bar"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedRatingBar(
              activeFillColor: Theme.of(context).colorScheme.inversePrimary,
              strokeColor: Colors.green,
              initialRating: 0,
              height: 60,
              width: MediaQuery.of(context).size.width,
              animationColor: Colors.red,
              reset: reset,
              onRatingUpdate: (rating) {

              },
            ),
            const SizedBox(height: 20,),
            RawMaterialButton(
              fillColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              onPressed:  () async {
                reset.value = 0;
                await Future.delayed(const Duration(milliseconds: 500));
                reset.value = 5;
                setState(() {

                });
              },
              child: const Text("Clear", style: TextStyle(color: Colors.white),),
            )
          ],
        )
    );
  }
}