-Biblioteci :

```dart
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/comments_widget.dart';
import '/account_profile_creation/edit_profile_auth_2/edit_profile_auth2_widget.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
```

- Documente folosite :

  https://images.unsplash.com/photo-1542715234-bd0adb4249b7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxhbmltYWwlMjBzaGVsdGVyfGVufDB8fHx8MTcxNjEzODU0MHww&ixlib=rb-4.0.3&q=80&w=1080
  https://images.unsplash.com/photo-1583787317796-2bc56f8556e2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxhbmltYWwlMjBzaGVsdGVyfGVufDB8fHx8MTcxNjEzODU0MHww&ixlib=rb-4.0.3&q=80&w=1080
  https://images.unsplash.com/photo-1583786693544-e352f898888d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxN3x8YW5pbWFsJTIwc2hlbHRlcnxlbnwwfHx8fDE3MTYxMzg1NDB8MA&ixlib=rb-4.0.3&q=80&w=1080
  assets/images/Logo_for_an_animal_store..png
  https://images.unsplash.com/photo-1493916665398-143bdeabe500?w=1280&h=720
  https://images.unsplash.com/photo-1518288774672-b94e808873ff?w=1280&h=720
  https://images.unsplash.com/photo-1675237831296-f2331c493d52?w=1280&h=720
  https://images.unsplash.com/photo-1623387641168-d9803ddd3f35?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxwZXRzfGVufDB8fHx8MTcxNjI3ODI3M3ww&ixlib=rb-4.0.3&q=80&w=1080
  assets/images/pets_3460335.png
  assets/images/finding_4716321.png
  assets/images/pet-house_4530687.png
  assets/images/Dog_training.png
  https://youtu.be/1oDGa2yPb2g?si=sfP9PLdEVL8TC-qh
  assets/images/Logo_for_an_animal_store.-removebg-preview_(1).png
  assets/images/Screenshot_2024-05-24_at_09.08.20.png
  https://maps.app.goo.gl/f8MgPcvA1ZKQU3WWA
  assets/images/caini-abandonati-comunitari-petitie.jpg
  assets/images/caini-27martie1.jpg
  assets/images/adapost-caini-e1703938702872-1536x1116.jpg
  assets/images/Screenshot_2024-05-24_at_09.30.37.png
  https://maps.app.goo.gl/znRJgrqUbNXYZAKp
  assets/images/asociatie-animale-paul-osan-7.jpg
  assets/images/adapostul-animale-fightforanimals-baiamaremaramures-19oct21-vizita-foto4.jpg
  assets/images/animale-adapost.jpg
  
  

  
- Împărțirea sarcinilor pentru dezvoltarea aplicației

Dezvoltarea aplicației a fost realizată prin colaborarea a două persoane, fiecare având responsabilități specifice în cadrul proiectului.

Trif Mihai - Integrare și Documentație

A integrat frontend-ul cu backend-ul, asigurându-se că toate funcționalitățile sunt interconectate și operează fără probleme.
Această împărțire a sarcinilor a permis utilizarea eficientă a resurselor și expertizei fiecărei persoane, contribuind la finalizarea cu succes a proiectului.
A realizat documentația detaliată a proiectului, incluzând descrieri tehnice și instrucțiuni de utilizare pentru utilizatori și dezvoltatori.

Stefanescu Ilinca - Backend și Frontend

A fost responsabilă pentru dezvoltarea și administrarea părții de backend a aplicației.
A gestionat baza de date, autentificarea utilizatorilor și logica de server, asigurând funcționarea corectă a aplicației.
A fost responsabilă pentru designul și implementarea interfeței de utilizator (frontend) a aplicației.
S-a ocupat de dezvoltarea și stilizarea paginilor web, asigurându-se că interfața este intuitivă și ușor de utilizat.

