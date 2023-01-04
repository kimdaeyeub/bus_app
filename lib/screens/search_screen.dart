import 'package:bus_app/models/busStation_model.dart';
import 'package:bus_app/models/busid.dart';
import 'package:bus_app/service.dart';
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
  bool widgetControll = false;
  final TextEditingController _searchController = TextEditingController();
  Future<List<BusId>> busList = ApiServices.getLineId('');
  Future<List<BusStation>> stationList = ApiServices.getBusStationInfo('');

  segementControl(value){
    setState(() {
      this.value=value;
      segmentClick = !segmentClick;
      _searchController.clear();
      if(_searchController.text == ''){
        widgetControll = false;
        print(widgetControll);
      }else{
        widgetControll = true;
        print(widgetControll);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(10),
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
                  fontWeight: FontWeight.w600,
                  color: segmentClick ? Colors.black: Colors.white,
                ),
              ),
              1:Text(
                '  정류장  ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: segmentClick ? Colors.white : Colors.black,
                ),
              ),
            },
              onValueChanged: segementControl,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                onChanged: (value) {
                  widgetControll = true;
                  setState(() {
                    if(segmentClick){
                      busList = ApiServices.getLineId(value);
                    }else{
                      stationList = ApiServices.getBusStationInfo(value);
                    }
                  });
                },
                controller: _searchController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        if(segmentClick){
                          busList = ApiServices.getLineId(_searchController.text);
                        }else{
                          stationList = ApiServices.getBusStationInfo(_searchController.text);
                        }
                      });
                    },
                  ),
                  hintText:segmentClick ? '버스' : '정류장',
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
            ),
            //segmentClick ? SearchResult(dataList: busList , dataType:segmentClick) : SearchResult(dataList :stationList, dataType:segmentClick),
            widgetControll ? SearchResult(
              dataList: segmentClick ? busList : stationList,
              dataType: segmentClick
            ) :Text('')
          ],
        ),
      ),
    );
  }
}

class SearchResult extends StatelessWidget {
  const SearchResult({
    Key? key,
    required this.dataList, required this.dataType,
  }) : super(key: key);

  final bool dataType;
  final Future<List> dataList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dataList,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return Expanded(
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data![index];
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
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  dataType ? '${data.buslinenum}' : '${data.bstopnm}',
                                  //'hello',
                                  style: TextStyle(
                                    fontSize:22,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  dataType ? '${data.startpoint} ~ ${data.endpoint}' : '',
                                  //'hi',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.4)
                                  ),
                                )
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_circle_up_sharp),
                              onPressed: () {

                              },
                            )
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: 10,)
                  ],
                );
              },
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
