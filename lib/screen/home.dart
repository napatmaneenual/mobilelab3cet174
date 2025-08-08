import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: (){ print("Button Click");},
            child: const Text("Click", style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          const SizedBox(height: 10,),
          FilledButton(
          style: FilledButton.styleFrom(backgroundColor: Colors.green),
          onPressed: (){print("Button Click");},
          child: const Text("Click",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),),

          const SizedBox(height: 10,),
          OutlinedButton(
          style: OutlinedButton.styleFrom(backgroundColor: Colors.yellow),
          onPressed: (){print("Button Click");}, 
          child: const Text("Click",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),),

          const SizedBox(height: 10,),
          ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: (){print("Button Click");}, 
          child: const Text("Click",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),),
        ],
      ),
    );
  }
}
