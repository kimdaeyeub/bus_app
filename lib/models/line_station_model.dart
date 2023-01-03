//{
//            "bstopidx": 4,
//            "bstopnm": "부산예원고등학교",
//            "nodeid": 175570201,
//            "lineno": 179,
//            "direction": 1,
//            "gpsym": 184736,
//            "carno": "70자2928",
//            "lat": 35.2250496,
//            "lin": 129.1158656,
//            "nodekn": 3,
//            "arsno": 11156,
//            "avgym": 55,
//            "rpoint": 0,
//            "lowplate": 0
//          }

class LineStationModel{

  final String bstopidx;
  final String bstopnm;
  final String nodeid;
  final String lineno;
  final String? direction;
  final String? gpsym;
  final String? carno;
  final String? lat;
  final String? lin;
  final String? nodekn;
  final String? arsno;
  final String? avgym;
  final String rpoint;
  final String? lowplate;

  LineStationModel.fromJson(Map<String, dynamic> json):
    bstopidx = json['bstopidx'],
    bstopnm= json['bstopnm'],
    nodeid= json['nodeid'],
    lineno= json['lineno'],
    direction= json['direction'],
    gpsym = json['gpsym'],
    carno= json['carno'],
    lat= json['lat'],
    lin= json['lin'],
    nodekn= json['nodekn'],
    arsno= json['arsno'],
    avgym = json['avgym'],
    rpoint= json['rpoint'],
    lowplate = json['lowplate'];

}
