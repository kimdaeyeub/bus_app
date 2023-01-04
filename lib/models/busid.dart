//{
//            "lineid": 5201006000,
//            "buslinenum": 1006,
//            "bustype": "급행버스",
//            "startpoint": "태종대",
//            "endpoint": "동해선신해운대역",
//            "companyid": "신한",
//            "headway": 30,
//            "firsttime": "05:00",
//            "endtime": "22:00",
//            "headwaypeak": 22,
//            "headwaynorm": 34,
//            "headwayholi": 30
//          },

class BusId{
  final String? lineid, endpoint,companyid, firsttime, endtime;
  final String? headway,headwaypeak,headwaynorm,headwayholi;
  final String bustype, buslinenum, startpoint;

  BusId.fromJson(Map<String, dynamic> json):
    lineid = json['lineid'],
    buslinenum= json['buslinenum'],
    bustype= json['bustype'],
    startpoint= json['startpoint'],
    endpoint= json['endpoint'],
    companyid= json['companyid'],
    headway= json['headway'],
    firsttime= json['firsttime'],
    endtime= json['endtime'],
    headwaypeak= json['headwaypeak'],
    headwaynorm= json['headwaynorm'],
    headwayholi= json['headwayholi'];

}
