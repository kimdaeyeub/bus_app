import 'package:bus_app/models/station_arr_model.dart';
import 'package:bus_app/service.dart';
import 'package:flutter/material.dart';

class StationDetailPage extends StatefulWidget {
  StationDetailPage({super.key, required this.bstopid});
  final String bstopid;

  @override
  State<StationDetailPage> createState() => _StationDetailPageState();
}

class _StationDetailPageState extends State<StationDetailPage> {

  late Future<List<StationArrModel>> buses;

  @override
  void initState() {
    super.initState();
    buses = ApiServices.getStationArrInfo(widget.bstopid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        color: Colors.grey.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10,vertical:10),
          child: FutureBuilder(
            future: buses,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var bus = snapshot.data![index];
                    print(bus.lineno);
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            //border: Border.all(
                            //  color: Colors.black,
                            //  width: 2,
                            //),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2), // changes position of shadow
                              ),
                            ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical:30, horizontal:15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${bus.lineno}번',
                                  style: TextStyle(
                                    fontSize:22,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                // Column(
                                //   children: [
                                //     Text(
                                //       '남은 시간:${bus.min1} / 남은 정류장수:${bus.station1}',
                                //       style: TextStyle(
                                //         fontSize: 14,
                                //         color: Colors.black.withOpacity(0.4)
                                //       ),
                                //     ),
                                //     Text(
                                //       '남은 시간:${bus.min2} / 남은 정류장수:${bus.station2}',
                                //       style: TextStyle(
                                //         fontSize: 14,
                                //         color: Colors.black.withOpacity(0.4)
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          )
                        ),
                        SizedBox(height:10)
                      ],
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(color: Colors.black,),
              );
            },
          ),
        ),
      ),
    );
  }
}
