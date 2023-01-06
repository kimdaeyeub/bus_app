import 'dart:async';

import 'package:bus_app/models/line_station_model.dart';
import 'package:bus_app/service.dart';
import 'package:flutter/material.dart';

class BusDetailPage extends StatefulWidget {
  BusDetailPage({super.key, required this.lineid});
  final String lineid;

  @override
  State<BusDetailPage> createState() => _BusDetailPageState();
}

class _BusDetailPageState extends State<BusDetailPage> {

  late Future<List<LineStationModel>> stationList;
  bool onStation = false;

  @override
  void initState() {
    super.initState();
    stationList = ApiServices.getLineStationInfo(widget.lineid);
  }

    void timer(){
    Timer(Duration(seconds:30),(() {
          setState(() {
        stationList = ApiServices.getLineStationInfo(widget.lineid);
      });
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Bus',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: FutureBuilder(
          future:stationList,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              timer();
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var busStation = snapshot.data![index]; 
                  bool onStation = false;
                  if(busStation.lat==null){
                    onStation =false;
                  }else{
                    onStation =true;
                  }
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
                              busStation.bstopnm,
                              style: TextStyle(
                                fontSize:18
                              ),
                            ),
                          ],
                        ),
                      ),
                      onStation
                      ? 
                      Positioned(
                        left: 18,
                        bottom: 35,
                        child: Icon(
                          Icons.directions_bus,
                          color: Colors.red,
                          size: 35,
                        ),
                      )
                      :
                      Positioned(
                        left:20,
                        bottom:35,
                        child:Icon(
                          Icons.check_circle,
                          color: Colors.black,
                          size:30,
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
