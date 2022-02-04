import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants{
  static const anaRenk=Colors.indigo;
  static const baslik="Ortalama Hesapla";
  static final TextStyle baslikStyle=GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: anaRenk
  );
  static BorderRadius borderRadius=BorderRadius.circular(16);
  static final dersSayisiStyle=GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    color: anaRenk
  );

  static final OrtalamaStyle=GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: anaRenk
  );
  
  static final calismaVarStyle=GoogleFonts.oswald(
  fontSize: 36
  );

  static final Padding1=EdgeInsets.symmetric(horizontal: 8);
  
 
}