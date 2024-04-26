import 'package:first_project/utils/coffee_types.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/coffee_tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of cofee types
  final List coffeeType=[
    //   [coffee type, isSelected]
    [
      "Cappucino",
      true,
    ],
    [
      "Latte",
      false,

    ],
    [
      "Milk Coffee",
      false,
    ]
  ];
  void coffeeTypeSelected(int index) {
    setState(() {
      // this for loop makes every type false
      for(int i=0; i<=coffeeType.length;i++){
        coffeeType[index][1]=false;
      }
      coffeeType[index][1]=true;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          )
        ],
      ),
      body:
      Column(
        children: [
          //   Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Find the Best Coffee for you",
              style: GoogleFonts.bebasNeue(
                fontSize: 35,
              ),

            ),
          ),
          const SizedBox(height: 25,),


          //   search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Find your coffee..",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)
                  )
              ),
            ),
          ),
          const SizedBox(height: 25),

          // horizontal list view of cofee types
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
                itemBuilder: (context,index){
                  return CoffeeType(
                     coffeeType : coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: (){
                       coffeeTypeSelected(index);
                      }
                  );
                }
            )
          ),

          //   horizontal list view of coffee tiles
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'lib/images/pexels-chevanon-302896.jpg',
                  coffeeName: "Latte",
                  coffeePrice: "\$4.20",
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/pexels-chevanon-312418.jpg',
                  coffeeName: "Latte",
                  coffeePrice: "\$4.20",
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/pexels-tyler-nix-1259808-2396220.jpg',
                  coffeeName: "Latte",
                  coffeePrice: "\$4.20",
                ),
              ],

            ),
          )
        ],
      ),

    );
  }

}