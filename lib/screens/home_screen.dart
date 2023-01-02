import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List busStations = [
    '동의대역',
    '자연대 교차로',
    '동의대역',
    '자연대 교차로',
    '동의대역',
    '자연대 교차로',
    '동의대역',
    '자연대 교차로',
    '동의대역',
    '자연대 교차로',
    '동의대역',
    '자연대 교차로',
    '동의대역',
    '자연대 교차로',
    '동의대역',
    '자연대 교차로',
    '동의대역',
    '자연대 교차로',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Bus',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: busStations.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:30),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 100,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5)
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        busStations[index],
                        style: TextStyle(
                          fontSize:18
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left:20,
                  bottom:35,
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.black,
                    size:30,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
