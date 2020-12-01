import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sisumakerv2/modul/sangat_segera/ui/surat_sangat_segera.dart';
import 'package:sisumakerv2/modul/surat_masuk/ui/surat_masuk.dart';
import 'package:sisumakerv2/modul/surat_eksternal/ui/surat_eksternal.dart';
import 'package:sisumakerv2/modul/surat_internal/ui/surat_internal.dart';
import 'package:sisumakerv2/modul/surat_keluar/ui/surat_keluar.dart';
// import 'package:sisumakerv2/modul/surat_masuk/ui/surat_masuk_detail.dart';
import 'package:sisumakerv2/modul/surat_rahasia/ui/surat_rahasia.dart';
import 'package:sisumakerv2/modul/surat_sudahdbaca/ui/surat_sudah_dibaca.dart';
import 'package:sisumakerv2/modul/surat_ttd/ui/surat_ttd.dart';
import 'package:sisumakerv2/modul/tembusan/ui/tembusan.dart';
import 'package:sisumakerv2/src/page/cek_domain_page.dart';
import 'package:sisumakerv2/src/page/login_page.dart';
import 'package:sisumakerv2/src/page/tab_page.dart';
import 'package:sisumakerv2/src/routes/route_error.dart';

// get this page from folder modul as lib

class RouteGenerator {
  static Route<dynamic> generate(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/CekDomainPage':
        return MaterialPageRoute(builder: (_) => CekDomainPage());
        break;
      case '/LoginPage':
        return MaterialPageRoute(builder: (_) => LoginPage());
        break;
      case '/TabPage':
        return MaterialPageRoute(builder: (_) => TabPage());
        break;
      // route to json menu
      case '/suratmasuk':
        return MaterialPageRoute(builder: (_) => WidgetSuratMasuk());

        break;
      // case '/suratmasukdetail':
      //   return MaterialPageRoute(
      //     builder: (_) => SuratMasukDetail(args),
      //   );
      //   break;

      case '/sudahdibaca':
        return MaterialPageRoute(builder: (_) => SudahDibaca());

        break;
      case '/suratttd':
        return MaterialPageRoute(builder: (_) => SuratTtd());

        break;
      case '/suratinternal':
        return MaterialPageRoute(builder: (_) => SuratInternal());

        break;
      case '/surateksternal':
        return MaterialPageRoute(builder: (_) => SuratEksternal());

        break;
      case '/sangatsegera':
        return MaterialPageRoute(builder: (_) => SangatSegera());

        break;
      case '/tembusan':
        return MaterialPageRoute(builder: (_) => Tembusan());

        break;
      case '/rahasia':
        return MaterialPageRoute(builder: (_) => SuratRahasia());

        break;
      case '/suratkeluar':
        return MaterialPageRoute(builder: (_) => SuratKeluar());
        break;
    }
    return MaterialPageRoute(builder: (_) => ErrorRoute());
  }
// route modul app

}
