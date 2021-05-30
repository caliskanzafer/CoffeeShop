class Siparis {
  int id;
  int adet;
  double toplamFiyat;
  String olusturmaTarihi;
  String guncellenmeTarihi;
  int urun;

  Siparis(
      {this.id,
      this.adet,
      this.toplamFiyat,
      this.olusturmaTarihi,
      this.guncellenmeTarihi,
      this.urun});

  Siparis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adet = json['adet'];
    toplamFiyat = json['toplam_fiyat'];
    olusturmaTarihi = json['olusturma_tarihi'];
    guncellenmeTarihi = json['guncellenme_tarihi'];
    urun = json['urun'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['adet'] = this.adet;
    data['toplam_fiyat'] = this.toplamFiyat;
    data['olusturma_tarihi'] = this.olusturmaTarihi;
    data['guncellenme_tarihi'] = this.guncellenmeTarihi;
    data['urun'] = this.urun;
    return data;
  }
}
