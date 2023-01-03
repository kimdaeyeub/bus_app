import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int value = 0;
  bool segmentClick = true;

  segementControl(value){
    setState(() {
      this.value=value;
      segmentClick = !segmentClick;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      child: Column(
        children: [
          SizedBox(height:20),
          CupertinoSlidingSegmentedControl(
            backgroundColor: Colors.black,
            thumbColor: Colors.white,
            groupValue: value,
            padding: EdgeInsets.all(5),
            children: {
            0:Text(
              '  버스  ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: segmentClick ? Colors.black: Colors.white,
              ),
            ),
            1:Text(
              '  정류장  ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: segmentClick ? Colors.white : Colors.black,
              ),
            ),
          },
            onValueChanged: segementControl,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:Colors.black,
                    width:2,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(18),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
