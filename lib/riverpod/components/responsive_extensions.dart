// responsive_extensions.dart

import 'package:flutter/widgets.dart';

// Estensione per la scalabilità del font (con textScaleFactor)
extension ResponsiveFontSizeExtension on num {
  double sp(BuildContext context) {
    // Ottieni il textScaler dal MediaQuery
    double textScaler = MediaQuery.of(context).textScaler.scale(1.0);

    // Calcola la scala di base in base alla larghezza e altezza dello schermo
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double scaleFactor = ((screenWidth + screenHeight) / 2) /
        640; // 640 come riferimento di base

    // Restituisci la dimensione scalata, tenendo conto sia della scala del dispositivo che delle preferenze dell'utente
    return toDouble() * scaleFactor * textScaler;
  }
}

// Estensione per la scalabilità delle altre dimensioni (icone, padding, margini, ecc.)
extension ResponsiveSizeExtension on num {
  double sz(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calcola il fattore di scala basato su larghezza e altezza del dispositivo
    double scaleFactor = ((screenWidth + screenHeight) / 2) /
        640; // 640 come riferimento di un dispositivo di base

    return toDouble() *
        scaleFactor; // Converte 'this' in double e restituisce la dimensione scalata
  }
}
