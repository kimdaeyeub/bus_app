//{
//          "bstopid": 505780000,
//          "lineno": 179,
//          "nodenm": "부산시청",
//          "bstopidx": 64,
//          "carno1": 2775,
//          "min1": 1,
//          "station1": 1,
//          "lowplate1": 1,
//          "seat1": -1,
//          "carno2": 2928,
//          "min2": 7,
//          "station2": 4,
//          "lowplate2": 0,
//          "seat2": -1,
//          "gpsx": 129.07691415917,
//          "gpsy": 35.179937855685,
//          "bustype": "일반버스",
//          "lineid": 5200179000
//        }

class LineStationArrInfoModel{

  final String bstopid;
  final String lineno;
  final String nodenm;
  final String bstopidx;
  final String carno1;
  final String min1;
  final String station1;
  final String lowplate1;
  final String seat1;
  final String carno2;
  final String min2;
  final String station2;
  final String lowplate2;
  final String seat2;
  final String gpsx;
  final String gpsy;
  final String bustype;
  final String lineid;

  LineStationArrInfoModel.fromJson(Map<String, dynamic> json):
    bstopid=json['bstopid'],
    lineno=json['lineno'],
    nodenm=json['nodenm'],
    bstopidx=json['bstopidx'],
    carno1=json['carno1'],
    min1=json['min1'],
    station1=json['station1'],
    lowplate1=json['lowplate1'],
    seat1=json['seat1'],
    carno2=json['carno2'],
    min2=json['min2'],
    station2=json['station2'],
    lowplate2=json['lowplate2'],
    seat2=json['seat2'],
    gpsx=json['gpsx'],
    gpsy=json['gpsy'],
    bustype=json['bustype'],
    lineid=json['lineid'];
}
