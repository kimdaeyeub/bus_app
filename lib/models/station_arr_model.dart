//{
//            "arsno"     : 13708,
//            "bstopid"   : 505780000,
//            "lineno"    : 1010,
//            "nodenm"    : "부산시청",
//            "bstopidx"   : 54,
//            "carno1"    : 5208,
//            "min1"       : 4,
//            "station1"    : 1,
//            "lowplate1"   : 0,
//            "seat1"       : -1,
//            "carno2        ": 5201,
//            "min2        ": 15,
//            "station2     ": 5,
//            "lowplate2     ": 0,
//            "seat2         ": -1,
//            "gpsx         ": 129.07691415917,
//            "gpsy         ": 35.179937855685,
//            "bustype       ": "급행버스",
//            "lineid         ": 5201010000
//          }

class StationArrModel{
  final String? arsno, min1, station1, min2, station2, bstopid, nodenm, bstopidx, carno1, lowplate1, seat1, carno2, lowplate2, seat2, gpsx, gpsy, bustype, lineid;
  final String lineno;

  StationArrModel.fromJson(Map<String, dynamic> json):
    arsno=json['arsno'],
    bstopid =json['bstopid'],
    lineno =json['lineno'],
    nodenm = json['nodenm'],   
    bstopidx = json['bstopidx'],
    carno1 = json['carno1'],   
    min1 = json['min1'],    
    station1 = json['station1'],
    lowplate1 = json['lowplate1'],
    seat1 = json['seat1'],
    carno2 =json['carno2'],
    min2 = json['min2'],
    station2 = json['station2'],
    lowplate2 = json['lowplate2'],
    seat2 = json['seat2'],
    gpsx = json['gpsx'],     
    gpsy = json['gpsy'],     
    bustype = json['bustype'],  
    lineid = json['lineid'];   
}
