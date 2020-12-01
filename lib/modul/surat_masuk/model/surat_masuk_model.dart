// To parse this JSON data, do
//
//     final suratMasukModel = suratMasukModelFromJson(jsonString);

class SuratMasukModel {
  SuratMasukModel({
    this.status,
    this.page,
    this.totalPage,
    this.filterBy,
    this.totalSurat,
    this.data,
  });

  int status;
  String page;
  double totalPage;
  String filterBy;
  int totalSurat;
  List<Datum> data;

  factory SuratMasukModel.fromJson(Map<String, dynamic> json) =>
      SuratMasukModel(
        status: json["status"] == null ? null : json["status"],
        page: json["page"] == null ? null : json["page"],
        totalPage:
            json["total_page"] == null ? null : json["total_page"].toDouble(),
        filterBy: json["Filter by "] == null ? null : json["Filter by "],
        totalSurat: json["Total Surat"] == null ? null : json["Total Surat"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    this.asalSurat,
    this.tglDibuat,
    this.tglDiterimaTu,
    this.tglDikirim,
    this.pengirim,
    this.perihal,
    this.nSifatsurat,
    this.statusDibaca,
    this.idPersuratan,
    this.idCompose,
    this.idSifatsurat,
    this.statusSetujui,
    this.photo,
    this.filterBy,
  });

  String asalSurat;
  DateTime tglDibuat;
  dynamic tglDiterimaTu;
  String tglDikirim;
  String pengirim;
  String perihal;
  String nSifatsurat;
  String statusDibaca;
  String idPersuratan;
  String idCompose;
  String idSifatsurat;
  String statusSetujui;
  String photo;
  String filterBy;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        asalSurat: json["asal_surat"] == null ? null : json["asal_surat"],
        tglDibuat: json["tgl_dibuat"] == null
            ? null
            : DateTime.parse(json["tgl_dibuat"]),
        tglDiterimaTu: json["tgl_diterimaTU"],
        tglDikirim: json["tgl_dikirim"] == null ? null : json["tgl_dikirim"],
        pengirim: json["pengirim"] == null ? null : json["pengirim"],
        perihal: json["perihal"] == null ? null : json["perihal"],
        nSifatsurat: json["n_sifatsurat"] == null ? null : json["n_sifatsurat"],
        statusDibaca:
            json["status_dibaca"] == null ? null : json["status_dibaca"],
        idPersuratan:
            json["id_persuratan"] == null ? null : json["id_persuratan"],
        idCompose: json["id_compose"] == null ? null : json["id_compose"],
        idSifatsurat:
            json["id_sifatsurat"] == null ? null : json["id_sifatsurat"],
        statusSetujui:
            json["status_setujui"] == null ? null : json["status_setujui"],
        photo: json["photo"] == null ? null : json["photo"],
        filterBy: json["filter_by"] == null ? null : json["filter_by"],
      );
}
