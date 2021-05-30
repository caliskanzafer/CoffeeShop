class Urun {
  int id;
  String isim;
  String resim;
  int boy;
  String aciklama;
  double fiyat;
  String key;

  Urun({this.id, this.isim, this.resim, this.boy, this.aciklama, this.fiyat});

  Urun.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isim = json['isim'];
    resim = json['resim'];
    boy = json['boy'];
    aciklama = json['aciklama'];
    fiyat = json['fiyat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isim'] = this.isim;
    data['resim'] = this.resim;
    data['boy'] = this.boy;
    data['aciklama'] = this.aciklama;
    data['fiyat'] = this.fiyat;
    return data;
  }
}
