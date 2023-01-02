//{
//bstopid: 511500000,
//bstopnm: 동의대역,
//arsno: 05726,
//gpsx: 129.031153467609,
//gpsy: 35.153951816674,
//stoptype: 일반
//}

class BusStation{
  final String bstopid;
  final String bstopnm;
  final String? arsno;
  final String gpsx;
  final String gpsy;
  final String stoptype;

  BusStation.fromJson(Map<String, dynamic> json):
    bstopid=json['bstopid'],
    bstopnm = json['bstopnm'],
    arsno = json['arsno'],
    gpsx = json['gpsx'],
    gpsy= json['gpsy'],
    stoptype = json['stoptype'];
}
