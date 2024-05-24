import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ro', 'hu', 'fr', 'es', 'de'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? roText = '',
    String? huText = '',
    String? frText = '',
    String? esText = '',
    String? deText = '',
  }) =>
      [enText, roText, huText, frText, esText, deText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Quiz1
  {
    '0zp9h5lj': {
      'en': 'Question 1/10',
      'de': 'Frage 1/10',
      'es': 'Pregunta 1/10',
      'fr': 'Question 1/10',
      'hu': '1/10 kérdés',
      'ro': 'Întrebarea 1/10',
    },
    'lbjlawui': {
      'en': 'What type of animal are you interested in?',
      'de': 'Für welche Tierart interessieren Sie sich?',
      'es': '¿Qué tipo de animal te interesa?',
      'fr': 'Quel type d\'animal vous intéresse ?',
      'hu': 'Milyen típusú állat érdekel?',
      'ro': 'Ce tip de animal te interesează?',
    },
    '13t64cpw': {
      'en': 'Cats',
      'de': 'Katzen',
      'es': 'gatos',
      'fr': 'Chats',
      'hu': 'Macskák',
      'ro': 'Pisicile',
    },
    'fb8nwwvh': {
      'en': 'Dogs',
      'de': 'Hunde',
      'es': 'Perros',
      'fr': 'Chiens',
      'hu': 'Kutyák',
      'ro': 'Câini',
    },
    '24m80z1d': {
      'en': 'Birds',
      'de': 'Vögel',
      'es': 'Aves',
      'fr': 'Des oiseaux',
      'hu': 'Madarak',
      'ro': 'Păsări',
    },
    'n19u8ne0': {
      'en': 'Reptils',
      'de': 'Reptilien',
      'es': 'reptiles',
      'fr': 'Reptiles',
      'hu': 'Hüllők',
      'ro': 'Reptile',
    },
    'hxcbfwbs': {
      'en': 'Cats',
      'de': 'Katzen',
      'es': 'gatos',
      'fr': 'Chats',
      'hu': 'Macskák',
      'ro': 'Pisicile',
    },
    '7kcqp0fy': {
      'en': 'NEXT',
      'de': 'NÄCHSTE',
      'es': 'PRÓXIMO',
      'fr': 'SUIVANT',
      'hu': 'KÖVETKEZŐ',
      'ro': 'URMĂTORUL',
    },
    'xy0t38zn': {
      'en': 'Adoption form',
      'de': 'Adoptionsformular',
      'es': 'Formulario de adopción',
      'fr': 'Formulaire d\'adoption',
      'hu': 'Örökbefogadási nyomtatvány',
      'ro': 'Formular de adopție',
    },
    'v0notjcy': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // Details34SupportPage
  {
    '9b07v9wh': {
      'en': 'Welcome to the support section',
      'de': 'Willkommen im Supportbereich',
      'es': 'Bienvenido a la sección de soporte',
      'fr': 'Bienvenue dans la section d\'assistance',
      'hu': 'Üdvözöljük a támogatási részben',
      'ro': 'Bun venit la secțiunea de asistență',
    },
    'scxnlkzw': {
      'en': 'How can we help you?',
      'de': 'Wie können wir Ihnen helfen?',
      'es': 'como podemos ayudarte?',
      'fr': 'Comment pouvons-nous vous aider?',
      'hu': 'Miben segíthetünk?',
      'ro': 'Cum vă putem ajuta?',
    },
    'zz8hnppu': {
      'en': 'Call',
      'de': 'Anruf',
      'es': 'Llamar',
      'fr': 'Appel',
      'hu': 'Hívás',
      'ro': 'Apel',
    },
    '279t509n': {
      'en': 'Email',
      'de': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'hu': 'Email',
      'ro': 'E-mail',
    },
    'mnngk8f5': {
      'en': 'Search FAQ\'s',
      'de': 'FAQ durchsuchen',
      'es': 'Buscar preguntas frecuentes',
      'fr': 'Rechercher dans la FAQ',
      'hu': 'Keresés a GYIK között',
      'ro': 'Căutați întrebări frecvente',
    },
    'eyoddjgc': {
      'en': 'FAQ\'s ',
      'de': 'Häufig gestellte Fragen',
      'es': 'Preguntas frecuentes',
      'fr': 'FAQ',
      'hu': 'GYIK',
      'ro': 'Întrebări frecvente',
    },
    'ya5d30i9': {
      'en': 'How can I adopt an animal?',
      'de': 'Wie kann ich ein Tier adoptieren?',
      'es': '¿Cómo puedo adoptar un animal?',
      'fr': 'Comment puis-je adopter un animal ?',
      'hu': 'Hogyan tudok örökbe fogadni egy állatot?',
      'ro': 'Cum pot adopta un animal?',
    },
    'ntr6o7my': {
      'en':
          'Complete the adoption form or choose one of the exhibited animals by sending a request directly from his page!',
      'de':
          'Füllen Sie das Adoptionsformular aus oder wählen Sie eines der ausgestellten Tiere aus, indem Sie direkt von seiner Seite aus eine Anfrage senden!',
      'es':
          '¡Complete el formulario de adopción o elija uno de los animales exhibidos enviando una solicitud directamente desde su página!',
      'fr':
          'Remplissez le formulaire d\'adoption ou choisissez l\'un des animaux exposés en envoyant une demande directement depuis sa page !',
      'hu':
          'Töltse ki az örökbefogadási űrlapot, vagy válasszon egyet a kiállított állatok közül, közvetlenül az oldaláról küldve kérelmét!',
      'ro':
          'Completează formularul de adopție sau alege unul dintre animalele expuse trimițând o cerere direct de pe pagina lui!',
    },
    'zf0of36m': {
      'en': 'Do I have to be 18?',
      'de': 'Muss ich 18 sein?',
      'es': '¿Tengo que tener 18 años?',
      'fr': 'Dois-je avoir 18 ans ?',
      'hu': '18 évesnek kell lennem?',
      'ro': 'Trebuie sa am 18 ani?',
    },
    'wo5at0sw': {
      'en':
          'Using the application does not require a certain age, but to adopt an animal, if you are a minor, you need a parent\'s consent.',
      'de':
          'Für die Nutzung der App ist kein bestimmtes Alter erforderlich. Um jedoch ein Tier zu adoptieren, benötigen Sie als Minderjähriger die Zustimmung eines Elternteils.',
      'es':
          'Para utilizar la aplicación no se requiere una edad determinada, pero para adoptar un animal, si eres menor de edad, necesitas el consentimiento de tus padres.',
      'fr':
          'L\'utilisation de l\'application ne nécessite pas un certain âge, mais pour adopter un animal, si vous êtes mineur, il faut l\'accord d\'un parent.',
      'hu':
          'Az alkalmazás használatához nem kell bizonyos életkor, de kiskorú állat örökbefogadásához szülői hozzájárulás szükséges.',
      'ro':
          'Utilizarea aplicației nu necesită o anumită vârstă, dar pentru a adopta un animal, dacă ești minor, ai nevoie de acordul părintelui.',
    },
    'yv5cvti8': {
      'en': 'What happens after completing the adoption form?',
      'de': 'Was passiert nach dem Ausfüllen des Adoptionsformulars?',
      'es': '¿Qué pasa después de completar el formulario de adopción?',
      'fr': 'Que se passe-t-il après avoir rempli le formulaire d\'adoption ?',
      'hu': 'Mi történik az örökbefogadási űrlap kitöltése után?',
      'ro': 'Ce se întâmplă după completarea formularului de adopție?',
    },
    '2181qpyb': {
      'en':
          'After completing it, we will analyze the details provided to find the best pair, after which we will contact you to establish the shelter and the time of presentation according to the animal.',
      'de':
          'Nach der Vervollständigung analysieren wir die bereitgestellten Angaben, um das beste Paar zu finden. Anschließend setzen wir uns mit Ihnen in Verbindung, um je nach Tier die Unterkunft und den Zeitpunkt der Vorstellung festzulegen.',
      'es':
          'Tras realizarlo analizaremos los datos aportados para encontrar la mejor pareja, tras lo cual nos pondremos en contacto contigo para establecer el refugio y el tiempo de presentación según el animal.',
      'fr':
          'Après l\'avoir complété, nous analyserons les détails fournis pour trouver le meilleur couple, après quoi nous vous contacterons pour établir le refuge et l\'heure de présentation en fonction de l\'animal.',
      'hu':
          'Elvégzése után a megadott adatokat elemezzük, hogy megtaláljuk a legjobb párost, majd felvesszük Önnel a kapcsolatot a menhely kialakítása és az állatnak megfelelő bemutatás időpontja érdekében.',
      'ro':
          'Dupa completarea acestuia, vom analiza detaliile oferite pentru a gasi cea mai buna pereche, dupa care va vom contacta pentru a stabili adapostul si ora prezentarii in functie de animal.',
    },
    'kkcbc858': {
      'en': 'Write us a message',
      'de': 'Schreiben Sie uns eine Nachricht',
      'es': 'Escríbenos un mensaje',
      'fr': 'Écrivez-nous un message',
      'hu': 'Írjon nekünk üzenetet',
      'ro': 'Scrie-ne un mesaj',
    },
    'u0hqmss0': {
      'en': 'Support',
      'de': 'Unterstützung',
      'es': 'Apoyo',
      'fr': 'Soutien',
      'hu': 'Támogatás',
      'ro': 'Suport',
    },
    'dsxahne4': {
      'en': 'Suport',
      'de': 'Unterstützung',
      'es': 'soporte',
      'fr': 'Soutien',
      'hu': 'Támogatás',
      'ro': 'Suport',
    },
  },
  // Quiz2
  {
    'er6wstgp': {
      'en': 'Question 2/10',
      'de': 'Frage 2/10',
      'es': 'Pregunta 2/10',
      'fr': 'Question 2/10',
      'hu': '2/10. kérdés',
      'ro': 'Întrebarea 2/10',
    },
    'yozjw94m': {
      'en': 'Have you had pets before?',
      'de': 'Hatten Sie schon einmal Haustiere?',
      'es': '¿Has tenido mascotas antes?',
      'fr': 'Avez-vous déjà eu des animaux de compagnie ?',
      'hu': 'Volt már házi kedvenced?',
      'ro': 'Ați avut animale de companie înainte?',
    },
    '61ia2xav': {
      'en': 'Yes',
      'de': 'Ja',
      'es': 'Sí',
      'fr': 'Oui',
      'hu': 'Igen',
      'ro': 'da',
    },
    'b1g6uv82': {
      'en': 'Yes',
      'de': 'Ja',
      'es': 'Sí',
      'fr': 'Oui',
      'hu': 'Igen',
      'ro': 'da',
    },
    'bafwae4y': {
      'en': 'No',
      'de': 'NEIN',
      'es': 'No',
      'fr': 'Non',
      'hu': 'Nem',
      'ro': 'Nu',
    },
    'kv61zmzm': {
      'en': 'NEXT',
      'de': 'NÄCHSTE',
      'es': 'PRÓXIMO',
      'fr': 'SUIVANT',
      'hu': 'KÖVETKEZŐ',
      'ro': 'URMĂTORUL',
    },
    'gb1vy7dk': {
      'en': 'Adoption form',
      'de': 'Adoptionsformular',
      'es': 'Formulario de adopción',
      'fr': 'Formulaire d\'adoption',
      'hu': 'Örökbefogadási nyomtatvány',
      'ro': 'Formular de adopție',
    },
    '8ysihf24': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // Quiz3
  {
    'nm6q1hsr': {
      'en': 'Question 3/10',
      'de': 'Frage 3/10',
      'es': 'Pregunta 3/10',
      'fr': 'Question 3/10',
      'hu': '3/10. kérdés',
      'ro': 'Întrebarea 3/10',
    },
    'akurucm3': {
      'en': 'Your experience with the pet:',
      'de': 'Ihre Erfahrungen mit dem Haustier:',
      'es': 'Tu experiencia con la mascota:',
      'fr': 'Votre expérience avec l\'animal :',
      'hu': 'Tapasztalataid a háziállattal kapcsolatban:',
      'ro': 'Experiența ta cu animalul de companie:',
    },
    'jt8y4nt3': {
      'en': 'My experience was..',
      'de': 'Meine Erfahrung war..',
      'es': 'Mi experiencia fue...',
      'fr': 'Mon expérience était ..',
      'hu': 'Az én tapasztalatom az volt..',
      'ro': 'Experiența mea a fost..',
    },
    '7353v8k4': {
      'en': 'NEXT',
      'de': 'NÄCHSTE',
      'es': 'PRÓXIMO',
      'fr': 'SUIVANT',
      'hu': 'KÖVETKEZŐ',
      'ro': 'URMĂTORUL',
    },
    'ovc5iwv3': {
      'en': 'Adoption form',
      'de': 'Adoptionsformular',
      'es': 'Formulario de adopción',
      'fr': 'Formulaire d\'adoption',
      'hu': 'Örökbefogadási nyomtatvány',
      'ro': 'Formular de adopție',
    },
    'ragbg584': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // Quiz4
  {
    'o0bz46sb': {
      'en': 'Question 4/10',
      'de': 'Frage 4/10',
      'es': 'Pregunta 4/10',
      'fr': 'Question 4/10',
      'hu': '4/10. kérdés',
      'ro': 'Întrebarea 4/10',
    },
    'vuawzuix': {
      'en': 'Have you ever owned the type of pet you are looking for?',
      'de': 'Haben Sie schon einmal das Haustier besessen, das Sie suchen?',
      'es': '¿Alguna vez ha tenido el tipo de mascota que busca?',
      'fr': 'Avez-vous déjà possédé le type d’animal que vous recherchez ?',
      'hu': 'Volt már valaha olyan házi kedvence, amelyet keres?',
      'ro': 'Ați avut vreodată tipul de animal de companie pe care îl căutați?',
    },
    'leoei1kw': {
      'en': 'Yes',
      'de': 'Ja',
      'es': 'Sí',
      'fr': 'Oui',
      'hu': 'Igen',
      'ro': 'da',
    },
    '2xrv7v82': {
      'en': 'Yes',
      'de': 'Ja',
      'es': 'Sí',
      'fr': 'Oui',
      'hu': 'Igen',
      'ro': 'da',
    },
    'q6s8zbzh': {
      'en': 'No',
      'de': 'NEIN',
      'es': 'No',
      'fr': 'Non',
      'hu': 'Nem',
      'ro': 'Nu',
    },
    'qkdtgukb': {
      'en': 'NEXT',
      'de': 'NÄCHSTE',
      'es': 'PRÓXIMO',
      'fr': 'SUIVANT',
      'hu': 'KÖVETKEZŐ',
      'ro': 'URMĂTORUL',
    },
    '4vrnb189': {
      'en': 'Adoption form',
      'de': 'Adoptionsformular',
      'es': 'Formulario de adopción',
      'fr': 'Formulaire d\'adoption',
      'hu': 'Örökbefogadási nyomtatvány',
      'ro': 'Formular de adopție',
    },
    'mazc4kho': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // Quiz5
  {
    '2hnu6b1y': {
      'en': 'Question 5/10',
      'de': 'Frage 5/10',
      'es': 'Pregunta 5/10',
      'fr': 'Question 5/10',
      'hu': '5/10 kérdés',
      'ro': 'Întrebarea 5/10',
    },
    'p2e0wp6u': {
      'en': 'Do you currently have any other pets?',
      'de': 'Halten Sie derzeit noch andere Haustiere?',
      'es': '¿Tiene actualmente alguna otra mascota?',
      'fr': 'Avez-vous actuellement d\'autres animaux de compagnie ?',
      'hu': 'Van jelenleg más házi kedvence?',
      'ro': 'În prezent aveți și alte animale de companie?',
    },
    'lvs94ydf': {
      'en': 'Yes',
      'de': 'Ja',
      'es': 'Sí',
      'fr': 'Oui',
      'hu': 'Igen',
      'ro': 'da',
    },
    '9pnqq2kh': {
      'en': 'Yes',
      'de': 'Ja',
      'es': 'Sí',
      'fr': 'Oui',
      'hu': 'Igen',
      'ro': 'da',
    },
    'ndk2inqt': {
      'en': 'No',
      'de': 'NEIN',
      'es': 'No',
      'fr': 'Non',
      'hu': 'Nem',
      'ro': 'Nu',
    },
    '1m4dmwa6': {
      'en': 'NEXT',
      'de': 'NÄCHSTE',
      'es': 'PRÓXIMO',
      'fr': 'SUIVANT',
      'hu': 'KÖVETKEZŐ',
      'ro': 'URMĂTORUL',
    },
    'mrmorkkj': {
      'en': 'Adoption form',
      'de': 'Adoptionsformular',
      'es': 'Formulario de adopción',
      'fr': 'Formulaire d\'adoption',
      'hu': 'Örökbefogadási nyomtatvány',
      'ro': 'Formular de adopție',
    },
    '9dyi3p51': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // Quiz6
  {
    'p6nufzpe': {
      'en': 'Question 6/10',
      'de': 'Frage 6/10',
      'es': 'Pregunta 6/10',
      'fr': 'Question 6/10',
      'hu': '6/10 kérdés',
      'ro': 'Întrebarea 6/10',
    },
    'chnfdpbi': {
      'en': 'Specify the species, breed, age and if it is spayed/neutered.',
      'de': 'Geben Sie Art, Rasse und Alter an und ob das Tier kastriert ist.',
      'es': 'Especificar especie, raza, edad y si está esterilizado/castrado.',
      'fr': 'Précisez l’espèce, la race, l’âge et s’il est castré/castré.',
      'hu':
          'Adja meg a fajt, fajtát, kort és azt, hogy ivartalanított-e/ivartalanított-e.',
      'ro': 'Precizați specia, rasa, vârsta și dacă este sterilizat/castrat.',
    },
    'bx6bxdu4': {
      'en': 'Dog, Labrador breed, age 7 years, not castrated..',
      'de': 'Hund, Rasse Labrador, Alter 7 Jahre, nicht kastriert.',
      'es': 'Perro, raza Labrador, edad 7 años, no castrado.',
      'fr': 'Chien, race Labrador, âgé de 7 ans, non castré.',
      'hu': 'Kutya, Labrador fajta, 7 éves, nem kasztrált..',
      'ro': 'Caine, rasa Labrador, varsta 7 ani, necastrat..',
    },
    'xe5q2enp': {
      'en': 'NEXT',
      'de': 'NÄCHSTE',
      'es': 'PRÓXIMO',
      'fr': 'SUIVANT',
      'hu': 'KÖVETKEZŐ',
      'ro': 'URMĂTORUL',
    },
    'mdhb0f85': {
      'en': 'Adoption form',
      'de': 'Adoptionsformular',
      'es': 'Formulario de adopción',
      'fr': 'Formulaire d\'adoption',
      'hu': 'Örökbefogadási nyomtatvány',
      'ro': 'Formular de adopție',
    },
    'zs0g0f34': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // Quiz7
  {
    'rxsoyrbk': {
      'en': 'Question 7/10',
      'de': 'Frage 7/10',
      'es': 'Pregunta 7/10',
      'fr': 'Question 7/10',
      'hu': '7/10. kérdés',
      'ro': 'Întrebarea 7/10',
    },
    '0nq7w2t3': {
      'en': 'Who will be responsible for the daily care of the animal?',
      'de': 'Wer kümmert sich im Alltag um das Tier?',
      'es': '¿Quién será el responsable del cuidado diario del animal?',
      'fr': 'Qui sera responsable des soins quotidiens de l’animal ?',
      'hu': 'Ki lesz a felelős az állat napi gondozásáért?',
      'ro': 'Cine va fi responsabil pentru îngrijirea zilnică a animalului?',
    },
    'u84wkpgv': {
      'en': 'Me',
      'de': 'Mich',
      'es': 'A mí',
      'fr': 'Moi',
      'hu': 'Nekem',
      'ro': 'Pe mine',
    },
    'bimarvmj': {
      'en': 'Family member',
      'de': 'Familienmitglied',
      'es': 'Miembro de la familia',
      'fr': 'Membre de la famille',
      'hu': 'Családtag',
      'ro': 'Membru al familiei',
    },
    'jz54p7gu': {
      'en': 'Friend',
      'de': 'Freund',
      'es': 'Amigo',
      'fr': 'Ami',
      'hu': 'Barát',
      'ro': 'Prietene',
    },
    'szy7ccfm': {
      'en': 'I don\'t know',
      'de': 'Ich weiß nicht',
      'es': 'No sé',
      'fr': 'Je ne sais pas',
      'hu': 'Nem tudom',
      'ro': 'Nu știu',
    },
    '7tv6oj4h': {
      'en': 'Me',
      'de': 'Mich',
      'es': 'A mí',
      'fr': 'Moi',
      'hu': 'Nekem',
      'ro': 'Pe mine',
    },
    'jv1km3ty': {
      'en': 'NEXT',
      'de': 'NÄCHSTE',
      'es': 'PRÓXIMO',
      'fr': 'SUIVANT',
      'hu': 'KÖVETKEZŐ',
      'ro': 'URMĂTORUL',
    },
    'nukbcxk0': {
      'en': 'Adoption form',
      'de': 'Adoptionsformular',
      'es': 'Formulario de adopción',
      'fr': 'Formulaire d\'adoption',
      'hu': 'Örökbefogadási nyomtatvány',
      'ro': 'Formular de adopție',
    },
    'nn74j7vt': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // Quiz8
  {
    'p9w17o1z': {
      'en': 'Question 8/10',
      'de': 'Frage 8/10',
      'es': 'Pregunta 8/10',
      'fr': 'Question 8/10',
      'hu': '8/10 kérdés',
      'ro': 'Întrebarea 8/10',
    },
    'h7nroo51': {
      'en':
          'Do you live in a rented house or your own home? Apartment or house?',
      'de': 'Wohnen Sie zur Miete oder im Eigenheim? Wohnung oder Haus?',
      'es':
          '¿Vives en una casa alquilada o en tu propia casa? ¿Apartamento o casa?',
      'fr':
          'Vivez-vous dans une maison louée ou dans votre propre logement ? Appartement ou maison ?',
      'hu': 'Bérelt házban vagy saját otthonodban élsz? Lakás vagy ház?',
      'ro':
          'Locuiți într-o casă închiriată sau într-o casă proprie? Apartament sau casa?',
    },
    '1prn7x2r': {
      'en': 'Rent, House',
      'de': 'Miethaus',
      'es': 'Casa en renta',
      'fr': 'Maison à louer',
      'hu': 'Kiadó, Ház',
      'ro': 'Închiriere, casă',
    },
    '0axf6zy9': {
      'en': 'Rent, Apartment',
      'de': 'Wohnung mieten',
      'es': 'Alquilo apartamento',
      'fr': 'Louer appartement',
      'hu': 'Kiadó apartman',
      'ro': 'Inchiriere, apartament',
    },
    's94zj4qm': {
      'en': 'Own house',
      'de': 'Eigenem Haus',
      'es': 'Propia casa',
      'fr': 'Sa propre maison',
      'hu': 'Saját ház',
      'ro': 'Propia casă',
    },
    'tnkvk12n': {
      'en': 'Own apartment',
      'de': 'Eigene Wohnung',
      'es': 'Apartamento propio',
      'fr': 'Propre appartement',
      'hu': 'Saját lakás',
      'ro': 'Apartament propriu',
    },
    'g3htkptm': {
      'en': 'Rent, House',
      'de': 'Miethaus',
      'es': 'Casa en renta',
      'fr': 'Maison à louer',
      'hu': 'Kiadó, Ház',
      'ro': 'Închiriere, casă',
    },
    'peciprlt': {
      'en': 'NEXT',
      'de': 'NÄCHSTE',
      'es': 'PRÓXIMO',
      'fr': 'SUIVANT',
      'hu': 'KÖVETKEZŐ',
      'ro': 'URMĂTORUL',
    },
    '7v7unmvm': {
      'en': 'Adoption form',
      'de': 'Adoptionsformular',
      'es': 'Formulario de adopción',
      'fr': 'Formulaire d\'adoption',
      'hu': 'Örökbefogadási nyomtatvány',
      'ro': 'Formular de adopție',
    },
    'rzku55tg': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // Quiz9
  {
    'eira84b6': {
      'en': 'Question 9/10',
      'de': 'Frage 9/10',
      'es': 'Pregunta 9/10',
      'fr': 'Question 9/10',
      'hu': '9/10 kérdés',
      'ro': 'Întrebarea 9/10',
    },
    '3jr6car3': {
      'en': 'What type of environment can you offer the animal?',
      'de': 'Welche Umgebung können Sie dem Tier bieten?',
      'es': '¿Qué tipo de ambiente puedes ofrecerle al animal?',
      'fr': 'Quel type d’environnement pouvez-vous offrir à l’animal ?',
      'hu': 'Milyen környezetet tud ajánlani az állatnak?',
      'ro': 'Ce tip de mediu îi poți oferi animalului?',
    },
    'eqcjt3fr': {
      'en': 'Indoors',
      'de': 'Drinnen',
      'es': 'Adentro',
      'fr': 'À l\'intérieur',
      'hu': 'Fedett',
      'ro': 'În interior',
    },
    'kcgi0kbi': {
      'en': 'Indoors',
      'de': 'Drinnen',
      'es': 'Adentro',
      'fr': 'À l\'intérieur',
      'hu': 'Fedett',
      'ro': 'În interior',
    },
    'emyncd4n': {
      'en': 'Indoors with access outdoors',
      'de': 'Innenbereich mit Zugang nach draußen',
      'es': 'Interior con acceso al exterior.',
      'fr': 'À l\'intérieur avec accès à l\'extérieur',
      'hu': 'Beltéri, kültéri hozzáféréssel',
      'ro': 'În interior cu acces în exterior',
    },
    'amswmtus': {
      'en': 'Outdoors',
      'de': 'Draußen',
      'es': 'Al aire libre',
      'fr': 'En plein air',
      'hu': 'Szabadban',
      'ro': 'În aer liber',
    },
    'xb3dmo86': {
      'en': 'NEXT',
      'de': 'NÄCHSTE',
      'es': 'PRÓXIMO',
      'fr': 'SUIVANT',
      'hu': 'KÖVETKEZŐ',
      'ro': 'URMĂTORUL',
    },
    'mhf5hnpi': {
      'en': 'Adoption form',
      'de': 'Adoptionsformular',
      'es': 'Formulario de adopción',
      'fr': 'Formulaire d\'adoption',
      'hu': 'Örökbefogadási nyomtatvány',
      'ro': 'Formular de adopție',
    },
    'pvq19zda': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // Quiz10
  {
    'eq5tyh1d': {
      'en': 'Question 10/10',
      'de': 'Frage 10/10',
      'es': 'Pregunta 10/10',
      'fr': 'Question 10/10',
      'hu': '10/10 kérdés',
      'ro': 'Întrebarea 10/10',
    },
    'nr0y7lf4': {
      'en': 'Complete with contact details and full name.',
      'de': 'Ergänzen Sie mit Kontaktdaten und vollständigem Namen.',
      'es': 'Completar con datos de contacto y nombre completo.',
      'fr': 'Complet avec les coordonnées et le nom complet.',
      'hu': 'Teljes névvel és elérhetőséggel.',
      'ro': 'Completați cu datele de contact și numele complet.',
    },
    'spjp9q9v': {
      'en': 'Write..',
      'de': 'Schreiben..',
      'es': 'Escribir..',
      'fr': 'Écrire..',
      'hu': 'Ír..',
      'ro': 'Scrie..',
    },
    'zzzxa5gd': {
      'en': 'NEXT',
      'de': 'NÄCHSTE',
      'es': 'PRÓXIMO',
      'fr': 'SUIVANT',
      'hu': 'KÖVETKEZŐ',
      'ro': 'URMĂTORUL',
    },
    'vymr0m3u': {
      'en': 'Adoption form',
      'de': 'Adoptionsformular',
      'es': 'Formulario de adopción',
      'fr': 'Formulaire d\'adoption',
      'hu': 'Örökbefogadási nyomtatvány',
      'ro': 'Formular de adopție',
    },
    'vlc77red': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // Shelters
  {
    'w0m56u41': {
      'en': 'Find a shelter',
      'de': 'Finden Sie einen Unterschlupf',
      'es': 'encontrar un refugio',
      'fr': 'Trouver un refuge',
      'hu': 'Keress menedéket',
      'ro': 'Găsiți un adăpost',
    },
    'nig5h0sl': {
      'en': 'Search by location',
      'de': 'Suche nach Standort',
      'es': 'Buscar por ubicación',
      'fr': 'Rechercher par emplacement',
      'hu': 'Keresés hely szerint',
      'ro': 'Căutați după locație',
    },
    's7ylo57l': {
      'en': 'Nearby shelters',
      'de': 'Unterkünfte in der Nähe',
      'es': 'Refugios cercanos',
      'fr': 'Refuges à proximité',
      'hu': 'A közeli menhelyek',
      'ro': 'Adăposturi din apropiere',
    },
    'qghc4cz6': {
      'en': 'ADAPOST CONSILIUL  LOCAL  BAIA  MARE',
      'de': 'ADAPOST RAT LOKALES BAIA MARE',
      'es': 'ADAPOST CONSILIUL LOCAL BAIA MARE',
      'fr': 'ADAPOST CONSILIUL LOCAL BAIA MARE',
      'hu': 'ADAPOST CONSILIUL LOCAL BAIA MARE',
      'ro': 'ADAPOST CONSILIUL LOCAL BAIA MARE',
    },
    'vo1plbkz': {
      'en': '3 miles away',
      'de': '3 Meilen entfernt',
      'es': '3 millas de distancia',
      'fr': 'à 3 miles',
      'hu': '3 mérföldre',
      'ro': '3 mile depărtare',
    },
    'hk0vrdjz': {
      'en': 'L-V 8:00 – 16:00 , S-D 08:00 -12:00',
      'de': 'Mo-Fr 8:00 – 16:00 , Sa-So 08:00 -12:00',
      'es': 'LV 8:00 – 16:00, SD 08:00 -12:00',
      'fr': 'L-V 8h00 – 16h00, S-D 08h00 -12h00',
      'hu': 'L-V 8:00-16:00 , S-D 08:00-12:00',
      'ro': 'L-V 8:00 – 16:00 , S-D 08:00 -12:00',
    },
    'zh93rb0j': {
      'en': 'ADAPOST BAIA SPRIE',
      'de': 'ADAPOST BAIA SPRIE',
      'es': 'ADAPOST BAIA SPRIE',
      'fr': 'ADAPTATEUR BAIA SPRIE',
      'hu': 'ADAPOST BAIA SPRIE',
      'ro': 'ADAPOST BAIA SPRIE',
    },
    'izsp21u5': {
      'en': '5 miles away',
      'de': '5 Meilen entfernt',
      'es': '5 millas de distancia',
      'fr': 'à 5 miles',
      'hu': '5 mérföldre',
      'ro': '5 mile depărtare',
    },
    'eku11o61': {
      'en': 'L-V 8:00 – 16:00 , S-D 10:00 -12:00',
      'de': 'Mo.–Fr. 8:00 – 16:00 Uhr, Sa.–Do. 10:00 -12:00 Uhr',
      'es': 'LV 8:00 – 16:00, SD 10:00 -12:00',
      'fr': 'L-V 8h00 – 16h00, SD 10h00 -12h00',
      'hu': 'L-V 8:00-16:00 , S-D 10:00-12:00',
      'ro': 'L-V 8:00 – 16:00 , S-D 10:00 -12:00',
    },
    'llb9hvpi': {
      'en': 'PRIMĂRIA ORAŞULUI  SIGHETU  MARMAŢIEI',
      'de': 'PRIMĂRIA ORAŞULUI SIGHETU MARMAŢIEI',
      'es': 'PRIMĂRIA ORAŞULUI SIGHETU MARMAŢIEI',
      'fr': 'PRIMĂRIA ORAŞULUI SIGHETU MARMAŢIEI',
      'hu': 'PRIMĂRIA ORAŞULUI SIGHETU MARMAŢIEI',
      'ro': 'PRIMĂRIA ORAŞULUI SIGHETU MARMAŢIEI',
    },
    '8fa8n1hp': {
      'en': '8 miles away',
      'de': '8 Meilen entfernt',
      'es': '8 millas de distancia',
      'fr': 'à 8 milles',
      'hu': '8 mérföldre',
      'ro': '8 mile depărtare',
    },
    'h22k8p0b': {
      'en': 'L-V 10:00 – 18:00',
      'de': 'Mo–Fr 10:00–18:00',
      'es': 'L-V 10:00 – 18:00',
      'fr': 'L-V 10h00 – 18h00',
      'hu': 'L-V 10:00 – 18:00',
      'ro': 'L-V 10:00 – 18:00',
    },
    '6ipoalp1': {
      'en': 'Shelters',
      'de': 'Unterstände',
      'es': 'Refugios',
      'fr': 'Abris',
      'hu': 'Menedékek',
      'ro': 'Adăposturi',
    },
  },
  // settings
  {
    'jdad2un0': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'es': 'Ajustes',
      'fr': 'Paramètres',
      'hu': 'Beállítások',
      'ro': 'Setări',
    },
    'm88jr0z8': {
      'en': 'Contact',
      'de': 'Kontakt',
      'es': 'Contacto',
      'fr': 'Contact',
      'hu': 'Kapcsolatba lépni',
      'ro': 'a lua legatura',
    },
    'huv67sfm': {
      'en': 'Adoption form',
      'de': 'Adoptionsformular',
      'es': 'Formulario de adopción',
      'fr': 'Formulaire d\'adoption',
      'hu': 'Örökbefogadási nyomtatvány',
      'ro': 'Formular de adopție',
    },
    '6390l2d0': {
      'en': 'About us',
      'de': 'Über uns',
      'es': 'Sobre nosotros',
      'fr': 'À propos de nous',
      'hu': 'Rólunk',
      'ro': 'Despre noi',
    },
    '2bdejh7z': {
      'en': 'Support',
      'de': 'Unterstützung',
      'es': 'Apoyo',
      'fr': 'Soutien',
      'hu': 'Támogatás',
      'ro': 'A sustine',
    },
    'b2ri8m1o': {
      'en': 'Privacy policy',
      'de': 'Datenschutzrichtlinie',
      'es': 'Política de privacidad',
      'fr': 'Politique de confidentialité',
      'hu': 'Adatvédelmi irányelvek',
      'ro': 'Politica de confidențialitate',
    },
    'owlfo3rx': {
      'en': 'Terms & Conditions',
      'de': 'Terms & amp; Bedingungen',
      'es': 'Términos y condiciones',
      'fr': 'termes et conditions',
      'hu': 'Felhasználási feltételek',
      'ro': 'termeni si conditii',
    },
    'zrbw76o6': {
      'en': 'Follow us on',
      'de': 'Folge uns auf',
      'es': 'Siga con nosotros',
      'fr': 'Suivez-nous sur',
      'hu': 'Kövess minket',
      'ro': 'Urmareste-ne pe',
    },
    '74tsvpkl': {
      'en': 'Log Out',
      'de': 'Ausloggen',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
      'hu': 'Kijelentkezés',
      'ro': 'Deconectați-vă',
    },
    'hnfivfkw': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // Adoptionpage
  {
    'kmsjfyc7': {
      'en': 'Search pets...',
      'de': 'Haustiere suchen...',
      'es': 'Buscar mascotas...',
      'fr': 'Rechercher des animaux...',
      'hu': 'Háziállatok keresése...',
      'ro': 'Căutați animale de companie...',
    },
    'yqsfawqy': {
      'en': 'Animals Up for Adoption',
      'de': 'Tiere zur Adoption',
      'es': 'Animales en adopción',
      'fr': 'Animaux à adopter',
      'hu': 'Állatok örökbefogadásra várnak',
      'ro': 'Animale pentru adopție',
    },
    'xa1q7pmx': {
      'en': 'Buddy, Golden Retriever',
      'de': 'Buddy, Golden Retriever',
      'es': 'Amigo, golden retriever',
      'fr': 'Mon pote, Golden Retriever',
      'hu': 'Buddy, Golden Retriever',
      'ro': 'Prietene, Golden Retriever',
    },
    '824swktz': {
      'en': '2 years old',
      'de': '2 Jahre alt',
      'es': '2 años de edad',
      'fr': '2 ans',
      'hu': '2 éves',
      'ro': '2 ani',
    },
    'czsofq7z': {
      'en': 'Friendly and energetic',
      'de': 'Freundlich und energisch',
      'es': 'Amable y enérgico',
      'fr': 'Sympathique et énergique',
      'hu': 'Barátságos és energikus',
      'ro': 'Prietenos și energic',
    },
    'js1taf2m': {
      'en': 'Adopt',
      'de': 'Adoptieren',
      'es': 'Adoptar',
      'fr': 'Adopter',
      'hu': 'Fogadj örökbe',
      'ro': 'Adopta',
    },
    'pldixbji': {
      'en': 'Whiskers, Siamese Cat',
      'de': 'Schnurrhaare, Siamkatze',
      'es': 'Bigotes, Gato Siamés',
      'fr': 'Moustaches, chat siamois',
      'hu': 'Bajusz, sziámi macska',
      'ro': 'Mustați, pisica siameză',
    },
    's287z30i': {
      'en': '3 years old',
      'de': '3 Jahre alt',
      'es': '3 años',
      'fr': '3 ans',
      'hu': '3 éves',
      'ro': '3 ani',
    },
    'fz95ofph': {
      'en': 'Calm and affectionate',
      'de': 'Ruhig und liebevoll',
      'es': 'tranquilo y cariñoso',
      'fr': 'Calme et affectueux',
      'hu': 'Nyugodt és szeretetteljes',
      'ro': 'Calm și afectuos',
    },
    'hv22xvi9': {
      'en': 'Adopt',
      'de': 'Adoptieren',
      'es': 'Adoptar',
      'fr': 'Adopter',
      'hu': 'Fogadj örökbe',
      'ro': 'Adopta',
    },
    'yqpnoqfx': {
      'en': 'Coco, Dutch Rabbit',
      'de': 'Coco, Holländisches Kaninchen',
      'es': 'Coco, conejo holandés',
      'fr': 'Coco, lapin hollandais',
      'hu': 'Coco, holland nyúl',
      'ro': 'Coco, iepure olandez',
    },
    '8rytyzo6': {
      'en': '1 year old',
      'de': '1 Jahr alt',
      'es': '1 año',
      'fr': '1 an',
      'hu': '1 éves',
      'ro': '1 an',
    },
    'rm0ovrnb': {
      'en': 'Playful and curious',
      'de': 'Verspielt und neugierig',
      'es': 'Juguetón y curioso',
      'fr': 'Joueur et curieux',
      'hu': 'Játékos és kíváncsi',
      'ro': 'Jucăuș și curios',
    },
    'lxm0umyb': {
      'en': 'Adopt',
      'de': 'Adoptieren',
      'es': 'Adoptar',
      'fr': 'Adopter',
      'hu': 'Fogadj örökbe',
      'ro': 'Adopta',
    },
    'ct5fi4q0': {
      'en': 'Adoption Center',
      'de': 'Adoptionszentrum',
      'es': 'Centro de adopción',
      'fr': 'Centre d\'adoption',
      'hu': 'Örökbefogadási Központ',
      'ro': 'Centrul de Adopție',
    },
    'ct2tr922': {
      'en': 'Adoptii',
      'de': 'Adoptii',
      'es': 'Adoptii',
      'fr': 'Adoptii',
      'hu': 'Adoptii',
      'ro': 'Adoptii',
    },
  },
  // Mesajsuport
  {
    'whxeb6n2': {
      'en': 'Write us a message',
      'de': 'Schreiben Sie uns eine Nachricht',
      'es': 'Escríbenos un mensaje',
      'fr': 'Écrivez-nous un message',
      'hu': 'Írjon nekünk üzenetet',
      'ro': 'Scrie-ne un mesaj',
    },
    'urwz59ud': {
      'en': 'Support',
      'de': 'Unterstützung',
      'es': 'Apoyo',
      'fr': 'Soutien',
      'hu': 'Támogatás',
      'ro': 'A sustine',
    },
    'kpwcsgxc': {
      'en': 'Send the message',
      'de': 'Senden Sie die Nachricht',
      'es': 'enviar el mensaje',
      'fr': 'Envoyer le message',
      'hu': 'Küldje el az üzenetet',
      'ro': 'Trimite mesajul',
    },
    'n8q623gj': {
      'en': 'Call',
      'de': 'Anruf',
      'es': 'Llamar',
      'fr': 'Appel',
      'hu': 'Hívás',
      'ro': 'Apel',
    },
    'grwjzyp5': {
      'en': 'Email ',
      'de': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'hu': 'Email',
      'ro': 'E-mail',
    },
    '5bjxm18h': {
      'en': 'FAQs',
      'de': 'FAQs',
      'es': 'Preguntas frecuentes',
      'fr': 'FAQ',
      'hu': 'GYIK',
      'ro': 'Întrebări frecvente',
    },
    'veyn5amm': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'ncrbw418': {
      'en': 'Name',
      'de': 'Name',
      'es': 'Nombre',
      'fr': 'Nom',
      'hu': 'Név',
      'ro': 'Nume',
    },
    '332y9v75': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '84ren9bt': {
      'en': 'Phone number',
      'de': 'Telefonnummer',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
      'hu': 'Telefonszám',
      'ro': 'Număr de telefon',
    },
    'qacmunk6': {
      'en': 'Describe the problem',
      'de': 'Beschreibe das Problem',
      'es': 'Describe el problema',
      'fr': 'Décris le problème',
      'hu': 'Írja le a problémát',
      'ro': 'Descrie problema',
    },
    'lwpqx38w': {
      'en': 'Add photo',
      'de': 'Foto hinzufügen',
      'es': 'Añadir foto',
      'fr': 'Ajouter une photo',
      'hu': 'Fénykép hozzáadása',
      'ro': 'Adauga poza',
    },
    '9321rnhz': {
      'en': 'Send message',
      'de': 'Nachricht senden',
      'es': 'Enviar mensaje',
      'fr': 'Envoyer le message',
      'hu': 'Üzenet küldése',
      'ro': 'Trimite mesaj',
    },
    'bqwezzi2': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // FAQ
  {
    'yvswfiqa': {
      'en': 'Frequent asked questions',
      'de': 'Häufig gestellte Fragen',
      'es': 'Preguntas frecuentes',
      'fr': 'Questions fréquemment posées',
      'hu': 'Gyakran ismételt kérdések',
      'ro': 'Întrebări frecvente',
    },
    'kzuc2zmf': {
      'en': 'Q1: What is OnePaw?',
      'de': 'F1: Was ist OnePaw?',
      'es': 'P1: ¿Qué es OnePaw?',
      'fr': 'Q1 : Qu\'est-ce que OnePaw ?',
      'hu': '1. kérdés: Mi az a OnePaw?',
      'ro': 'Î1: Ce este OnePaw?',
    },
    'hqjz9s96': {
      'en':
          'A: OnePaw is a platform dedicated to pet adoptions, finding lost pets and providing useful animal information. We aim to connect animal lovers with animals in need of a permanent or temporary home.',
      'de':
          'A: OnePaw ist eine Plattform, die sich der Vermittlung von Haustieren, der Suche nach verlorenen Haustieren und der Bereitstellung nützlicher Tierinformationen widmet. Unser Ziel ist es, Tierliebhaber mit Tieren zusammenzubringen, die ein dauerhaftes oder vorübergehendes Zuhause benötigen.',
      'es':
          'R: OnePaw es una plataforma dedicada a la adopción de mascotas, la búsqueda de mascotas perdidas y la provisión de información útil sobre animales. Nuestro objetivo es conectar a los amantes de los animales con animales que necesitan un hogar permanente o temporal.',
      'fr':
          'R : OnePaw est une plateforme dédiée aux adoptions d\'animaux de compagnie, à la recherche d\'animaux perdus et à la fourniture d\'informations utiles sur les animaux. Notre objectif est de mettre en relation les amoureux des animaux avec des animaux ayant besoin d\'un foyer permanent ou temporaire.',
      'hu':
          'V: A OnePaw egy kisállat-örökbefogadásra, az elveszett házi kedvencek megtalálására és az állatokkal kapcsolatos hasznos információk biztosítására szolgáló platform. Célunk, hogy az állatbarátokat összekapcsoljuk az állandó vagy ideiglenes otthonra szoruló állatokkal.',
      'ro':
          'R: OnePaw este o platformă dedicată adopțiilor de animale de companie, găsirii animalelor de companie pierdute și oferind informații utile despre animale. Ne propunem să punem în legătură iubitorii de animale cu animalele care au nevoie de o casă permanentă sau temporară.',
    },
    'liaxuhtj': {
      'en': 'Q2: How can I report a lost animal?',
      'de': 'F2: Wie kann ich ein vermisstes Tier melden?',
      'es': 'P2: ¿Cómo puedo denunciar la pérdida de un animal?',
      'fr': 'Q2 : Comment puis-je signaler un animal perdu ?',
      'hu': '2. kérdés: Hogyan jelenthetek egy elveszett állatot?',
      'ro': 'Î2: Cum pot raporta un animal pierdut?',
    },
    'zl8tpkbq': {
      'en':
          'A: In the \"Lost & Found\" section of the app, select \"Report a lost animal\" and fill in the form with details about your animal, including a recent photo, description and where it was last seen.',
      'de':
          'A: Wählen Sie im Bereich „Fundbüro“ der App „Verlorenes Tier melden“ und füllen Sie das Formular mit Einzelheiten zu Ihrem Tier aus, darunter ein aktuelles Foto, eine Beschreibung und den Ort, an dem es zuletzt gesehen wurde.',
      'es':
          'R: En la sección \"Objetos perdidos y encontrados\" de la aplicación, seleccione \"Reportar un animal perdido\" y complete el formulario con detalles sobre su animal, incluida una foto reciente, una descripción y dónde fue visto por última vez.',
      'fr':
          'R : Dans la section « Objets perdus » de l\'application, sélectionnez « Signaler un animal perdu » et remplissez le formulaire avec des détails sur votre animal, y compris une photo récente, une description et l\'endroit où il a été vu pour la dernière fois.',
      'hu':
          'V: Az alkalmazás „Elveszett és megtalált” részében válassza az „Elveszett állat bejelentése” lehetőséget, és töltse ki az űrlapot az állat adataival, beleértve a legutóbbi fényképet, leírást és azt, hogy hol látták utoljára.',
      'ro':
          'R: În secțiunea „Lost & Found” a aplicației, selectați „Raportați un animal pierdut” și completați formularul cu detalii despre animalul dvs., inclusiv o fotografie recentă, descriere și locul unde a fost văzut ultima dată.',
    },
    'vat2odak': {
      'en': 'Q3: What information is required to adopt an animal?',
      'de':
          'F3: Welche Informationen werden für die Adoption eines Tieres benötigt?',
      'es': 'P3: ¿Qué información se requiere para adoptar un animal?',
      'fr':
          'Q3 : Quelles informations sont nécessaires pour adopter un animal ?',
      'hu':
          '3. kérdés: Milyen információkra van szükség egy állat örökbefogadásához?',
      'ro': 'Î3: Ce informații sunt necesare pentru a adopta un animal?',
    },
    'foppilyj': {
      'en':
          'A: You will need to fill in a form with your personal information, details about your home and your experience with animals. This information helps us ensure that each animal ends up in a suitable environment.\n',
      'de':
          'A: Sie müssen ein Formular mit Ihren persönlichen Daten, Angaben zu Ihrem Zuhause und Ihren Erfahrungen mit Tieren ausfüllen. Diese Informationen helfen uns sicherzustellen, dass jedes Tier in einer geeigneten Umgebung landet.',
      'es':
          'R: Deberás completar un formulario con tu información personal, detalles sobre tu hogar y tu experiencia con los animales. Esta información nos ayuda a garantizar que cada animal acabe en un entorno adecuado.',
      'fr':
          'R : Vous devrez remplir un formulaire avec vos informations personnelles, des détails sur votre maison et votre expérience avec les animaux. Ces informations nous aident à garantir que chaque animal se retrouve dans un environnement adapté.',
      'hu':
          'V: Ki kell töltenie egy űrlapot személyes adataival, otthonával és állatokkal kapcsolatos tapasztalataival. Ez az információ segít abban, hogy minden állat megfelelő környezetbe kerüljön.',
      'ro':
          'R: Va trebui să completezi un formular cu informațiile tale personale, detalii despre casa ta și experiența ta cu animalele. Aceste informații ne ajută să ne asigurăm că fiecare animal ajunge într-un mediu adecvat.',
    },
    'lqbd0m6n': {
      'en': 'FAQ',
      'de': 'FAQ',
      'es': 'Preguntas más frecuentes',
      'fr': 'FAQ',
      'hu': 'GYIK',
      'ro': 'FAQ',
    },
  },
  // LostFound
  {
    '3jyf80hy': {
      'en': 'OnePaw',
      'de': 'Eine Pfote',
      'es': 'una pata',
      'fr': 'Une patte',
      'hu': 'OnePaw',
      'ro': 'OnePaw',
    },
    'z29w3ks4': {
      'en': 'Lost&Found',
      'de': 'Verloren gefunden',
      'es': 'Objetos perdidos y encontrados',
      'fr': 'Perdu trouvé',
      'hu': 'Lost&Found',
      'ro': 'Pierdut găsit',
    },
    '75z6unwr': {
      'en': 'Lost&Found',
      'de': 'Verloren gefunden',
      'es': 'Objetos perdidos y encontrados',
      'fr': 'Perdu trouvé',
      'hu': 'Lost&Found',
      'ro': 'Pierdut găsit',
    },
  },
  // Postpage
  {
    'g00xr2s2': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'hu': 'Megszünteti',
      'ro': 'Anulare',
    },
    'yqxr1tsr': {
      'en': 'Post',
      'de': 'Post',
      'es': 'Correo',
      'fr': 'Poste',
      'hu': 'Hozzászólás',
      'ro': 'Post',
    },
    '0uh66pzi': {
      'en': 'Details about the lost/found animal...',
      'de': 'Details zum verlorenen/gefundenen Tier...',
      'es': 'Detalles sobre el animal perdido/encontrado...',
      'fr': 'Détails sur l\'animal perdu/trouvé...',
      'hu': 'Részletek az elveszett/talált állatról...',
      'ro': 'Detalii despre animalul pierdut/găsit...',
    },
    'mbdtmc5y': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // LikePosts
  {
    'shdivf67': {
      'en': 'Post Likes',
      'de': 'Beitrag Likes',
      'es': 'Me gusta de la publicación',
      'fr': 'J\'aime les publications',
      'hu': 'Poszt kedvelések',
      'ro': 'Postați aprecieri',
    },
    'vk7n1h9o': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // Aboutus
  {
    'pg0yvhju': {
      'en': 'About OnePaw',
      'de': 'Über OnePaw',
      'es': 'Acerca de OnePaw',
      'fr': 'À propos de OnePaw',
      'hu': 'A OnePaw-ról',
      'ro': 'Despre OnePaw',
    },
    '1q5d1h1m': {
      'en': 'Our Mission',
      'de': 'Unsere Aufgabe',
      'es': 'Nuestra misión',
      'fr': 'Notre mission',
      'hu': 'Küldetésünk',
      'ro': 'Misiunea noastră',
    },
    'kww5v1l0': {
      'en':
          'OnePaw is dedicated to rescuing homeless and abandoned animals, primarily dogs and cats, from high-kill shelters and owners who can no longer care for them.',
      'de':
          'OnePaw widmet sich der Rettung heimatloser und ausgesetzter Tiere, vor allem Hunde und Katzen, aus Tierheimen mit hoher Tötungsrate und von Besitzern, die sich nicht länger um sie kümmern können.',
      'es':
          'OnePaw se dedica a rescatar animales abandonados y sin hogar, principalmente perros y gatos, de refugios donde se matan mucho y de dueños que ya no pueden cuidarlos.',
      'fr':
          'OnePaw se consacre au sauvetage des animaux sans abri et abandonnés, principalement des chiens et des chats, des refuges à forte mortalité et des propriétaires qui ne peuvent plus s\'en occuper.',
      'hu':
          'A OnePaw célja, hogy megmentse a hajléktalan és elhagyott állatokat, elsősorban a kutyákat és a macskákat, olyan menhelyekről, akik már nem tudnak gondoskodni róluk.',
      'ro':
          'OnePaw este dedicat salvării animalelor fără adăpost și abandonate, în primul rând câini și pisici, din adăposturile cu ucidere ridicată și proprietarii care nu mai pot avea grijă de ele.',
    },
    'bmmegd7u': {
      'en': 'What We Do',
      'de': 'Was wir tun',
      'es': 'Qué hacemos',
      'fr': 'Ce que nous faisons',
      'hu': 'Amit csinálunk',
      'ro': 'Ce facem',
    },
    '8x6l5644': {
      'en':
          'By working with a network of volunteer advocates, foster caregivers, local veterinarians, trainers, and shelters, we are providing the animals with loving temporary care, and finding them well-matched, carefully screened forever homes.',
      'de':
          'Durch die Zusammenarbeit mit einem Netzwerk aus ehrenamtlichen Fürsprechern, Pflegepersonen, örtlichen Tierärzten, Trainern und Tierheimen können wir den Tieren vorübergehend liebevolle Pflege bieten und für sie passende, sorgfältig ausgewählte Dauerheime finden.',
      'es':
          'Al trabajar con una red de defensores voluntarios, cuidadores de crianza, veterinarios locales, entrenadores y refugios, brindamos a los animales un cuidado temporal amoroso y les encontramos hogares permanentes bien adaptados y cuidadosamente seleccionados.',
      'fr':
          'En travaillant avec un réseau de défenseurs bénévoles, de familles d\'accueil, de vétérinaires locaux, de formateurs et de refuges, nous fournissons aux animaux des soins temporaires affectueux et leur trouvons des foyers permanents bien adaptés et soigneusement sélectionnés.',
      'hu':
          'Önkéntes jogvédők, nevelőszülők, helyi állatorvosok, oktatók és menhelyek hálózatával együttműködve szerető átmeneti gondozást biztosítunk az állatoknak, és jól illeszkedő, gondosan átvizsgált örök otthont találunk nekik.',
      'ro':
          'Lucrând cu o rețea de susținători voluntari, asistenți maternali, medici veterinari locali, instructori și adăposturi, le oferim animalelor îngrijire temporară iubitoare și le găsim case pentru totdeauna bine adaptate, atent controlate.',
    },
    '4ldne2la': {
      'en': 'Get Involved',
      'de': 'Machen Sie mit',
      'es': 'Involucrarse',
      'fr': 'Être impliqué',
      'hu': 'Részt venni',
      'ro': 'A se implica',
    },
    'kkc8woro': {
      'en':
          'We are always looking for volunteers and foster homes to help us in our mission. If you are interested in being a part of our community and making a difference, please reach out to us in Contact section',
      'de':
          'Wir sind immer auf der Suche nach Freiwilligen und Pflegefamilien, die uns bei unserer Mission unterstützen. Wenn Sie daran interessiert sind, Teil unserer Gemeinschaft zu sein und etwas zu bewirken, kontaktieren Sie uns bitte im Abschnitt „Kontakt“',
      'es':
          'Siempre estamos buscando voluntarios y hogares de acogida que nos ayuden en nuestra misión. Si está interesado en ser parte de nuestra comunidad y marcar la diferencia, comuníquese con nosotros en la sección de Contacto.',
      'fr':
          'Nous sommes toujours à la recherche de bénévoles et de familles d\'accueil pour nous aider dans notre mission. Si vous souhaitez faire partie de notre communauté et faire une différence, veuillez nous contacter dans la section Contact.',
      'hu':
          'Mindig keresünk önkénteseket és nevelőotthonokat, hogy segítsenek küldetésünkben. Ha szeretne közösségünk tagja lenni, és változást szeretne elérni, kérjük, lépjen kapcsolatba velünk a Kapcsolat menüpontban',
      'ro':
          'Căutăm mereu voluntari și case de plasament care să ne ajute în misiunea noastră. Dacă sunteți interesat să faceți parte din comunitatea noastră și să faceți o diferență, vă rugăm să ne contactați în secțiunea Contact',
    },
    'tcdj0gbn': {
      'en':
          'Follow us on social media to stay updated on our latest rescues and events!',
      'de':
          'Folgen Sie uns in den sozialen Medien, um über unsere neuesten Rettungsaktionen und Veranstaltungen auf dem Laufenden zu bleiben!',
      'es':
          '¡Síguenos en las redes sociales para mantenerte actualizado sobre nuestros últimos rescates y eventos!',
      'fr':
          'Suivez-nous sur les réseaux sociaux pour rester informé de nos derniers sauvetages et événements !',
      'hu':
          'Kövessen minket a közösségi médiában, hogy értesüljön legújabb mentéseinkről és eseményeinkről!',
      'ro':
          'Urmărește-ne pe rețelele sociale pentru a fi la curent cu ultimele noastre salvări și evenimente!',
    },
  },
  // PrivacePolicy
  {
    'hcs4u1ic': {
      'en': 'Privacy Policy',
      'de': 'Datenschutzrichtlinie',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
      'hu': 'Adatvédelmi irányelvek',
      'ro': 'Politica de confidențialitate',
    },
    'g1i0w4jv': {
      'en':
          'OnePaw (\'us\', \'we\', or \'our\') operates the OnePaw mobile application (hereinafter referred to as the \'Service\').',
      'de':
          'OnePaw („wir“, „uns“ oder „unser“) betreibt die mobile Anwendung OnePaw (nachfolgend als „Dienst“ bezeichnet).',
      'es':
          'OnePaw (\"nosotros\", \"nosotros\" o \"nuestro\") opera la aplicación móvil OnePaw (en adelante, el \"Servicio\").',
      'fr':
          'OnePaw (« nous », « notre » ou « notre ») exploite l\'application mobile OnePaw (ci-après dénommée le « Service »).',
      'hu':
          'A OnePaw („mi”, „mi” vagy „miénk”) üzemelteti a OnePaw mobilalkalmazást (a továbbiakban: „Szolgáltatás”).',
      'ro':
          'OnePaw („noi”, „noi” sau „nostru”) operează aplicația mobilă OnePaw (denumită în continuare „Serviciul”).',
    },
    '2fmvy1ju': {
      'en':
          'This page informs you of our policies regarding the collection, use, and disclosure of personal data when you use our Service and the choices you have associated with that data.',
      'de':
          'Auf dieser Seite erfahren Sie mehr über unsere Richtlinien im Hinblick auf die Erhebung, Verwendung und Weitergabe personenbezogener Daten bei der Nutzung unseres Dienstes sowie über die Auswahlmöglichkeiten, die Ihnen im Zusammenhang mit diesen Daten zur Verfügung stehen.',
      'es':
          'Esta página le informa sobre nuestras políticas con respecto a la recopilación, uso y divulgación de datos personales cuando utiliza nuestro Servicio y las opciones que tiene asociadas con esos datos.',
      'fr':
          'Cette page vous informe de nos politiques concernant la collecte, l\'utilisation et la divulgation de données personnelles lorsque vous utilisez notre Service et des choix que vous avez associés à ces données.',
      'hu':
          'Ez az oldal tájékoztatja Önt a személyes adatok gyűjtésére, felhasználására és közzétételére vonatkozó irányelveinkről, amikor Ön Szolgáltatásunkat használja, valamint az adatokkal kapcsolatos választási lehetőségekről.',
      'ro':
          'Această pagină vă informează despre politicile noastre privind colectarea, utilizarea și dezvăluirea datelor cu caracter personal atunci când utilizați Serviciul nostru și opțiunile pe care le-ați asociat cu datele respective.',
    },
    '77isb2w5': {
      'en':
          'We use your data to provide and improve the Service. By using the Service, you agree to the collection and use of information in accordance with this policy.',
      'de':
          'Wir verwenden Ihre Daten, um den Service bereitzustellen und zu verbessern. Durch die Nutzung des Service stimmen Sie der Erfassung und Verwendung von Informationen gemäß dieser Richtlinie zu.',
      'es':
          'Utilizamos sus datos para proporcionar y mejorar el Servicio. Al utilizar el Servicio, usted acepta la recopilación y el uso de información de acuerdo con esta política.',
      'fr':
          'Nous utilisons vos données pour fournir et améliorer le Service. En utilisant le Service, vous acceptez la collecte et l\'utilisation d\'informations conformément à cette politique.',
      'hu':
          'Adatait a Szolgáltatás biztosítására és fejlesztésére használjuk. A Szolgáltatás használatával Ön beleegyezik az információk gyűjtéséhez és felhasználásához a jelen szabályzatnak megfelelően.',
      'ro':
          'Utilizăm datele dumneavoastră pentru a furniza și îmbunătăți Serviciul. Prin utilizarea Serviciului, sunteți de acord cu colectarea și utilizarea informațiilor în conformitate cu această politică.',
    },
    '2i8cvgq9': {
      'en': 'Information Collection And Use',
      'de': 'Erfassung und Verwendung von Informationen',
      'es': 'Recopilación y uso de información',
      'fr': 'Collecte et utilisation des informations',
      'hu': 'Információgyűjtés és felhasználás',
      'ro': 'Colectarea și utilizarea informațiilor',
    },
    'bfz622wu': {
      'en':
          'We collect several different types of information for various purposes to provide and improve our Service to you.',
      'de':
          'Wir erfassen verschiedene Arten von Informationen für unterschiedliche Zwecke, um Ihnen unseren Service bereitzustellen und zu verbessern.',
      'es':
          'Recopilamos varios tipos diferentes de información para diversos fines para brindarle y mejorar nuestro Servicio.',
      'fr':
          'Nous collectons plusieurs types d\'informations différents à diverses fins afin de vous fournir et d\'améliorer notre service.',
      'hu':
          'Számos különböző típusú információt gyűjtünk különböző célokból, hogy szolgáltatásunkat nyújthassuk és javítsuk Önnek.',
      'ro':
          'Colectăm mai multe tipuri diferite de informații în diverse scopuri pentru a vă oferi și îmbunătăți Serviciul nostru.',
    },
    'l66m6om4': {
      'en': 'Types of Data Collected',
      'de': 'Arten der erfassten Daten',
      'es': 'Tipos de datos recopilados',
      'fr': 'Types de données collectées',
      'hu': 'Az összegyűjtött adatok típusai',
      'ro': 'Tipuri de date colectate',
    },
    '70dlobjr': {
      'en': 'Personal Data',
      'de': 'Persönliche Daten',
      'es': 'Información personal',
      'fr': 'Données personnelles',
      'hu': 'Személyes adatok',
      'ro': 'Date personale',
    },
    '70q1uzy9': {
      'en':
          'While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you (\'Personal Data\'). Personally identifiable information may include, but is not limited to:',
      'de':
          'Während Sie unseren Service nutzen, bitten wir Sie möglicherweise, uns bestimmte personenbezogene Daten zur Verfügung zu stellen, die dazu verwendet werden können, Sie zu kontaktieren oder zu identifizieren („personenbezogene Daten“). Zu den personenbezogenen Daten können unter anderem gehören:',
      'es':
          'Mientras utiliza nuestro Servicio, es posible que le solicitemos que nos proporcione cierta información de identificación personal que pueda usarse para contactarlo o identificarlo (\'Datos personales\'). La información de identificación personal puede incluir, entre otras:',
      'fr':
          'Lors de l\'utilisation de notre Service, nous pouvons vous demander de nous fournir certaines informations personnelles identifiables qui peuvent être utilisées pour vous contacter ou vous identifier (« Données personnelles »). Les informations personnelles identifiables peuvent inclure, sans s’y limiter :',
      'hu':
          'Szolgáltatásunk használata során megkérhetjük Önt, hogy adjon meg bizonyos, személyazonosításra alkalmas adatokat, amelyek segítségével kapcsolatba léphetünk Önnel vagy azonosíthatjuk Önt („Személyes adatok”). A személyazonosításra alkalmas adatok magukban foglalhatják, de nem kizárólagosan:',
      'ro':
          'În timpul utilizării Serviciului nostru, este posibil să vă cerem să ne furnizați anumite informații de identificare personală care pot fi folosite pentru a vă contacta sau a vă identifica („Date cu caracter personal”). Informațiile de identificare personală pot include, dar nu se limitează la:',
    },
    'w0oqcuvs': {
      'en': '- Email address',
      'de': '- E-Mail-Adresse',
      'es': '- Dirección de correo electrónico',
      'fr': '- Adresse e-mail',
      'hu': '- Email cím',
      'ro': '- Adresa de e-mail',
    },
    'dgr4csgl': {
      'en': '- First name and last name',
      'de': '- Vorname und Nachname',
      'es': '- Nombre y apellido',
      'fr': '- Prénom et nom',
      'hu': '- Utó- és vezetéknév',
      'ro': '- Primul nume si ultimul nume',
    },
    'xqz62prv': {
      'en': '- Phone number',
      'de': '- Telefonnummer',
      'es': '- Número de teléfono',
      'fr': '- Numéro de téléphone',
      'hu': '- Telefonszám',
      'ro': '- Număr de telefon',
    },
    'mn12fqwr': {
      'en': '- Address, State, Province, ZIP/Postal code, City',
      'de': '- Adresse, Staat, Provinz, Postleitzahl, Stadt',
      'es': '- Dirección, Estado, Provincia, Código Postal, Ciudad',
      'fr': '- Adresse, État, Province, Code postal, Ville',
      'hu': '- Cím, állam, tartomány, irányítószám, város',
      'ro': '- Adresă, stat, provincie, poștal/cod poștal, oraș',
    },
    'l8smlgyr': {
      'en': '- Cookies and Usage Data',
      'de': '- Cookies und Nutzungsdaten',
      'es': '- Cookies y datos de uso',
      'fr': '- Cookies et données d\'utilisation',
      'hu': '- Cookie-k és használati adatok',
      'ro': '- Cookie-uri și date de utilizare',
    },
    'ryu3tmco': {
      'en': 'Usage Data',
      'de': 'Nutzungsdaten',
      'es': 'Datos de uso',
      'fr': 'Des données d\'utilisation',
      'hu': 'Használati adatok',
      'ro': 'Date de utilizare',
    },
    'dkjalaw7': {
      'en':
          'We may also collect information that your browser sends whenever you visit our Service or when you access the Service by or through a mobile device (\'Usage Data\').',
      'de':
          'Wir können außerdem Informationen erfassen, die Ihr Browser sendet, wenn Sie unseren Dienst besuchen oder wenn Sie von oder über ein mobiles Gerät auf den Dienst zugreifen („Nutzungsdaten“).',
      'es':
          'También podemos recopilar información que su navegador envía cada vez que visita nuestro Servicio o cuando accede al Servicio mediante un dispositivo móvil (\'Datos de uso\').',
      'fr':
          'Nous pouvons également collecter des informations que votre navigateur envoie chaque fois que vous visitez notre Service ou lorsque vous accédez au Service via ou via un appareil mobile (« Données d\'utilisation »).',
      'hu':
          'Olyan információkat is gyűjthetünk, amelyeket böngészője küld, amikor felkeresi Szolgáltatásunkat, vagy amikor mobileszközről vagy mobileszközön keresztül hozzáfér a Szolgáltatáshoz („Használati adatok”).',
      'ro':
          'De asemenea, putem colecta informații pe care browserul dvs. le trimite ori de câte ori vizitați Serviciul nostru sau când accesați Serviciul prin sau printr-un dispozitiv mobil („Datele de utilizare”).',
    },
    's11cmyrn': {
      'en': 'Use of Data',
      'de': 'Verwendung von Daten',
      'es': 'Uso de datos',
      'fr': 'Utilisation des données',
      'hu': 'Az adatok használata',
      'ro': 'Utilizarea Datelor',
    },
    'wm5vzhbx': {
      'en': 'OnePaw uses the collected data for various purposes:',
      'de': 'OnePaw nutzt die gesammelten Daten für verschiedene Zwecke:',
      'es': 'OnePaw utiliza los datos recopilados para diversos fines:',
      'fr': 'OnePaw utilise les données collectées à diverses fins :',
      'hu':
          'A OnePaw az összegyűjtött adatokat különböző célokra használja fel:',
      'ro': 'OnePaw folosește datele colectate în diverse scopuri:',
    },
    'rcgq7xli': {
      'en': '- To provide and maintain the Service',
      'de': '- Zur Bereitstellung und Aufrechterhaltung des Dienstes',
      'es': '- Proporcionar y mantener el Servicio.',
      'fr': '- Fournir et maintenir le Service',
      'hu': '- A Szolgáltatás nyújtása és karbantartása',
      'ro': '- Pentru a furniza și întreține Serviciul',
    },
    'v3xuqv5q': {
      'en': '- To notify you about changes to our Service',
      'de': '- Um Sie über Änderungen an unserem Service zu informieren',
      'es': '- Para notificarle sobre cambios en nuestro Servicio',
      'fr': '- Pour vous avertir des changements de notre service',
      'hu': '- Tájékoztatjuk szolgáltatásunk változásairól',
      'ro':
          '- Pentru a vă informa cu privire la modificările aduse Serviciului nostru',
    },
    'xxhj69rl': {
      'en':
          '- To allow you to participate in interactive features of our Service when you choose to do so',
      'de':
          '- Um Ihnen die Teilnahme an interaktiven Funktionen unseres Dienstes zu ermöglichen, wenn Sie dies wünschen',
      'es':
          '- Para permitirle participar en funciones interactivas de nuestro Servicio cuando usted elija hacerlo',
      'fr':
          '- Pour vous permettre de participer aux fonctionnalités interactives de notre Service lorsque vous choisissez de le faire',
      'hu':
          '- Annak lehetővé tétele, hogy Ön részt vegyen Szolgáltatásunk interaktív funkcióiban, amikor úgy dönt',
      'ro':
          '- Pentru a vă permite să participați la funcțiile interactive ale Serviciului nostru atunci când alegeți să faceți acest lucru',
    },
    '12qebp6p': {
      'en': '- To provide customer care and support',
      'de': '- Um Kundenbetreuung und Support zu bieten',
      'es': '- Proporcionar atención y soporte al cliente.',
      'fr': '- Assurer le suivi et le support client',
      'hu': '- Ügyfélszolgálat és támogatás biztosítása',
      'ro': '- Pentru a oferi asistență și asistență clienților',
    },
    'ww9lby9q': {
      'en':
          '- To provide analysis or valuable information so that we can improve the Service',
      'de':
          '- Um Analysen oder wertvolle Informationen bereitzustellen, damit wir den Service verbessern können',
      'es':
          '- Para proporcionar análisis o información valiosa para que podamos mejorar el Servicio',
      'fr':
          '- Pour fournir des analyses ou des informations précieuses afin que nous puissions améliorer le Service',
      'hu':
          '- Elemzések vagy értékes információk nyújtása a Szolgáltatás javítása érdekében',
      'ro':
          '- Pentru a furniza analize sau informații valoroase, astfel încât să putem îmbunătăți Serviciul',
    },
    'sihht7qk': {
      'en': '- To monitor the usage of the Service',
      'de': '- Um die Nutzung des Dienstes zu überwachen',
      'es': '- Para monitorear el uso del Servicio',
      'fr': '- Pour surveiller l\'utilisation du Service',
      'hu': '- A Szolgáltatás használatának figyelemmel kísérésére',
      'ro': '- Pentru a monitoriza utilizarea Serviciului',
    },
    '818v2p9q': {
      'en': '- To detect, prevent and address technical issues',
      'de':
          '- Um technische Probleme zu erkennen, zu verhindern und zu beheben',
      'es': '- Detectar, prevenir y abordar problemas técnicos.',
      'fr': '- Détecter, prévenir et résoudre les problèmes techniques',
      'hu': '- Technikai problémák észlelése, megelőzése és kezelése',
      'ro': '- Pentru a detecta, preveni și aborda probleme tehnice',
    },
    '3r9qjhks': {
      'en': 'Transfer Of Data',
      'de': 'Übertragung von Daten',
      'es': 'Transferencia de datos',
      'fr': 'Transfert de données',
      'hu': 'Adatátvitel',
      'ro': 'Transfer de date',
    },
    'mac0aaeg': {
      'en':
          'Your information, including Personal Data, may be transferred to — and maintained on — computers located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from your jurisdiction.',
      'de':
          'Ihre Informationen, einschließlich personenbezogener Daten, können auf Computer übertragen – und dort gespeichert – werden, die sich außerhalb Ihres Staates, Ihrer Provinz, Ihres Landes oder einer sonstigen Gerichtsbarkeit befinden, wo möglicherweise andere Datenschutzgesetze als in Ihrer Gerichtsbarkeit gelten.',
      'es':
          'Su información, incluidos los Datos personales, puede transferirse y mantenerse en computadoras ubicadas fuera de su estado, provincia, país u otra jurisdicción gubernamental donde las leyes de protección de datos pueden diferir de las de su jurisdicción.',
      'fr':
          'Vos informations, y compris vos données personnelles, peuvent être transférées et conservées sur des ordinateurs situés en dehors de votre état, province, pays ou autre juridiction gouvernementale où les lois sur la protection des données peuvent différer de celles de votre juridiction.',
      'hu':
          'Az Ön adatait, beleértve a személyes adatokat is, át lehet küldeni – és azokon tárolni – az Ön államán, tartományán, országán vagy egyéb kormányzati joghatóságán kívül található számítógépeken, ahol az adatvédelmi törvények eltérhetnek az Ön joghatóságának hatályától.',
      'ro':
          'Informațiile dvs., inclusiv Datele personale, pot fi transferate și păstrate pe computere situate în afara statului, provinciei, țării sau a altei jurisdicții guvernamentale în care legile privind protecția datelor pot diferi de cele din jurisdicția dvs.',
    },
    '57dgfp7p': {
      'en':
          'Your consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer.',
      'de':
          'Ihre Zustimmung zu dieser Datenschutzrichtlinie und die anschließende Übermittlung dieser Informationen stellt Ihre Zustimmung zu dieser Übertragung dar.',
      'es':
          'Su consentimiento a esta Política de Privacidad seguido del envío de dicha información representa su aceptación de esa transferencia.',
      'fr':
          'Votre consentement à cette politique de confidentialité suivi de la soumission de ces informations représente votre accord à ce transfert.',
      'hu':
          'Az Ön hozzájárulása a jelen Adatvédelmi szabályzathoz, majd az ilyen információk benyújtása az átadáshoz való hozzájárulását jelenti.',
      'ro':
          'Consimțământul dumneavoastră cu privire la această Politică de confidențialitate, urmat de transmiterea de către dumneavoastră a unor astfel de informații, reprezintă acordul dumneavoastră cu privire la acest transfer.',
    },
    'cx69invv': {
      'en':
          'OnePaw will take all steps reasonably necessary to ensure that your data is treated securely and in accordance with this Privacy Policy and no transfer of your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of your data and other personal information.',
      'de':
          'OnePaw wird alle angemessenen Schritte unternehmen, um sicherzustellen, dass Ihre Daten sicher und in Übereinstimmung mit dieser Datenschutzrichtlinie behandelt werden. Zudem wird Ihre personenbezogenen Daten nicht an Organisationen oder in Länder übertragen, bei denen keine angemessenen Kontrollmechanismen zum Schutz Ihrer Daten und sonstigen personenbezogenen Informationen vorhanden sind.',
      'es':
          'OnePaw tomará todas las medidas razonablemente necesarias para garantizar que sus datos sean tratados de forma segura y de acuerdo con esta Política de Privacidad y no se realizará ninguna transferencia de sus Datos Personales a una organización o país a menos que existan controles adecuados establecidos, incluida la seguridad de su datos y otra información personal.',
      'fr':
          'OnePaw prendra toutes les mesures raisonnablement nécessaires pour garantir que vos données sont traitées de manière sécurisée et conformément à la présente politique de confidentialité et aucun transfert de vos données personnelles n\'aura lieu vers une organisation ou un pays à moins que des contrôles adéquats soient en place, y compris la sécurité de votre données et autres informations personnelles.',
      'hu':
          'A OnePaw minden ésszerűen szükséges lépést megtesz annak biztosítására, hogy az Ön adatait biztonságosan és a jelen Adatvédelmi Szabályzattal összhangban kezeljék, és az Ön személyes adatait ne továbbítsák szervezetnek vagy országnak, kivéve, ha megfelelő ellenőrzések vannak érvényben, beleértve az Ön adatainak biztonságát. adatok és egyéb személyes adatok.',
      'ro':
          'OnePaw va lua toate măsurile rezonabile necesare pentru a se asigura că datele dumneavoastră sunt tratate în siguranță și în conformitate cu această Politică de confidențialitate și niciun transfer al datelor dumneavoastră cu caracter personal nu va avea loc către o organizație sau o țară decât dacă există controale adecvate, inclusiv securitatea dumneavoastră. date și alte informații personale.',
    },
    '7b0h39lt': {
      'en': 'Disclosure Of Data',
      'de': 'Offenlegung von Daten',
      'es': 'Divulgación de datos',
      'fr': 'Divulgation des données',
      'hu': 'Adatok közzététele',
      'ro': 'Dezvăluirea datelor',
    },
    '4mgf8e9l': {
      'en': 'Legal Requirements',
      'de': 'Rechtliche Anforderungen',
      'es': 'Requerimientos legales',
      'fr': 'Exigences légales',
      'hu': 'Jogi követelmények',
      'ro': 'Cerinte legale',
    },
    'etl6k0ow': {
      'en':
          'OnePaw may disclose your Personal Data in the good faith belief that such action is necessary to:',
      'de':
          'OnePaw kann Ihre personenbezogenen Daten in dem guten Glauben offenlegen, dass dies zur Erreichung der folgenden Ziele erforderlich ist:',
      'es':
          'OnePaw puede divulgar sus Datos personales de buena fe cuando considere que dicha acción es necesaria para:',
      'fr':
          'OnePaw peut divulguer vos données personnelles en croyant de bonne foi qu\'une telle action est nécessaire pour :',
      'hu':
          'A OnePaw nyilvánosságra hozhatja az Ön személyes adatait abban a jóhiszeműségben, hogy az ilyen intézkedés szükséges:',
      'ro':
          'OnePaw poate dezvălui datele dumneavoastră cu caracter personal cu bună-credință că o astfel de acțiune este necesară pentru:',
    },
    'brfczmii': {
      'en': '- To comply with a legal obligation',
      'de': '- Zur Erfüllung einer rechtlichen Verpflichtung',
      'es': '- Para cumplir con una obligación legal',
      'fr': '- Pour respecter une obligation légale',
      'hu': '- Törvényi kötelezettségnek eleget tenni',
      'ro': '- Pentru a respecta o obligație legală',
    },
    'amwtub3l': {
      'en': '- To protect and defend the rights or property of OnePaw',
      'de':
          '- Zum Schutz und zur Verteidigung der Rechte oder des Eigentums von OnePaw',
      'es': '- Para proteger y defender los derechos o propiedad de OnePaw',
      'fr': '- Pour protéger et défendre les droits ou la propriété de OnePaw',
      'hu': '- A OnePaw jogainak vagy tulajdonának védelme és védelme',
      'ro': '- Pentru a proteja și a apăra drepturile sau proprietatea OnePaw',
    },
    'hi574szl': {
      'en':
          '- To prevent or investigate possible wrongdoing in connection with the Service',
      'de':
          '- Um mögliches Fehlverhalten im Zusammenhang mit dem Service zu verhindern oder zu untersuchen',
      'es':
          '- Para prevenir o investigar posibles irregularidades en relación con el Servicio',
      'fr':
          '- Pour prévenir ou enquêter sur d\'éventuels actes répréhensibles en relation avec le Service',
      'hu':
          '- A Szolgáltatással kapcsolatos esetleges jogsértések megelőzése vagy kivizsgálása',
      'ro':
          '- Pentru a preveni sau a investiga posibile abateri în legătură cu Serviciul',
    },
    't6m7eqef': {
      'en':
          '- To protect the personal safety of users of the Service or the public',
      'de':
          '- Zum Schutz der persönlichen Sicherheit der Nutzer des Dienstes oder der Öffentlichkeit',
      'es':
          '- Para proteger la seguridad personal de los usuarios del Servicio o del público.',
      'fr':
          '- Pour protéger la sécurité personnelle des utilisateurs du Service ou du public',
      'hu':
          '- A Szolgáltatást igénybe vevők vagy a lakosság személyes biztonságának védelme érdekében',
      'ro':
          '- Pentru a proteja siguranța personală a utilizatorilor Serviciului sau a publicului',
    },
    'zbf047sr': {
      'en': '- To protect against legal liability',
      'de': '- Zum Schutz vor gesetzlicher Haftung',
      'es': '- Para proteger contra responsabilidad legal',
      'fr': '- Pour se prémunir contre la responsabilité légale',
      'hu': '- Védelem a jogi felelősséggel szemben',
      'ro': '- Pentru a proteja împotriva răspunderii legale',
    },
  },
  // Termsconditions
  {
    '0e7skw6s': {
      'en': 'Terms and Conditions',
      'de': 'Geschäftsbedingungen',
      'es': 'Términos y condiciones',
      'fr': 'Termes et conditions',
      'hu': 'Felhasználási feltételek',
      'ro': 'Termeni și condiții',
    },
    'eewkszu6': {
      'en':
          'INTRODUCTION\n\nWelcome to OnePaw! These Terms and Conditions of Use (hereinafter referred to as \"Terms\") govern your use of our website and services. By accessing or using our website, you agree to comply with and be bound by these Terms. If you do not agree to these Terms, please do not use our website.\n\nACCEPTANCE OF TERMS\n\nBy accessing or using the OnePaw website, you agree to be legally bound by these Terms, including all amendments, modifications, and additional policies published on our website. If you do not agree to these Terms, you must discontinue use of our website immediately.\n\n MODIFICATION OF TERMS\n\nOnePaw reserves the right to modify these Terms at any time. We will notify you of any changes by posting the updated Terms on our website. Your continued use of the website after the posting of changes constitutes your acceptance of the modified Terms.\n\nACCOUNT REGISTRATION\n\nTo access certain features of our website, you may need to register for an account. You agree to provide accurate, current, and complete information during the registration process and to update such information as necessary. You are responsible for safeguarding your account password and for any activities or actions under your account.\n\nUSER CONDUCT\n\nYou agree not to engage in any of the following prohibited activities:\n\n- Violating any applicable laws or regulations.\n- Infringing on the rights of others, including intellectual property rights.\n- Engaging in any activity that is harmful, fraudulent, or deceptive.\n- Interfering with the operation of our website or the servers and networks used to make the website available.\n- Uploading or transmitting any viruses or other malicious code.\n\nINTELLECTUAL PROPRIETY\n\nAll content on the OnePaw website, including but not limited to text, graphics, logos, images, and software, is the property of OnePaw or its licensors and is protected by intellectual property laws. You may not use, reproduce, distribute, or create derivative works of any content without our prior written permission.\n\nTHIRD-PARTY LINKS\n\nOur website may contain links to third-party websites. These links are provided for your convenience and do not signify endorsement by OnePaw. We have no control over the content or practices of these third-party websites and accept no responsibility for them. Your use of third-party websites is at your own risk.\n\n  DISCLAIMERS\n\nThe OnePaw website is provided on an \"as-is\" and \"as-available\" basis. We make no warranties, express or implied, regarding the website, including but not limited to warranties of merchantability, fitness for a particular purpose, or non-infringement. We do not warrant that the website will be uninterrupted, secure, or error-free.\n\nLIMITATION OF LIABILITY\n\nTo the fullest extent permitted by law, OnePaw shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses, resulting from:\n\n- Your use of or inability to\n\nuse the OnePaw website;\n- Any unauthorized access to or use of our servers and/or any personal information stored therein;\n- Any interruption or cessation of transmission to or from our website;\n- Any bugs, viruses, trojan horses, or the like that may be transmitted to or through our website by any third party;\n- Any errors or omissions in any content or for any loss or damage incurred as a result of the use of any content posted, emailed, transmitted, or otherwise made available through the OnePaw website.\n\nIDEMNIFICATION\n\nYou agree to indemnify, defend, and hold harmless OnePaw, its officers, directors, employees, agents, and affiliates from and against any and all claims, liabilities, damages, losses, costs, and expenses (including reasonable attorney\'s fees) arising out of or in any way connected with:\n\n- Your access to or use of the OnePaw website;\n- Your violation of these Terms;\n- Your violation of any rights of another party, including any intellectual property rights;\n- Your breach of any applicable laws.\n\n   SEVERABILITY\n\nIf any provision of these Terms is deemed unlawful, void, or for any reason unenforceable, then that provision shall be deemed severable from these Terms and shall not affect the validity and enforceability of any remaining provisions.\n\n  TERMINATION\n\nOnePaw reserves the right, in its sole discretion, to terminate your access to all or part of the OnePaw website, with or without notice, for any reason, including without limitation, breach of these Terms. Upon termination, you must immediately cease all use of the website and destroy any downloaded or printed materials from the website.\n\nENTIRE AGREEMENT\n\nThese Terms constitute the entire agreement between you and OnePaw regarding your use of the website and supersede all prior and contemporaneous understandings, agreements, representations, and warranties, both written and oral, regarding the website.\n\nCONTACT INFORMATION\n\nIf you have any questions about these Terms, please contact us at:\n\nOnePaw    \nonepaw.help@outlook.com  \n+40 770 107 700  \n\nSPECIFIC TERMS AND CONDITIONS FOR SERVICE\n\nUSER-GENERATED CONTENT\n\nOnePaw may allow users to submit, post, or share content, including but not limited to text, images, and videos (\"User Content\"). By submitting User Content, you grant OnePaw a worldwide, non-exclusive, royalty-free, perpetual, irrevocable, and fully sublicensable right to use, reproduce, modify, adapt, publish, translate, create derivative works from, distribute, and display such content in any media. You represent and warrant that you own or have the necessary rights to submit the User Content and that the content does not infringe on any third-party rights.\n\nCOMMUNITY GUIDELINES\nWhile using the OnePaw website and services, you agree to adhere to our Community Guidelines, which include but are not limited to:\n\n- Respectful communication with other users and OnePaw staff.\n- Prohibition of harassment, hate speech, and discriminatory behavior.\n- Prohibition of sharing false or misleading information.\n\nREPORTING VIOLATIONS\n\nIf you become aware of any violation of these Terms or our Community Guidelines, please report it to us immediately using the contact information provided.\n\n\nUPDATES AND CHANGINS OF SERVICES\n\nOnePaw reserves the right to modify or discontinue, temporarily or permanently, the services provided on the website, with or without notice. You agree that OnePaw shall not be liable to you or to any third party for any modification, suspension, or discontinuance of services.\n\nFEEDBACK AND SUGGESTIONS\n\nIf you provide OnePaw with any feedback or suggestions regarding the website or services (\"Feedback\"), you hereby assign to OnePaw all rights in such Feedback and agree that OnePaw shall have the right to use and fully exploit such Feedback and related information in any manner it deems appropriate. OnePaw will treat any Feedback you provide as non-confidential and non-proprietary.\n\n  WAIVER\n\nNo waiver of any term or condition set forth in these Terms shall be deemed a further or continuing waiver of such term or condition or a waiver of any other term or condition, and any failure of OnePaw to assert a right or provision under these Terms shall not constitute a waiver of such right or provision.\n\nNOTICES\n\nOnePaw may provide you with notices, including those regarding changes to these Terms, by email, regular mail, or postings on the website.\n\n\n\nBy using the OnePaw website, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions of Use. If you do not agree with these Terms, please do not use the OnePaw website. Thank you for using OnePaw.',
      'de':
          'EINFÜHRUNG\n\nWillkommen bei OnePaw! Diese Nutzungsbedingungen (im Folgenden „Bedingungen“ genannt) regeln Ihre Nutzung unserer Website und Dienste. Indem Sie auf unsere Website zugreifen oder sie nutzen, erklären Sie sich damit einverstanden, diese Bedingungen einzuhalten und an sie gebunden zu sein. Wenn Sie diesen Bedingungen nicht zustimmen, nutzen Sie unsere Website bitte nicht.\n\nANNAHME DER BEDINGUNGEN\n\nIndem Sie auf die OnePaw-Website zugreifen oder sie nutzen, erklären Sie sich damit einverstanden, rechtlich an diese Bedingungen gebunden zu sein, einschließlich aller auf unserer Website veröffentlichten Ergänzungen, Änderungen und zusätzlichen Richtlinien. Wenn Sie diesen Bedingungen nicht zustimmen, müssen Sie die Nutzung unserer Website sofort einstellen.\n\nÄNDERUNG DER BEDINGUNGEN\n\nOnePaw behält sich das Recht vor, diese Bedingungen jederzeit zu ändern. Wir werden Sie über alle Änderungen informieren, indem wir die aktualisierten Bedingungen auf unserer Website veröffentlichen. Ihre fortgesetzte Nutzung der Website nach der Veröffentlichung der Änderungen gilt als Ihre Zustimmung zu den geänderten Bedingungen.\n\nKONTOREGISTRIERUNG\n\nUm auf bestimmte Funktionen unserer Website zugreifen zu können, müssen Sie sich möglicherweise für ein Konto registrieren. Sie verpflichten sich, während des Registrierungsvorgangs genaue, aktuelle und vollständige Informationen anzugeben und diese Informationen bei Bedarf zu aktualisieren. Sie sind für den Schutz Ihres Kontopassworts und für alle Aktivitäten oder Aktionen unter Ihrem Konto verantwortlich.\n\nBENUTZERVERHALTEN\n\nSie verpflichten sich, keine der folgenden verbotenen Aktivitäten durchzuführen:\n\n- Verstoß gegen geltende Gesetze oder Vorschriften.\n- Verletzung der Rechte anderer, einschließlich geistiger Eigentumsrechte.\n- Teilnahme an Aktivitäten, die schädlich, betrügerisch oder irreführend sind.\n- Störung des Betriebs unserer Website oder der Server und Netzwerke, die zur Bereitstellung der Website verwendet werden.\n- Hochladen oder Übertragen von Viren oder anderem Schadcode.\n\nGEISTIGES EIGENTUM\n\nAlle Inhalte auf der OnePaw-Website, einschließlich, aber nicht beschränkt auf Text, Grafiken, Logos, Bilder und Software, sind Eigentum von OnePaw oder seinen Lizenzgebern und durch Gesetze zum Schutz geistigen Eigentums geschützt. Sie dürfen ohne unsere vorherige schriftliche Genehmigung keine Inhalte verwenden, reproduzieren, verteilen oder abgeleitete Werke davon erstellen.\n\nLINKS VON DRITTANBIETERN\n\nUnsere Website kann Links zu Websites von Drittanbietern enthalten. Diese Links dienen Ihrer Bequemlichkeit und stellen keine Billigung durch OnePaw dar. Wir haben keine Kontrolle über die Inhalte oder Praktiken dieser Websites von Drittanbietern und übernehmen keine Verantwortung dafür. Ihre Nutzung von Websites von Drittanbietern erfolgt auf Ihr eigenes Risiko.\n\nHAFTUNGSAUSSCHLÜSSE\n\nDie OnePaw-Website wird „wie besehen“ und „wie verfügbar“ bereitgestellt. Wir übernehmen keine ausdrücklichen oder stillschweigenden Garantien in Bezug auf die Website, einschließlich, aber nicht beschränkt auf Garantien für Marktgängigkeit, Eignung für einen bestimmten Zweck oder Nichtverletzung. Wir garantieren nicht, dass die Website ununterbrochen, sicher oder fehlerfrei ist.\n\nHAFTUNGSBESCHRÄNKUNG\n\nSoweit gesetzlich zulässig, haftet OnePaw nicht für indirekte, zufällige, besondere, Folge- oder Strafschäden oder entgangene Gewinne oder Einnahmen, egal ob direkt oder indirekt, oder für Datenverluste, Nutzungsverluste, Verlust von Geschäftswert oder andere immaterielle Verluste, die sich aus Folgendem ergeben:\n\n- Ihrer Nutzung oder Unfähigkeit zur\n\nNutzung der OnePaw-Website;\n\n- jeglichem unbefugten Zugriff auf oder der unbefugten Nutzung unserer Server und/oder der dort gespeicherten persönlichen Daten;\n\n- jeglicher Unterbrechung oder Einstellung der Übertragung zu oder von unserer Website;\n\n- jeglichen Bugs, Viren, Trojanern oder dergleichen, die von Dritten an oder über unsere Website übertragen werden können;\n\n- jeglichen Fehlern oder Auslassungen in jeglichen Inhalten oder für jeglichen Verlust oder Schaden, der durch die Nutzung von Inhalten entsteht, die gepostet, per E-Mail gesendet, übertragen oder anderweitig über die OnePaw-Website verfügbar gemacht werden.\n\nSCHADENSERSATZ\n\nSie erklären sich damit einverstanden, OnePaw, seine leitenden Angestellten, Direktoren, Mitarbeiter, Vertreter und verbundenen Unternehmen von allen Ansprüchen, Verbindlichkeiten, Schäden, Verlusten, Kosten und Ausgaben (einschließlich angemessener Anwaltskosten) freizustellen und schadlos zu halten, die aus Folgendem entstehen oder in irgendeiner Weise damit in Zusammenhang stehen:\n\n- Ihr Zugriff auf oder Ihre Nutzung der OnePaw-Website;\n- Ihr Verstoß gegen diese Bedingungen;\n- Ihr Verstoß gegen Rechte einer anderen Partei, einschließlich geistiger Eigentumsrechte;\n- Ihr Verstoß gegen geltende Gesetze.\n\nTRENNBARKEIT\n\nWenn eine Bestimmung dieser Bedingungen als rechtswidrig, ungültig oder aus irgendeinem Grund nicht durchsetzbar erachtet wird, gilt diese Bestimmung als von diesen Bedingungen trennbar und hat keinen Einfluss auf die Gültigkeit und Durchsetzbarkeit aller verbleibenden Bestimmungen.\n\nKÜNDIGUNG\n\nOnePaw behält sich das Recht vor, nach eigenem Ermessen Ihren Zugriff auf die gesamte oder einen Teil der OnePaw-Website mit oder ohne Vorankündigung aus irgendeinem Grund zu kündigen, einschließlich, aber nicht beschränkt auf, Verstoß gegen diese Bedingungen. Nach der Kündigung müssen Sie die Nutzung der Website sofort einstellen und alle heruntergeladenen oder gedruckten Materialien von der Website vernichten.\n\nGESAMTE VEREINBARUNG\n\nDiese Bedingungen stellen die gesamte Vereinbarung zwischen Ihnen und OnePaw bezüglich Ihrer Nutzung der Website dar und ersetzen alle vorherigen und gleichzeitigen Absprachen, Vereinbarungen, Zusicherungen und Garantien, sowohl schriftlich als auch mündlich, bezüglich der Website.\n\nKONTAKTINFORMATIONEN\n\nWenn Sie Fragen zu diesen Bedingungen haben, kontaktieren Sie uns bitte unter:\n\nOnePaw \nonepaw.help@outlook.com \n+40 770 107 700 \n\nSPEZIFISCHE GESCHÄFTSBEDINGUNGEN FÜR DEN SERVICE\n\nVON BENUTZERN GENERIERTE INHALTE\n\nOnePaw kann Benutzern gestatten, Inhalte, einschließlich, aber nicht beschränkt auf Texte, Bilder und Videos („Benutzerinhalte“), einzureichen, zu veröffentlichen oder zu teilen. Durch das Einreichen von Benutzerinhalten gewähren Sie OnePaw ein weltweites, nicht exklusives, gebührenfreies, unbefristetes, unwiderrufliches und vollständig unterlizenzierbares Recht, diese Inhalte in allen Medien zu verwenden, zu reproduzieren, zu ändern, anzupassen, zu veröffentlichen, zu übersetzen, abgeleitete Werke daraus zu erstellen, zu verteilen und anzuzeigen. Sie versichern und garantieren, dass Sie Eigentümer der Benutzerinhalte sind oder über die erforderlichen Rechte verfügen, um diese einzureichen, und dass die Inhalte keine Rechte Dritter verletzen.\n\nGEMEINSCHAFTSRICHTLINIEN\nBei der Nutzung der OnePaw-Website und -Dienste erklären Sie sich damit einverstanden, unsere Gemeinschaftsrichtlinien einzuhalten, die Folgendes umfassen, aber nicht darauf beschränkt sind:\n\n- Respektvolle Kommunikation mit anderen Benutzern und dem Personal von OnePaw.\n- Verbot von Belästigung, Hassreden und diskriminierendem Verhalten.\n- Verbot der Weitergabe falscher oder irreführender Informationen.\n\nMELDUNG VON VERSTÖSSEN\n\nWenn Ihnen ein Verstoß gegen diese Bedingungen oder unsere Gemeinschaftsrichtlinien bekannt wird, melden Sie ihn uns bitte umgehend unter Verwendung der angegebenen Kontaktinformationen.\n\nAKTUALISIERUNGEN UND ÄNDERUNGEN DER DIENSTE\n\nOnePaw behält sich das Recht vor, die auf der Website bereitgestellten Dienste mit oder ohne Vorankündigung vorübergehend oder dauerhaft zu ändern oder einzustellen. Sie erklären sich damit einverstanden, dass OnePaw weder Ihnen noch Dritten gegenüber für Änderungen, Aussetzungen oder Einstellungen der Dienste haftbar ist.\n\nFEEDBACK UND VORSCHLÄGE\n\nWenn Sie OnePaw Feedback oder Vorschläge bezüglich der Website oder der Dienste („Feedback“) geben, übertragen Sie hiermit alle Rechte an diesem Feedback an OnePaw und erklären sich damit einverstanden, dass OnePaw das Recht hat, dieses Feedback und die damit verbundenen Informationen in jeder von ihm als angemessen erachteten Weise zu verwenden und voll auszuschöpfen. OnePaw behandelt jedes von Ihnen bereitgestellte Feedback als nicht vertraulich und nicht urheberrechtlich geschützt.\n\nVERZICHT\n\nEin Verzicht auf eine in diesen Bedingungen festgelegte Bestimmung oder Bedingung gilt nicht als weiterer oder fortgesetzter Verzicht auf diese Bestimmung oder Bedingung oder als Verzicht auf eine andere Bestimmung oder Bedingung, und ein Versäumnis von OnePaw, ein Recht oder eine Bestimmung gemäß diesen Bedingungen geltend zu machen, stellt keinen Verzicht auf dieses Recht oder diese Bestimmung dar.\n\nHINWEISE\n\nOnePaw kann Ihnen Hinweise, einschließlich solcher zu Änderungen dieser Bedingungen, per E-Mail, per Post oder durch Veröffentlichungen auf der Website zukommen lassen.\n\nDurch die Nutzung der OnePaw-Website bestätigen Sie, dass Sie diese Nutzungsbedingungen gelesen und verstanden haben und sich mit deren Verbindlichkeit einverstanden erklären. Wenn Sie mit diesen Bedingungen nicht einverstanden sind, verwenden Sie die OnePaw-Website bitte nicht. Vielen Dank, dass Sie OnePaw verwenden.',
      'es':
          'INTRODUCCIÓN\n\n¡Bienvenido a OnePaw! Estos Términos y condiciones de uso (en adelante, \"Términos\") rigen el uso de nuestro sitio web y nuestros servicios. Al acceder o utilizar nuestro sitio web, usted acepta cumplir y estar sujeto a estos Términos. Si no está de acuerdo con estos Términos, no utilice nuestro sitio web.\n\nACEPTACIÓN DE LOS TÉRMINOS\n\nAl acceder o utilizar el sitio web de OnePaw, usted acepta estar legalmente sujeto a estos Términos, incluidas todas las enmiendas, modificaciones y políticas adicionales publicadas en nuestro sitio web. Si no está de acuerdo con estos Términos, debe dejar de usar nuestro sitio web inmediatamente.\n\n MODIFICACIÓN DE TÉRMINOS\n\nOnePaw se reserva el derecho de modificar estos Términos en cualquier momento. Le notificaremos cualquier cambio publicando los Términos actualizados en nuestro sitio web. Su uso continuado del sitio web después de la publicación de los cambios constituye su aceptación de los Términos modificados.\n\nREGISTRO DE CUENTA\n\nPara acceder a ciertas funciones de nuestro sitio web, es posible que deba registrarse para obtener una cuenta. Usted acepta proporcionar información precisa, actual y completa durante el proceso de registro y actualizar dicha información según sea necesario. Usted es responsable de salvaguardar la contraseña de su cuenta y de cualquier actividad o acción realizada en su cuenta.\n\nCONDUCTA DEL USUARIO\n\nUsted acepta no participar en ninguna de las siguientes actividades prohibidas:\n\n- Violar cualquier ley o reglamento aplicable.\n- Infringir los derechos de otros, incluidos los derechos de propiedad intelectual.\n- Participar en cualquier actividad que sea dañina, fraudulenta o engañosa.\n- Interferir con el funcionamiento de nuestro sitio web o de los servidores y redes utilizados para que el sitio web esté disponible.\n- Cargar o transmitir cualquier virus u otro código malicioso.\n\nPROPIEDAD INTELECTUAL\n\nTodo el contenido del sitio web de OnePaw, incluidos, entre otros, texto, gráficos, logotipos, imágenes y software, es propiedad de OnePaw o sus licenciantes y está protegido por las leyes de propiedad intelectual. No puede utilizar, reproducir, distribuir ni crear trabajos derivados de ningún contenido sin nuestro permiso previo por escrito.\n\nENLACES DE TERCEROS\n\nNuestro sitio web puede contener enlaces a sitios web de terceros. Estos enlaces se proporcionan para su comodidad y no implican ningún respaldo por parte de OnePaw. No tenemos control sobre el contenido o las prácticas de estos sitios web de terceros y no aceptamos ninguna responsabilidad por ellos. El uso de sitios web de terceros es bajo su propio riesgo.\n\n  DESCARGOS DE RESPONSABILIDAD\n\nEl sitio web de OnePaw se proporciona \"tal cual\" y \"según disponibilidad\". No ofrecemos ninguna garantía, expresa o implícita, con respecto al sitio web, incluidas, entre otras, garantías de comerciabilidad, idoneidad para un propósito particular o no infracción. No garantizamos que el sitio web sea ininterrumpido, seguro o esté libre de errores.\n\nLIMITACIÓN DE RESPONSABILIDAD\n\nEn la máxima medida permitida por la ley, OnePaw no será responsable de ningún daño indirecto, incidental, especial, consecuente o punitivo, ni de ninguna pérdida de ganancias o ingresos, ya sea incurridos directa o indirectamente, ni de ninguna pérdida de datos, uso o buena voluntad. , u otras pérdidas intangibles, resultantes de:\n\n- Su uso o incapacidad para\n\nutilizar el sitio web de OnePaw;\n- Cualquier acceso o uso no autorizado de nuestros servidores y/o cualquier información personal almacenada en ellos;\n- Cualquier interrupción o cese de la transmisión hacia o desde nuestro sitio web;\n- Cualquier error, virus, troyanos o similares que un tercero pueda transmitir a nuestro sitio web o a través de él;\n- Cualquier error u omisión en cualquier contenido o por cualquier pérdida o daño incurrido como resultado del uso de cualquier contenido publicado, enviado por correo electrónico, transmitido o puesto a disposición de otro modo a través del sitio web de OnePaw.\n\nIDENTIFICACIÓN\n\nUsted acepta indemnizar, defender y eximir de responsabilidad a OnePaw, sus funcionarios, directores, empleados, agentes y afiliados de y contra todos y cada uno de los reclamos, responsabilidades, daños, pérdidas, costos y gastos (incluidos los honorarios razonables de los abogados) que surjan de o de cualquier manera relacionado con:\n\n- Su acceso o uso del sitio web de OnePaw;\n- Su violación de estos Términos;\n- Su violación de cualquier derecho de otra parte, incluido cualquier derecho de propiedad intelectual;\n- Su incumplimiento de cualquier ley aplicable.\n\n   DIVISIBILIDAD\n\nSi alguna disposición de estos Términos se considera ilegal, nula o, por cualquier motivo, inaplicable, entonces esa disposición se considerará separable de estos Términos y no afectará la validez y aplicabilidad de las disposiciones restantes.\n\n  TERMINACIÓN\n\nOnePaw se reserva el derecho, a su exclusivo criterio, de cancelar su acceso a todo o parte del sitio web de OnePaw, con o sin previo aviso, por cualquier motivo, incluido, entre otros, el incumplimiento de estos Términos. Tras la rescisión, debe dejar de utilizar inmediatamente el sitio web y destruir cualquier material descargado o impreso del sitio web.\n\nACUERDO COMPLETO\n\nEstos Términos constituyen el acuerdo completo entre usted y OnePaw con respecto a su uso del sitio web y reemplazan todos los entendimientos, acuerdos, representaciones y garantías anteriores y contemporáneos, tanto escritos como orales, con respecto al sitio web.\n\nINFORMACIÓN DEL CONTACTO\n\nSi tiene alguna pregunta sobre estos Términos, contáctenos en:\n\nuna pata\nonepaw.help@outlook.com\n+40 770 107 700\n\nTÉRMINOS Y CONDICIONES ESPECÍFICAS DE SERVICIO\n\nCONTENIDO GENERADO POR EL USUARIO\n\nOnePaw puede permitir a los usuarios enviar, publicar o compartir contenido, incluidos, entre otros, texto, imágenes y videos (\"Contenido de usuario\"). Al enviar Contenido de usuario, otorga a OnePaw un derecho mundial, no exclusivo, libre de regalías, perpetuo, irrevocable y totalmente sublicenciable para usar, reproducir, modificar, adaptar, publicar, traducir, crear trabajos derivados, distribuir y mostrar dicho contenido. contenidos en cualquier medio. Usted declara y garantiza que posee o tiene los derechos necesarios para enviar el Contenido del usuario y que el contenido no infringe ningún derecho de terceros.\n\nPRINCIPIOS DE LA COMUNIDAD\nAl utilizar el sitio web y los servicios de OnePaw, usted acepta cumplir con nuestras Normas comunitarias, que incluyen, entre otras:\n\n- Comunicación respetuosa con otros usuarios y el personal de OnePaw.\n- Prohibición del acoso, el discurso de odio y las conductas discriminatorias.\n- Prohibición de compartir información falsa o engañosa.\n\nDENUNCIA DE VIOLACIONES\n\nSi tiene conocimiento de alguna violación de estos Términos o de nuestras Normas comunitarias, infórmenos de inmediato utilizando la información de contacto proporcionada.\n\n\nACTUALIZACIONES Y CAMBIOS DE SERVICIOS\n\nOnePaw se reserva el derecho de modificar o discontinuar, temporal o permanentemente, los servicios prestados en el sitio web, con o sin previo aviso. Usted acepta que OnePaw no será responsable ante usted ni ante ningún tercero por cualquier modificación, suspensión o interrupción de los servicios.\n\nCOMENTARIOS Y SUGERENCIAS\n\nSi proporciona a OnePaw comentarios o sugerencias sobre el sitio web o los servicios (\"Comentarios\"), por la presente asigna a OnePaw todos los derechos sobre dichos Comentarios y acepta que OnePaw tendrá el derecho de usar y explotar plenamente dichos Comentarios e información relacionada en cualquier forma que considere adecuada. OnePaw tratará cualquier comentario que usted proporcione como no confidencial y no propietario.\n\n  EXENCIÓN\n\nNinguna renuncia a cualquier término o condición establecida en estos Términos se considerará una renuncia adicional o continua de dicho término o condición o una renuncia a cualquier otro término o condición, y cualquier falla de OnePaw en hacer valer un derecho o disposición bajo estos Términos no constituye una renuncia a tal derecho o disposición.\n\nAVISOS\n\nOnePaw puede proporcionarle avisos, incluidos aquellos relacionados con cambios a estos Términos, por correo electrónico, correo postal o publicaciones en el sitio web.\n\n\n\nAl utilizar el sitio web de OnePaw, usted reconoce que ha leído, comprendido y acepta regirse por estos Términos y condiciones de uso. Si no está de acuerdo con estos Términos, no utilice el sitio web de OnePaw. Gracias por usar OnePaw.',
      'fr':
          'INTRODUCTION\n\nBienvenue sur OnePaw ! Les présentes conditions générales d\'utilisation (ci-après dénommées « Conditions ») régissent votre utilisation de notre site Web et de nos services. En accédant ou en utilisant notre site Web, vous acceptez de vous conformer et d\'être lié par ces conditions. Si vous n\'acceptez pas ces conditions, veuillez ne pas utiliser notre site Web.\n\nACCEPTATION DES CONDITIONS\n\nEn accédant ou en utilisant le site Web OnePaw, vous acceptez d\'être légalement lié par ces Conditions, y compris tous les amendements, modifications et politiques supplémentaires publiés sur notre site Web. Si vous n\'acceptez pas ces conditions, vous devez cesser immédiatement d\'utiliser notre site Web.\n\n MODIFICATION DES CONDITIONS\n\nOnePaw se réserve le droit de modifier les présentes Conditions à tout moment. Nous vous informerons de tout changement en publiant les conditions mises à jour sur notre site Web. Votre utilisation continue du site Web après la publication des modifications constitue votre acceptation des conditions modifiées.\n\nENREGISTREMENT DU COMPTE\n\nPour accéder à certaines fonctionnalités de notre site Web, vous devrez peut-être créer un compte. Vous acceptez de fournir des informations exactes, à jour et complètes pendant le processus d\'inscription et de mettre à jour ces informations si nécessaire. Vous êtes responsable de la protection du mot de passe de votre compte et de toute activité ou action sous votre compte.\n\nCONDUITE DE L\'UTILISATEUR\n\nVous acceptez de ne vous livrer à aucune des activités interdites suivantes :\n\n- Violer les lois ou réglementations applicables.\n- Porter atteinte aux droits d\'autrui, notamment aux droits de propriété intellectuelle.\n- S\'engager dans toute activité nuisible, frauduleuse ou trompeuse.\n- Interférer avec le fonctionnement de notre site Web ou des serveurs et réseaux utilisés pour rendre le site Web disponible.\n- Télécharger ou transmettre des virus ou autres codes malveillants.\n\nPROPRIÉTÉ INTELLECTUELLE\n\nTout le contenu du site Web OnePaw, y compris, mais sans s\'y limiter, les textes, graphiques, logos, images et logiciels, est la propriété de OnePaw ou de ses concédants de licence et est protégé par les lois sur la propriété intellectuelle. Vous ne pouvez pas utiliser, reproduire, distribuer ou créer des œuvres dérivées de tout contenu sans notre autorisation écrite préalable.\n\nLIENS TIERS\n\nNotre site Web peut contenir des liens vers des sites Web de tiers. Ces liens sont fournis pour votre commodité et ne signifient pas l\'approbation de OnePaw. Nous n\'avons aucun contrôle sur le contenu ou les pratiques de ces sites Web tiers et n\'acceptons aucune responsabilité à leur égard. Votre utilisation de sites Web tiers est à vos propres risques.\n\n  AVIS DE NON-RESPONSABILITÉ\n\nLe site Web OnePaw est fourni « tel quel » et « selon disponibilité ». Nous n\'offrons aucune garantie, expresse ou implicite, concernant le site Web, y compris, mais sans s\'y limiter, les garanties de qualité marchande, d\'adéquation à un usage particulier ou de non-contrefaçon. Nous ne garantissons pas que le site Web sera ininterrompu, sécurisé ou sans erreur.\n\nLIMITATION DE RESPONSABILITÉ\n\nDans toute la mesure permise par la loi, OnePaw ne sera pas responsable de tout dommage indirect, accidentel, spécial, consécutif ou punitif, ni de toute perte de profits ou de revenus, qu\'ils soient encourus directement ou indirectement, ou de toute perte de données, d\'utilisation, de bonne volonté. , ou d\'autres pertes incorporelles, résultant de :\n\n- Votre utilisation ou votre incapacité à\n\nutiliser le site Web OnePaw ;\n- Tout accès ou utilisation non autorisé de nos serveurs et/ou de toute information personnelle qui y est stockée ;\n- Toute interruption ou cessation de transmission vers ou depuis notre site Internet ;\n- Tout bug, virus, cheval de Troie ou similaire pouvant être transmis vers ou via notre site Web par un tiers ;\n- Toute erreur ou omission dans tout contenu ou pour toute perte ou dommage résultant de l\'utilisation de tout contenu publié, envoyé par courrier électronique, transmis ou autrement mis à disposition via le site Web OnePaw.\n\nIDEMNIFICATION\n\nVous acceptez d\'indemniser, de défendre et de dégager de toute responsabilité OnePaw, ses dirigeants, administrateurs, employés, agents et sociétés affiliées contre toute réclamation, responsabilité, dommage, perte, coût et dépense (y compris les honoraires raisonnables d\'avocat) découlant de ou de quelque manière que ce soit lié à :\n\n- Votre accès ou votre utilisation du site Web OnePaw ;\n- Votre violation de ces Conditions ;\n- Votre violation de tout droit d\'une autre partie, y compris tout droit de propriété intellectuelle ;\n- Votre violation de toute loi applicable.\n\n   DIVISIBILITÉ\n\nSi une disposition des présentes Conditions est jugée illégale, nulle ou, pour quelque raison que ce soit, inapplicable, cette disposition sera alors considérée comme séparable des présentes Conditions et n\'affectera pas la validité et le caractère exécutoire des dispositions restantes.\n\n  RÉSILIATION\n\nOnePaw se réserve le droit, à sa seule discrétion, de mettre fin à votre accès à tout ou partie du site Web OnePaw, avec ou sans préavis, pour quelque raison que ce soit, y compris, sans s\'y limiter, la violation des présentes Conditions. En cas de résiliation, vous devez immédiatement cesser toute utilisation du site Web et détruire tout matériel téléchargé ou imprimé à partir du site Web.\n\nACCORD COMPLET\n\nCes conditions constituent l\'intégralité de l\'accord entre vous et OnePaw concernant votre utilisation du site Web et remplacent tous les accords, accords, représentations et garanties antérieurs et contemporains, tant écrits qu\'oraux, concernant le site Web.\n\nCOORDONNÉES\n\nSi vous avez des questions concernant ces Conditions, veuillez nous contacter à :\n\nUne patte\nonepaw.help@outlook.com\n+40 770 107 700\n\nCONDITIONS PARTICULIÈRES DE SERVICE\n\nCONTENU GÉNÉRÉ PAR L\'UTILISATEUR\n\nOnePaw peut permettre aux utilisateurs de soumettre, publier ou partager du contenu, y compris, mais sans s\'y limiter, du texte, des images et des vidéos (« Contenu utilisateur »). En soumettant du contenu utilisateur, vous accordez à OnePaw un droit mondial, non exclusif, libre de droits, perpétuel, irrévocable et entièrement sous-licenciable d\'utiliser, reproduire, modifier, adapter, publier, traduire, créer des œuvres dérivées, distribuer et afficher ce contenu dans n’importe quel média. Vous déclarez et garantissez que vous possédez ou disposez des droits nécessaires pour soumettre le contenu utilisateur et que le contenu ne porte atteinte à aucun droit de tiers.\n\nRÈGLES DE LA COMMUNAUTÉ\nLorsque vous utilisez le site Web et les services OnePaw, vous acceptez de respecter nos directives communautaires, qui incluent, sans s\'y limiter :\n\n- Communication respectueuse avec les autres utilisateurs et le personnel OnePaw.\n- Interdiction du harcèlement, des discours de haine et des comportements discriminatoires.\n- Interdiction de partager des informations fausses ou trompeuses.\n\nSIGNALEMENT DES VIOLATIONS\n\nSi vous avez connaissance d\'une violation de ces conditions ou de nos directives communautaires, veuillez nous le signaler immédiatement en utilisant les informations de contact fournies.\n\n\nMISES À JOUR ET CHANGEMENTS DE SERVICES\n\nOnePaw se réserve le droit de modifier ou d\'interrompre, temporairement ou définitivement, les services fournis sur le site Web, avec ou sans préavis. Vous acceptez que OnePaw ne soit pas responsable envers vous ou envers tout tiers pour toute modification, suspension ou interruption des services.\n\nCOMMENTAIRES ET SUGGESTIONS\n\nSi vous fournissez à OnePaw des commentaires ou des suggestions concernant le site Web ou les services (« Commentaires »), vous cédez par la présente à OnePaw tous les droits sur ces commentaires et acceptez que OnePaw ait le droit d\'utiliser et d\'exploiter pleinement ces commentaires et informations associées dans tout manière qu\'il juge appropriée. OnePaw traitera tous les commentaires que vous fournissez comme non confidentiels et non exclusifs.\n\n  RENONCER\n\nAucune renonciation à une modalité ou condition énoncée dans les présentes Conditions ne sera considérée comme une renonciation supplémentaire ou continue à cette modalité ou condition ou une renonciation à toute autre modalité ou condition, et tout échec de OnePaw à faire valoir un droit ou une disposition en vertu des présentes Conditions sera ne constitue pas une renonciation à ce droit ou à cette disposition.\n\nAVIS\n\nOnePaw peut vous fournir des notifications, y compris celles concernant les modifications apportées aux présentes Conditions, par courrier électronique, par courrier ordinaire ou par publication sur le site Web.\n\n\n\nEn utilisant le site Web OnePaw, vous reconnaissez avoir lu, compris et accepté d\'être lié par les présentes conditions générales d\'utilisation. Si vous n\'acceptez pas ces conditions, veuillez ne pas utiliser le site Web OnePaw. Merci d\'utiliser OnePaw.',
      'hu':
          'BEVEZETÉS\n\nÜdvözöljük a OnePaw-ban! A jelen Felhasználási Feltételek (a továbbiakban: „Feltételek”) szabályozzák a weboldalunk és szolgáltatásaink Ön általi használatát. Weboldalunk megnyitásával vagy használatával Ön beleegyezik a jelen Feltételek betartásába és magára nézve kötelezőnek. Ha nem fogadja el ezeket a feltételeket, kérjük, ne használja weboldalunkat.\n\nFELTÉTELEK ELFOGADÁSA\n\nA OnePaw webhely megnyitásával vagy használatával Ön elfogadja, hogy jogilag kötelező érvényű a jelen Feltételek betartása, beleértve a weboldalunkon közzétett összes módosítást, módosítást és további szabályzatot. Ha nem fogadja el ezeket a feltételeket, haladéktalanul meg kell szüntetnie weboldalunk használatát.\n\n FELTÉTELEK MÓDOSÍTÁSA\n\nA OnePaw fenntartja a jogot, hogy ezeket a feltételeket bármikor módosítsa. Az esetleges változásokról a frissített Feltételek weboldalunkon történő közzétételével értesítjük. A változtatások közzétételét követően a weboldal további használata a módosított Feltételek elfogadását jelenti.\n\nFIÓKREGISZTRÁCIÓ\n\nWeboldalunk bizonyos funkcióinak eléréséhez előfordulhat, hogy fiókot kell regisztrálnia. Ön beleegyezik abba, hogy a regisztrációs folyamat során pontos, aktuális és teljes körű információkat ad, és szükség szerint frissíti ezeket az információkat. Ön felelős fiókja jelszavának megőrzéséért, valamint a fiókja alatt végzett tevékenységekért vagy műveletekért.\n\nFELHASZNÁLÓI MAGATARTÁS\n\nÖn vállalja, hogy nem vesz részt az alábbi tiltott tevékenységek egyikében sem:\n\n- A vonatkozó törvények vagy rendelkezések megsértése.\n- Mások jogainak megsértése, beleértve a szellemi tulajdonjogokat is.\n- Bármilyen ártalmas, csaló vagy megtévesztő tevékenységben való részvétel.\n- Weboldalunk működésének vagy a weboldal elérhetővé tételéhez használt szerverek és hálózatok működésének zavarása.\n- Vírusok vagy más rosszindulatú kódok feltöltése vagy továbbítása.\n\nSZELLEMI TULAJDONSÁG\n\nA OnePaw webhelyén található minden tartalom, beleértve, de nem kizárólagosan a szövegeket, grafikákat, logókat, képeket és szoftvereket, a OnePaw vagy licencadói tulajdonát képezi, és a szellemi tulajdonra vonatkozó törvények védik. Előzetes írásbeli engedélyünk nélkül tilos bármilyen tartalom felhasználása, reprodukálása, terjesztése vagy származékos alkotása.\n\nHARMADIK FELTÉTELEK LINKEK\n\nWeboldalunk harmadik felek webhelyeire mutató hivatkozásokat tartalmazhat. Ezek a hivatkozások az Ön kényelmét szolgálják, és nem jelentik a OnePaw jóváhagyását. Nincs befolyásunk ezen harmadik felek webhelyeinek tartalmára vagy gyakorlatára, és nem vállalunk felelősséget értük. Harmadik fél webhelyeinek használata a saját felelősségére történik.\n\n  NYILATKOZAT\n\nA OnePaw webhely \"ahogy van\" és \"ahogy elérhető\" alapon biztosított. Nem vállalunk sem kifejezett, sem hallgatólagos garanciát a weboldallal kapcsolatban, beleértve, de nem kizárólagosan, az eladhatóságra, egy adott célra való alkalmasságra vagy a jogsértés hiányára vonatkozó garanciákat. Nem garantáljuk, hogy a weboldal zavartalan, biztonságos vagy hibamentes lesz.\n\nKORLÁTOLT FELELŐSSÉG\n\nA törvény által megengedett legteljesebb mértékben a OnePaw nem vállal felelősséget semmilyen közvetett, véletlen, különleges, következményes vagy büntető jellegű kárért, sem a nyereség- vagy bevételkiesésért, akár közvetlenül, akár közvetve merül fel, sem adatvesztésért, használatból, jó hírnévből. vagy egyéb immateriális veszteségek, amelyek az alábbiakból erednek:\n\n- Az Ön használata vagy képtelensége\n\nhasználja a OnePaw webhelyet;\n- Szervereinkhez és/vagy az azokon tárolt személyes adatokhoz való jogosulatlan hozzáférés vagy azok használata;\n- A weboldalunkra irányuló vagy onnan induló továbbítás megszakítása vagy leállása;\n- Bármilyen hiba, vírus, trójai faló vagy hasonló, amelyet bármely harmadik fél továbbít a weboldalunkra vagy azon keresztül;\n- Bármely tartalom hibája vagy kihagyása, vagy a OnePaw webhelyén keresztül közzétett, e-mailben elküldött, továbbított vagy más módon elérhetővé tett tartalom használatából eredő veszteség vagy kár.\n\nAZONOSÍTÁS\n\nÖn beleegyezik abba, hogy a OnePaw-t, ​​annak tisztségviselőit, igazgatóit, alkalmazottait, ügynökeit és leányvállalatait kártalanítja, megvédi és ártalmatlanná teszi minden olyan követeléssel, kötelezettséggel, kárral, veszteséggel, költséggel és kiadással szemben (beleértve az ésszerű ügyvédi díjakat), amelyek a következőkből erednek. vagy bármilyen módon kapcsolódik:\n\n- Ön hozzáférése vagy használata a OnePaw webhelyhez;\n- Ön megsértette a jelen Feltételeket;\n- Ön megsértette egy másik fél bármely jogát, beleértve a szellemi tulajdonjogokat is;\n- Bármely vonatkozó törvény megsértése.\n\n   VÁLASZTHATÓSÁG\n\nHa a jelen Feltételek bármely rendelkezése jogellenesnek, érvénytelennek vagy bármilyen okból végrehajthatatlannak minősül, akkor az adott rendelkezést a jelen Feltételektől elválaszthatónak kell tekinteni, és nem befolyásolja a fennmaradó rendelkezések érvényességét és végrehajthatóságát.\n\n  MEGSZŰNÉS\n\nA OnePaw fenntartja a jogot, hogy saját belátása szerint megszüntesse az Ön hozzáférését a OnePaw webhely egészéhez vagy egy részéhez, előzetes értesítéssel vagy anélkül, bármilyen okból, beleértve a jelen Feltételek megsértését is. A felmondást követően haladéktalanul fel kell függesztenie a weboldal használatát, és meg kell semmisítenie a weboldalról letöltött vagy kinyomtatott anyagokat.\n\nTELJES EGYEZÉS\n\nEzek a Feltételek alkotják a teljes megállapodást Ön és a OnePaw között a webhely Ön általi használatára vonatkozóan, és felülírnak minden korábbi és egyidejű megállapodást, megállapodást, nyilatkozatot és garanciát, írásban és szóban egyaránt a weboldallal kapcsolatban.\n\nELÉRHETŐSÉG\n\nHa bármilyen kérdése van a jelen Feltételekkel kapcsolatban, kérjük, vegye fel velünk a kapcsolatot a következő címen:\n\nOnePaw\nonepaw.help@outlook.com\n+40 770 107 700\n\nA SZOLGÁLTATÁS KÜLÖNLEGES FELTÉTELEI\n\nFELHASZNÁLÓ ÁLTAL GENERÁLT TARTALOM\n\nA OnePaw lehetővé teheti a felhasználók számára tartalom beküldését, közzétételét vagy megosztását, beleértve, de nem kizárólagosan, szöveget, képeket és videókat (\"Felhasználói tartalom\"). A Felhasználói tartalom elküldésével világszerte, nem kizárólagos, jogdíjmentes, örökre szóló, visszavonhatatlan és teljes mértékben allicencbe adható jogot biztosít a OnePaw-nak az ilyen anyagok használatára, reprodukálására, módosítására, adaptálására, közzétételére, fordítására, származékos művek létrehozására, terjesztésére és megjelenítésére. tartalom bármilyen médiában. Ön kijelenti és szavatolja, hogy a Felhasználói Tartalom tulajdonosa vagy a szükséges jogokkal rendelkezik ahhoz, hogy a tartalom nem sérti harmadik felek jogait.\n\nKÖZÖSSÉGI IRÁNYELVEK\nA OnePaw webhelyének és szolgáltatásainak használata során Ön elfogadja, hogy betartja közösségi irányelveinket, amelyek többek között a következőket tartalmazzák:\n\n- Tiszteletteljes kommunikáció más felhasználókkal és a OnePaw munkatársaival.\n- A zaklatás, a gyűlöletbeszéd és a diszkriminatív magatartás tilalma.\n- A hamis vagy félrevezető információk megosztásának tilalma.\n\nJOGSÉRTÉSEK JELENTÉSE\n\nHa tudomást szerez a jelen Feltételek vagy közösségi irányelveink megsértéséről, kérjük, haladéktalanul jelentse azt nekünk a megadott elérhetőségeinken.\n\n\nSZOLGÁLTATÁSOK FRISSÍTÉSE ÉS VÁLTOZÁSA\n\nA OnePaw fenntartja a jogot, hogy ideiglenesen vagy véglegesen módosítsa vagy megszüntesse a weboldalon nyújtott szolgáltatásokat, előzetes értesítéssel vagy anélkül. Ön elfogadja, hogy a OnePaw nem vállal felelősséget Ön vagy harmadik fél felé a szolgáltatások módosításáért, felfüggesztéséért vagy leállításáért.\n\nVISSZAJELZÉS ÉS JAVASLAT\n\nHa a OnePaw-nak bármilyen visszajelzést vagy javaslatot ad a webhelyre vagy a szolgáltatásokra vonatkozóan (\"Visszajelzés\"), Ön ezennel a OnePaw-ra ruházza az ilyen visszajelzésekkel kapcsolatos minden jogot, és beleegyezik abba, hogy a OnePaw-nak jogában áll a visszajelzést és a kapcsolódó információkat felhasználni és teljes mértékben felhasználni megfelelőnek ítélt módon. A OnePaw minden Ön által megadott visszajelzést nem bizalmasnak és nem védettnek tekint.\n\n  LEMONDÁS\n\nA jelen Feltételekben meghatározott bármely feltételről vagy feltételről való lemondás nem minősül további vagy folyamatos lemondásnak az adott feltételről vagy bármely más feltételről vagy feltételről való lemondásnak, és ha a OnePaw elmulasztja a jelen Feltételek szerinti jogának vagy rendelkezésének érvényesítését nem jelenti az ilyen jogról vagy rendelkezésről való lemondást.\n\nÉRTESÍTÉSEK\n\nA OnePaw értesítéseket küldhet Önnek, beleértve a jelen Feltételek változásaival kapcsolatosakat is, e-mailben, hagyományos levélben vagy a webhelyen közzétett bejegyzésekben.\n\n\n\nA OnePaw webhely használatával Ön elismeri, hogy elolvasta, megértette és magára nézve kötelezőnek ismeri el a jelen Felhasználási feltételeket. Ha nem ért egyet ezekkel a feltételekkel, kérjük, ne használja a OnePaw webhelyet. Köszönjük, hogy a OnePaw-t használja.',
      'ro':
          'INTRODUCERE\n\nBun venit la OnePaw! Acești Termeni și Condiții de utilizare (denumite în continuare „Termeni”) guvernează utilizarea de către dumneavoastră a site-ului și serviciilor noastre. Prin accesarea sau utilizarea site-ului nostru web, sunteți de acord să respectați și să fiți legat de acești Termeni. Dacă nu sunteți de acord cu acești Termeni, vă rugăm să nu utilizați site-ul nostru.\n\nACCEPTAREA TERMENILOR\n\nPrin accesarea sau utilizarea site-ului web OnePaw, sunteți de acord să fiți legat din punct de vedere legal de acești Termeni, inclusiv de toate amendamentele, modificările și politicile suplimentare publicate pe site-ul nostru. Dacă nu sunteți de acord cu acești Termeni, trebuie să întrerupeți imediat utilizarea site-ului nostru web.\n\n MODIFICAREA TERMENILOR\n\nOnePaw își rezervă dreptul de a modifica acești Termeni în orice moment. Vă vom anunța cu privire la orice modificare prin postarea Termenilor actualizați pe site-ul nostru web. Utilizarea în continuare a site-ului web după postarea modificărilor constituie acceptarea de către dumneavoastră a Termenilor modificați.\n\nÎNREGISTRAREA CONTULUI\n\nPentru a accesa anumite funcții ale site-ului nostru web, poate fi necesar să vă înregistrați pentru un cont. Sunteți de acord să furnizați informații exacte, actuale și complete în timpul procesului de înregistrare și să actualizați aceste informații, după caz. Sunteți responsabil pentru protejarea parolei contului dvs. și pentru orice activități sau acțiuni din contul dvs.\n\nCONDUCEREA UTILIZATORULUI\n\nSunteți de acord să nu vă implicați în niciuna dintre următoarele activități interzise:\n\n- Încălcarea oricăror legi sau reglementări aplicabile.\n- Încălcarea drepturilor altora, inclusiv a drepturilor de proprietate intelectuală.\n- Angajarea în orice activitate care este dăunătoare, frauduloasă sau înșelătoare.\n- Interferența cu funcționarea site-ului nostru web sau a serverelor și rețelelor utilizate pentru a face site-ul disponibil.\n- Încărcarea sau transmiterea oricăror viruși sau alt cod rău intenționat.\n\nPROPRIETATE INTELECTUALĂ\n\nTot conținutul de pe site-ul OnePaw, inclusiv, dar fără a se limita la, text, grafică, logo-uri, imagini și software, este proprietatea OnePaw sau a licențiatorilor săi și este protejat de legile privind proprietatea intelectuală. Nu puteți utiliza, reproduce, distribui sau crea lucrări derivate din orice conținut fără permisiunea noastră prealabilă în scris.\n\nLINK-URI DE LA TERȚI PĂRȚI\n\nSite-ul nostru web poate conține link-uri către site-uri web ale terților. Aceste link-uri sunt furnizate pentru confortul dumneavoastră și nu înseamnă aprobarea de către OnePaw. Nu avem control asupra conținutului sau practicilor acestor site-uri web terțe și nu ne asumăm responsabilitatea pentru acestea. Utilizarea de către dvs. a site-urilor web ale terților este pe propriul risc.\n\n  DECLARAȚII DE RESPONSABILITATE\n\nSite-ul web OnePaw este furnizat „așa cum este” și „așa cum este disponibil”. Nu oferim nicio garanție, expresă sau implicită, cu privire la site-ul web, inclusiv, dar fără a se limita la, garanții de vandabilitate, potrivire pentru un anumit scop sau neîncălcare. Nu garantăm că site-ul web va fi neîntrerupt, sigur sau fără erori.\n\nLIMITARE A RĂSPUNDERII\n\nÎn măsura permisă de lege, OnePaw nu va fi răspunzător pentru nicio daune indirecte, incidentale, speciale, consecutive sau punitive, sau orice pierdere de profituri sau venituri, indiferent dacă sunt suportate direct sau indirect, sau orice pierdere de date, utilizare, bunăvoință , sau alte pierderi necorporale, rezultate din:\n\n- Folosirea sau incapacitatea dvs. de a\n\nutilizați site-ul web OnePaw;\n- Orice acces neautorizat la sau utilizare a serverelor noastre și/sau orice informații personale stocate în acestea;\n- Orice întrerupere sau încetare a transmiterii către sau de la site-ul nostru web;\n- Orice bug-uri, viruși, cai troieni sau altele asemenea care pot fi transmise către sau prin intermediul site-ului nostru de către orice terță parte;\n- Orice erori sau omisiuni în orice conținut sau pentru orice pierdere sau daune suferite ca urmare a utilizării oricărui conținut postat, trimis prin e-mail, transmis sau pus la dispoziție în alt mod prin intermediul site-ului OnePaw.\n\nIDEMNIFICARE\n\nSunteți de acord să despăgubiți, să apărați și să feriți de răspundere OnePaw, ofițerii, directorii, angajații, agenții și afiliații săi din și împotriva oricăror cereri, răspunderi, daune, pierderi, costuri și cheltuieli (inclusiv onorariile rezonabile ale avocaților) care decurg din sau în orice fel legat de:\n\n- Accesul dvs. la sau utilizarea site-ului web OnePaw;\n- Încălcarea dvs. a acestor Termeni;\n- Încălcarea de către dumneavoastră a oricăror drepturi ale unei alte părți, inclusiv orice drepturi de proprietate intelectuală;\n- Încălcarea dvs. a oricăror legi aplicabile.\n\n   SEPARABILITATE\n\nDacă vreo prevedere a acestor Termeni este considerată ilegală, nulă sau, din orice motiv, inaplicabilă, atunci acea prevedere va fi considerată separabilă de acești Termeni și nu va afecta valabilitatea și aplicabilitatea oricăror prevederi rămase.\n\n  TERMINAREA\n\nOnePaw își rezervă dreptul, la discreția sa, de a rezilia accesul dumneavoastră la întregul site web OnePaw sau la o parte, cu sau fără notificare, din orice motiv, inclusiv, fără limitare, încălcarea acestor Termeni. La reziliere, trebuie să încetați imediat orice utilizare a site-ului web și să distrugeți orice materiale descărcate sau tipărite de pe site.\n\nÎNTREGUL ACORD\n\nAcești Termeni constituie întregul acord dintre dvs. și OnePaw cu privire la utilizarea de către dvs. a site-ului web și înlocuiesc toate înțelegerile, acordurile, reprezentările și garanțiile anterioare și contemporane, atât scrise, cât și orale, cu privire la site.\n\nINFORMAȚII DE CONTACT\n\nDacă aveți întrebări despre acești Termeni, vă rugăm să ne contactați la:\n\nOnePaw\nonepaw.help@outlook.com\n+40 770 107 700\n\nTERMENI ȘI CONDIȚII SPECIFICE PENTRU SERVICE\n\nCONȚINUT GENERAT DE UTILIZATORI\n\nOnePaw poate permite utilizatorilor să trimită, să posteze sau să partajeze conținut, inclusiv, dar fără a se limita la, text, imagini și videoclipuri („Conținutul utilizatorului”). Prin trimiterea Conținutului utilizatorului, acordați OnePaw un drept la nivel mondial, neexclusiv, fără drepturi de autor, perpetuu, irevocabil și complet sublicențiat de a utiliza, reproduce, modifica, adapta, publica, traduce, crea lucrări derivate din, distribui și afișa astfel de conținut în orice media. Declarați și garantați că dețineți sau aveți drepturile necesare pentru a trimite Conținutul utilizatorului și că conținutul nu încalcă niciun drept al terților.\n\nGHIDUL COMUNITĂŢII\nÎn timp ce utilizați site-ul web și serviciile OnePaw, sunteți de acord să respectați Regulile comunității noastre, care includ, dar nu se limitează la:\n\n- Comunicare respectuoasă cu alți utilizatori și personalul OnePaw.\n- Interzicerea hărțuirii, a discursului instigator la ură și a comportamentului discriminatoriu.\n- Interzicerea partajării de informații false sau înșelătoare.\n\nRAPORTAREA ÎNCĂLCĂRILOR\n\nDacă aflați despre orice încălcare a acestor Termeni sau a Regulilor comunității, vă rugăm să ne raportați imediat, folosind informațiile de contact furnizate.\n\n\nACTUALIZĂRI ȘI SCHIMBĂRI DE SERVICII\n\nOnePaw își rezervă dreptul de a modifica sau întrerupe, temporar sau definitiv, serviciile furnizate pe site, cu sau fără notificare. Sunteți de acord că OnePaw nu va fi răspunzător față de dvs. sau față de orice terță parte pentru orice modificare, suspendare sau întrerupere a serviciilor.\n\nFEEDBACK ȘI SUGESTII\n\nDacă oferiți OnePaw orice feedback sau sugestii cu privire la site-ul web sau la servicii („Feedback”), prin prezenta îi atribuiți OnePaw toate drepturile asupra unui astfel de Feedback și sunteți de acord că OnePaw va avea dreptul de a utiliza și exploata pe deplin astfel de Feedback și informații aferente în orice fel. modalitatea pe care o consideră potrivită. OnePaw va trata orice Feedback pe care îl furnizați ca fiind neconfidențial și neproprietar.\n\n  RENUNȚARE\n\nNicio renunțare la niciun termen sau condiție stabilit în acești Termeni nu va fi considerată o renunțare ulterioară sau continuă la un astfel de termen sau condiție sau o renunțare la orice alt termen sau condiție și orice nerespectare a OnePaw de a-și afirma un drept sau o prevedere conform acestor Termeni va nu constituie o renunțare la un astfel de drept sau prevedere.\n\nNOTIFICARI\n\nOnePaw vă poate furniza notificări, inclusiv cele referitoare la modificări ale acestor Termeni, prin e-mail, poștă obișnuită sau postări pe site.\n\n\n\nPrin utilizarea site-ului web OnePaw, confirmați că ați citit, înțeles și sunteți de acord să respectați acești Termeni și Condiții de utilizare. Dacă nu sunteți de acord cu acești Termeni, vă rugăm să nu utilizați site-ul web OnePaw. Vă mulțumim că folosiți OnePaw.',
    },
    'kmgsbl1n': {
      'en': 'Terms & Conditions',
      'de': 'Terms & amp; Bedingungen',
      'es': 'Términos y condiciones',
      'fr': 'termes et conditions',
      'hu': 'Felhasználási feltételek',
      'ro': 'termeni si conditii',
    },
  },
  // Home
  {
    'lrclsloq': {
      'en': 'Adoptions',
      'de': 'Adoptionen',
      'es': 'Adopciones',
      'fr': 'Adoption',
      'hu': 'Örökbefogadások',
      'ro': 'Adopții',
    },
    'p1jpkwwh': {
      'en': 'Lost&Found',
      'de': 'Verloren gefunden',
      'es': 'Objetos perdidos y encontrados',
      'fr': 'Perdu trouvé',
      'hu': 'Lost&Found',
      'ro': 'Pierdut găsit',
    },
    '24tr1oo7': {
      'en': 'Shelters',
      'de': 'Unterstände',
      'es': 'Refugios',
      'fr': 'Abris',
      'hu': 'Menedékek',
      'ro': 'Adăposturi',
    },
    'zers7tpm': {
      'en': 'Training',
      'de': 'Ausbildung',
      'es': 'Capacitación',
      'fr': 'Entraînement',
      'hu': 'Kiképzés',
      'ro': 'Instruire',
    },
    '5z97j5i7': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
    '8820r6cs': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // Training
  {
    '0p7ufwpc': {
      'en': 'Training',
      'de': 'Ausbildung',
      'es': 'Capacitación',
      'fr': 'Entraînement',
      'hu': 'Kiképzés',
      'ro': 'Instruire',
    },
    'v5dy87ew': {
      'en':
          'Dog training is a crucial component to developing a well-balanced and happy dog. Regardless of your dog\'s breed, age or experience level, basic training is fundamental to ensuring effective communication between you and your four-legged friend. Our training video provides a detailed and practical approach to start this essential process.',
      'de':
          'Hundeerziehung ist ein entscheidender Bestandteil der Erziehung eines ausgeglichenen und glücklichen Hundes. Unabhängig von der Rasse, dem Alter oder der Erfahrung Ihres Hundes ist eine Grundausbildung von grundlegender Bedeutung, um eine effektive Kommunikation zwischen Ihnen und Ihrem vierbeinigen Freund zu gewährleisten. Unser Trainingsvideo bietet einen detaillierten und praktischen Ansatz, um diesen wichtigen Prozess zu starten.',
      'es':
          'El adiestramiento canino es un componente crucial para desarrollar un perro feliz y equilibrado. Independientemente de la raza, la edad o el nivel de experiencia de su perro, el entrenamiento básico es fundamental para garantizar una comunicación efectiva entre usted y su amigo de cuatro patas. Nuestro vídeo de formación proporciona un enfoque detallado y práctico para iniciar este proceso esencial.',
      'fr':
          'Le dressage du chien est un élément crucial pour développer un chien bien équilibré et heureux. Quels que soient la race, l\'âge ou le niveau d\'expérience de votre chien, un entraînement de base est fondamental pour assurer une communication efficace entre vous et votre compagnon à quatre pattes. Notre vidéo de formation propose une approche détaillée et pratique pour démarrer ce processus essentiel.',
      'hu':
          'A kutyakiképzés kulcsfontosságú összetevője a kiegyensúlyozott és boldog kutya kialakításának. Függetlenül kutyája fajtájától, korától vagy tapasztalati szintjétől, az alapképzés alapvető fontosságú az Ön és négylábú barátja közötti hatékony kommunikáció biztosításához. Oktatóvideónk részletes és gyakorlati megközelítést ad ennek az alapvető folyamatnak az elindításához.',
      'ro':
          'Antrenamentul câinilor este o componentă crucială pentru dezvoltarea unui câine bine echilibrat și fericit. Indiferent de rasa, vârsta sau nivelul de experiență al câinelui tău, antrenamentul de bază este fundamental pentru a asigura o comunicare eficientă între tine și prietenul tău cu patru picioare. Videoclipul nostru de instruire oferă o abordare detaliată și practică pentru a începe acest proces esențial.',
    },
    '5a82kqus': {
      'en': 'What will you learn from this video?',
      'de': 'Was werden Sie aus diesem Video lernen?',
      'es': '¿Qué aprenderás de este vídeo?',
      'fr': 'Qu\'allez-vous apprendre de cette vidéo ?',
      'hu': 'Mit fogsz tanulni ebből a videóból?',
      'ro': 'Ce vei învăța din acest videoclip?',
    },
    'iyget66n': {
      'en':
          'Basic commands: You will learn how to teach your dogs the basic commands like \"sit\", \"lay down\", \"come\" and \"stay\". These commands are the cornerstone of good behavior and your dog\'s safety.\n\nSocialization: The video offers tips on how to expose your dog to various environments, sounds and people to help him behave appropriately in any situation.\n\nReward Techniques: Learn how to use rewards to encourage desired behaviors, creating a positive and motivating experience for your dog.\n\nLeash Control: You\'ll get tips on how to properly use the leash to encourage your dog\'s quiet and obedient walk.\n\nManaging common problems: The video also covers how to correct unwanted behaviors such as biting, excessive barking and jumping on people.',
      'de':
          'Grundlegende Kommandos: Sie lernen, wie Sie Ihren Hunden grundlegende Kommandos wie „Sitz“, „Platz“, „Komm“ und „Bleib“ beibringen. Diese Kommandos sind die Grundlage für gutes Benehmen und die Sicherheit Ihres Hundes.\n\nSozialisierung: Das Video bietet Tipps, wie Sie Ihren Hund verschiedenen Umgebungen, Geräuschen und Menschen aussetzen, damit er sich in jeder Situation angemessen verhält.\n\nBelohnungstechniken: Lernen Sie, wie Sie Belohnungen einsetzen, um erwünschtes Verhalten zu fördern und Ihrem Hund so eine positive und motivierende Erfahrung zu bieten.\n\nLeinenkontrolle: Sie erhalten Tipps, wie Sie die Leine richtig einsetzen, um Ihren Hund zu einem ruhigen und gehorsamen Spaziergang zu animieren.\n\nUmgang mit häufigen Problemen: Das Video zeigt auch, wie Sie unerwünschtes Verhalten wie Beißen, übermäßiges Bellen und Anspringen von Menschen korrigieren können.',
      'es':
          'Comandos básicos: aprenderá a enseñar a sus perros los comandos básicos como \"sentarse\", \"acostarse\", \"venir\" y \"quedarse\". Estas órdenes son la piedra angular del buen comportamiento y de la seguridad de su perro.\n\nSocialización: El vídeo ofrece consejos sobre cómo exponer a tu perro a diversos entornos, sonidos y personas para ayudarle a comportarse adecuadamente en cualquier situación.\n\nTécnicas de recompensa: aprenda a utilizar recompensas para fomentar los comportamientos deseados, creando una experiencia positiva y motivadora para su perro.\n\nControl de la correa: Recibirás consejos sobre cómo utilizar correctamente la correa para fomentar el paseo tranquilo y obediente de tu perro.\n\nManejo de problemas comunes: el video también cubre cómo corregir comportamientos no deseados como morder, ladrar excesivamente y saltar sobre las personas.',
      'fr':
          'Commandes de base : Vous apprendrez à enseigner à vos chiens les commandes de base telles que « s\'asseoir », « s\'allonger », « venir » et « rester ». Ces ordres sont la pierre angulaire du bon comportement et de la sécurité de votre chien.\n\nSocialisation : La vidéo propose des conseils sur la manière d\'exposer votre chien à divers environnements, sons et personnes pour l\'aider à se comporter de manière appropriée dans n\'importe quelle situation.\n\nTechniques de récompense : Apprenez à utiliser les récompenses pour encourager les comportements souhaités, créant ainsi une expérience positive et motivante pour votre chien.\n\nContrôle de la laisse : vous obtiendrez des conseils sur la façon d\'utiliser correctement la laisse pour encourager la marche calme et obéissante de votre chien.\n\nGérer les problèmes courants : la vidéo explique également comment corriger les comportements indésirables tels que mordre, aboyer excessivement et sauter sur les gens.',
      'hu':
          'Alapvető parancsok: Megtanulja, hogyan tanítsa meg kutyájának az olyan alapvető parancsokat, mint az „ülj”, „feküdj le”, „gyere” és „maradj”. Ezek a parancsok a jó viselkedés és kutyája biztonságának sarokkövei.\n\nSzocializáció: A videó tippeket ad arra vonatkozóan, hogyan tegye ki kutyáját különféle környezeteknek, hangoknak és embereknek, hogy segítsen neki megfelelően viselkedni minden helyzetben.\n\nJutalmazási technikák: Tanulja meg, hogyan használhatja a jutalmakat a kívánt viselkedés ösztönzésére, pozitív és motiváló élményt teremtve kutyája számára.\n\nPórázvezérlés: Tippeket kap a póráz megfelelő használatához, hogy ösztönözze kutyája csendes és engedelmes sétáját.\n\nGyakori problémák kezelése: A videó azt is bemutatja, hogyan lehet korrigálni a nem kívánt viselkedéseket, például a harapást, a túlzott ugatást és az emberekre ugrást.',
      'ro':
          'Comenzi de bază: veți învăța cum să vă învățați câinii comenzile de bază precum „stați”, „întindeți-vă”, „vino” și „stați”. Aceste comenzi sunt piatra de temelie a unui comportament bun și a siguranței câinelui tău.\n\nSocializare: videoclipul oferă sfaturi despre cum să-ți expui câinele la diferite medii, sunete și oameni pentru a-l ajuta să se comporte adecvat în orice situație.\n\nTehnici de recompensă: Aflați cum să utilizați recompensele pentru a încuraja comportamentele dorite, creând o experiență pozitivă și motivantă pentru câinele dvs.\n\nControlul lesei: vei primi sfaturi despre cum să folosești corect lesa pentru a încuraja mersul liniștit și ascultător al câinelui tău.\n\nGestionarea problemelor obișnuite: videoclipul acoperă, de asemenea, cum să corectați comportamentele nedorite, cum ar fi mușcătura, lătratul excesiv și săritul asupra oamenilor.',
    },
    '6p3gyy6s': {
      'en':
          'Every minute spent training will bring long-term benefits for both you and your four-legged friend. With patience and consistency, you will notice how your dog becomes more obedient, more confident and happier to interact with the world around him.\n\nEnjoy the training process and build a priceless bond with your dog!\n\n\n\n\n\n\n\n\n',
      'de':
          'Jede Minute, die Sie mit dem Training verbringen, wird Ihnen und Ihrem vierbeinigen Freund langfristig Vorteile bringen. Mit Geduld und Beständigkeit werden Sie feststellen, wie Ihr Hund gehorsamer, selbstbewusster und glücklicher wird, mit der Welt um ihn herum zu interagieren.\n\nGenießen Sie den Trainingsprozess und bauen Sie eine unbezahlbare Bindung zu Ihrem Hund auf!',
      'es':
          'Cada minuto dedicado al entrenamiento traerá beneficios a largo plazo tanto para ti como para tu amigo de cuatro patas. Con paciencia y constancia, notarás cómo tu perro se vuelve más obediente, más seguro y más feliz al interactuar con el mundo que lo rodea.\n\n¡Disfruta del proceso de entrenamiento y construye un vínculo invaluable con tu perro!',
      'fr':
          'Chaque minute passée à vous entraîner apportera des bénéfices à long terme, tant pour vous que pour votre compagnon à quatre pattes. Avec de la patience et de la cohérence, vous remarquerez à quel point votre chien devient plus obéissant, plus confiant et plus heureux d\'interagir avec le monde qui l\'entoure.\n\nProfitez du processus de dressage et créez un lien inestimable avec votre chien !',
      'hu':
          'Minden edzéssel töltött perc hosszú távú előnyökkel jár Önnek és négylábú barátjának is. Türelemmel és következetességgel észreveszi majd, hogy kutyája engedelmesebbé, magabiztosabbá és boldogabbá válik a körülötte lévő világgal való kölcsönhatásban.\n\nÉlvezze a képzési folyamatot, és építsen fel megfizethetetlen kapcsolatot kutyájával!',
      'ro':
          'Fiecare minut petrecut la antrenament va aduce beneficii pe termen lung atât pentru tine, cât și pentru prietenul tău cu patru picioare. Cu răbdare și consecvență, vei observa cum câinele tău devine mai ascultător, mai încrezător și mai fericit să interacționeze cu lumea din jurul lui.\n\nBucurați-vă de procesul de dresaj și construiți o legătură neprețuită cu câinele dvs.!',
    },
  },
  // auth_2_Create
  {
    'qrvuy6i3': {
      'en': 'Get Started',
      'de': 'Loslegen',
      'es': 'Empezar',
      'fr': 'Commencer',
      'hu': 'Fogj neki',
      'ro': 'Sa incepem',
    },
    'jpehl8sv': {
      'en': 'Create an account by using the form below.',
      'de': 'Erstellen Sie mithilfe des untenstehenden Formulars ein Konto.',
      'es': 'Cree una cuenta utilizando el siguiente formulario.',
      'fr': 'Créez un compte en utilisant le formulaire ci-dessous.',
      'hu': 'Hozzon létre fiókot az alábbi űrlap segítségével.',
      'ro': 'Creați un cont folosind formularul de mai jos.',
    },
    'y919qeny': {
      'en': 'Email',
      'de': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'hu': 'Email',
      'ro': 'E-mail',
    },
    'zyrjgvh2': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'hu': 'Jelszó',
      'ro': 'Parola',
    },
    'afeldqpo': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
      'hu': 'Fiók létrehozása',
      'ro': 'Creează cont',
    },
    '8s9v5c6s': {
      'en': 'Or sign up with',
      'de': 'Oder registrieren Sie sich mit',
      'es': 'O regístrate con',
      'fr': 'Ou inscrivez-vous avec',
      'hu': 'Vagy jelentkezzen be',
      'ro': 'Sau înscrieți-vă cu',
    },
    'ny40u60k': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
      'es': 'Continuar con Google',
      'fr': 'Continuer avec Google',
      'hu': 'Folytassa a Google-lal',
      'ro': 'Continuați cu Google',
    },
    'nmfwty3u': {
      'en': 'Continue with Apple',
      'de': 'Weiter mit Apple',
      'es': 'Continuar con Apple',
      'fr': 'Continuer avec Apple',
      'hu': 'Folytassa az Apple-lel',
      'ro': 'Continuați cu Apple',
    },
    'pvu82yu9': {
      'en': 'Already have an account?    ',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte?',
      'hu': 'Már van fiókja?',
      'ro': 'ai deja un cont?',
    },
    'mu13hny8': {
      'en': '  Sign in here',
      'de': 'Hier anmelden',
      'es': 'Firme aquí',
      'fr': 'Se connecter ici',
      'hu': 'Jelentkezzen be itt',
      'ro': 'Conectați-vă aici',
    },
    '1xioblgk': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // auth_2_Login
  {
    'znmyqig2': {
      'en': 'Welcome Back',
      'de': 'Willkommen zurück',
      'es': 'Bienvenido de nuevo',
      'fr': 'Content de te revoir',
      'hu': 'Üdv újra',
      'ro': 'Bine ai revenit',
    },
    '0nxag4n8': {
      'en': 'Fill out the information below in order to access your account.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um auf Ihr Konto zuzugreifen.',
      'es': 'Complete la información a continuación para acceder a su cuenta.',
      'fr':
          'Remplissez les informations ci-dessous afin d\'accéder à votre compte.',
      'hu': 'Töltse ki az alábbi adatokat, hogy hozzáférjen fiókjához.',
      'ro': 'Completați informațiile de mai jos pentru a vă accesa contul.',
    },
    '84jvd8bn': {
      'en': 'Email',
      'de': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'hu': 'Email',
      'ro': 'E-mail',
    },
    'enhgynew': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'hu': 'Jelszó',
      'ro': 'Parola',
    },
    'wx3uz9r0': {
      'en': 'Sign In',
      'de': 'Anmelden',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
      'hu': 'Bejelentkezés',
      'ro': 'Conectare',
    },
    'xqwib8b9': {
      'en': 'Or sign in with',
      'de': 'Oder melden Sie sich an mit',
      'es': 'O inicia sesión con',
      'fr': 'Ou connectez-vous avec',
      'hu': 'Vagy jelentkezzen be',
      'ro': 'Sau conectați-vă cu',
    },
    'igvei0am': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
      'es': 'Continuar con Google',
      'fr': 'Continuer avec Google',
      'hu': 'Folytassa a Google-lal',
      'ro': 'Continuați cu Google',
    },
    '0zt31doh': {
      'en': 'Continue with Apple',
      'de': 'Weiter mit Apple',
      'es': 'Continuar con Apple',
      'fr': 'Continuer avec Apple',
      'hu': 'Folytassa az Apple-lel',
      'ro': 'Continuați cu Apple',
    },
    'y04zxbzx': {
      'en': 'Don\'t have an account?  ',
      'de': 'Sie haben noch kein Konto?',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
      'hu': 'Nincs fiókja?',
      'ro': 'Nu ai un cont?',
    },
    'uhc2hkxz': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
      'hu': 'Fiók létrehozása',
      'ro': 'Creează cont',
    },
    '7cykiz8y': {
      'en': 'Forgot password?',
      'de': 'Passwort vergessen?',
      'es': '¿Has olvidado tu contraseña?',
      'fr': 'Mot de passe oublié?',
      'hu': 'Elfelejtetted a jelszavad?',
      'ro': 'Aţi uitat parola?',
    },
    '3idmtsl1': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // auth_2_ForgotPassword
  {
    'zhqjbut3': {
      'en': 'Forgot Password',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
      'hu': 'Elfelejtett jelszó',
      'ro': 'Aţi uitat parola',
    },
    '7p22ojrz': {
      'en':
          'Please fill out your email below in order to recieve a reset password link.',
      'de':
          'Bitte geben Sie unten Ihre E-Mail-Adresse ein, um einen Link zum Zurücksetzen des Passworts zu erhalten.',
      'es':
          'Complete su correo electrónico a continuación para recibir un enlace para restablecer la contraseña.',
      'fr':
          'Veuillez remplir votre e-mail ci-dessous afin de recevoir un lien de réinitialisation du mot de passe.',
      'hu':
          'Kérjük, töltse ki az alábbi e-mail-címét, hogy megkapja a jelszó-visszaállítási linket.',
      'ro':
          'Vă rugăm să completați adresa de e-mail de mai jos pentru a primi un link pentru resetarea parolei.',
    },
    'hgcp35sa': {
      'en': 'Email',
      'de': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'hu': 'Email',
      'ro': 'E-mail',
    },
    'gabv3nyg': {
      'en': 'Send Reset Link',
      'de': 'Link zum Zurücksetzen senden',
      'es': 'Enviar enlace de reinicio',
      'fr': 'Envoyer le lien de réinitialisation',
      'hu': 'Reset Link küldése',
      'ro': 'Trimite linkul de resetare',
    },
    '9rdc3jmk': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // auth_2_createProfile
  {
    'qpyqitiv': {
      'en': 'Create Profile',
      'de': 'Profil erstellen',
      'es': 'Crear perfil',
      'fr': 'Créer un profil',
      'hu': 'Profil létrehozása',
      'ro': 'Creeaza un profil',
    },
    'x2j2fib3': {
      'en': 'Save & Continue',
      'de': 'Speichern fortsetzen',
      'es': 'Guardar Continuar',
      'fr': 'Enregistrer continuer',
      'hu': 'Mentés és folytatás',
      'ro': 'Salvați și continuați',
    },
    '5r3vhfoq': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // auth_2_Profile
  {
    '9ok6slnf': {
      'en': 'Your Account',
      'de': 'Ihr Konto',
      'es': 'Su cuenta',
      'fr': 'Votre compte',
      'hu': 'Fiókja',
      'ro': 'Contul tău',
    },
    'oik6eegq': {
      'en': 'Edit Profile',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
      'hu': 'Profil szerkesztése',
      'ro': 'Editează profilul',
    },
    'kkreabzf': {
      'en': 'App Settings',
      'de': 'App Einstellungen',
      'es': 'Ajustes de Aplicacion',
      'fr': 'Paramètres de l\'application',
      'hu': 'Alkalmazásbeállítások',
      'ro': 'Setările aplicației',
    },
    '8nnnu93n': {
      'en': 'Support',
      'de': 'Unterstützung',
      'es': 'Apoyo',
      'fr': 'Soutien',
      'hu': 'Támogatás',
      'ro': 'A sustine',
    },
    'k8shg4gg': {
      'en': 'Terms of Service',
      'de': 'Nutzungsbedingungen',
      'es': 'Términos de servicio',
      'fr': 'Conditions d\'utilisation',
      'hu': 'Szolgáltatás feltételei',
      'ro': 'Termenii serviciului',
    },
    'loo2pm2e': {
      'en': 'Log Out',
      'de': 'Ausloggen',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
      'hu': 'Kijelentkezés',
      'ro': 'Deconectați-vă',
    },
    'pyvixkkk': {
      'en': 'Profile',
      'de': 'Profil',
      'es': 'Perfil',
      'fr': 'Profil',
      'hu': 'Profil',
      'ro': 'Profil',
    },
    'mnf2s1vt': {
      'en': 'Profile',
      'de': 'Profil',
      'es': 'Perfil',
      'fr': 'Profil',
      'hu': 'Profil',
      'ro': 'Profil',
    },
  },
  // auth_2_EditProfile
  {
    '8w69e6th': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hu': 'itthon',
      'ro': 'Acasă',
    },
  },
  // Shelter1
  {
    'cy480mbm': {
      'en': 'Find Us Here',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '5g2j7166': {
      'en': 'ADAPOST CONSILIUL  LOCAL  BAIA  MARE',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'truxnhrj': {
      'en': 'Open Hours: 8am - 4pm L-V\n                      8am - 12am S-D',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '8x3pdt33': {
      'en': 'Contact: +40 743 114 488',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '5psjvou7': {
      'en': 'Email: office@salvati-animalele.ro',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'ia6nk94m': {
      'en': 'Address: Municipiul Baia Mare, strada Iazului, nr. 2',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'rqx3pcgw': {
      'en': 'Capacitatea maxima de cazare in adapost: 417',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'qnrfoqqj': {
      'en': 'About Us',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'bxjbwqiy': {
      'en':
          '\nOur Mission\nAt Adapostul din Baia Mare, our mission is to rescue, rehabilitate, and rehome animals in need. We strive to reduce the stray animal population through effective community education, spaying and neutering programs, and by facilitating adoptions to loving, permanent homes. We believe every animal deserves a chance at a happy, healthy life, free from suffering and neglect.\n\nOur Services\nAnimal Shelter and Care: Our shelter provides a safe and nurturing environment for animals until they find their forever homes. We ensure all animals receive proper veterinary care, including vaccinations, treatments, and surgeries as needed.\n\nAdoption Services: We work tirelessly to match our animals with the right families. Our adoption process includes thorough vetting to ensure the best possible fit for both the animal and the adopter.\n\nSpay and Neuter Programs: To combat overpopulation, we offer spay and neuter services to the community at reduced or no cost. These programs are essential in preventing unwanted litters and reducing the number of homeless animals.\n\nRescue Operations: Our team is equipped to handle rescue operations for animals in distress, including those that are abandoned, abused, or injured. We work closely with local authorities and other organizations to ensure animals in need receive timely and effective help.\n\nGet Involved\nThere are many ways you can support our mission and help make a difference in the lives of animals:\n\nAdopt: Give a homeless animal a loving home.\n\nDonate: Your financial support allows us to continue providing essential services to animals in need.\n\nVolunteer: Join our team of dedicated volunteers and assist with daily operations, events, and animal care.\n\nFoster: Provide temporary homes for animals in need of extra care until they are ready for adoption.\n\nSpread the Word: Advocate for animal welfare and share our mission with your network.',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'gvz5390w': {
      'en': 'Shelter Information',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
  },
  // Shelter1Copy
  {
    '0l7bu19o': {
      'en': 'Find Us Here',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '8he7u4h6': {
      'en': 'ADAPOST BAIA SPRIE',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'lh7ja6lm': {
      'en': 'Open Hours: 8am - 4pm L-V\n                      10am - 12am S-D',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'v3qdeea5': {
      'en': 'Contact: +40 0746 537 335',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '1cu5arow': {
      'en': 'Address: Primaria Baia Sprie, str. Stefan cel Mare, nr. 17',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'pfdruyva': {
      'en': 'Capacitatea maxima de cazare in adapost: 7',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'v2mjfo2u': {
      'en': 'About Us',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'v91w63gz': {
      'en':
          'Our Mission\n\nOur mission at Adapostul din Baia Sprie is to rescue, rehabilitate, and find loving homes for animals in need. We are committed to reducing the stray animal population through community education, spaying and neutering programs, and facilitating adoptions. We believe that every animal deserves a chance to live a happy, healthy life free from harm and neglect.\n\nOur Services\n\nAnimal Shelter and Care: Our shelter offers a secure and caring environment for animals until they can be adopted. We ensure all animals receive necessary veterinary care, including vaccinations, treatments, and surgeries.\n\nAdoption Services: We work to match animals with suitable families. Our adoption process involves careful vetting to ensure the best fit for both the animal and the adopter.\n\nSpay and Neuter Programs: To address overpopulation, we provide spay and neuter services to the community, often at reduced or no cost. These programs are crucial in preventing unwanted litters and reducing the number of homeless animals.\n\nCommunity Education: We believe that education is essential for fostering a compassionate community. Our initiatives include school programs, community events, and workshops on animal care, welfare, and responsible pet ownership.\n\nRescue Operations: Our team is equipped to handle rescues of animals in distress, including those that are abandoned, abused, or injured. We collaborate with local authorities and other organizations to ensure timely and effective assistance for animals in need.\n\nGet Involved\nThere are many ways to support our mission and make a difference in the lives of animals:\n\nAdopt: Provide a loving home to a homeless animal.\n\nDonate: Your financial support helps us continue to provide essential services to animals in need.\n\nVolunteer: Join our team of dedicated volunteers and help with daily operations, events, and animal care.\n\nFoster: Offer temporary homes for animals needing extra care until they are ready for adoption.\n\nSpread the Word: Advocate for animal welfare and share our mission within your community.',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'enrrfhoo': {
      'en': 'Shelter Information',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
  },
  // Shelter1Copy2
  {
    '35tfulz0': {
      'en': 'Find Us Here',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'hvqvt7bl': {
      'en':
          'PRIMĂRIA  ORAŞULUI  SIGHETU  MARMAŢIEI – SERVICIUL  DE  GESTIONARE CFS',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '973551qu': {
      'en': 'Open Hours: 10am - 6pm L-V',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'zauaz07k': {
      'en': 'Contact: +40 0729 632 468, +40 0262 311 001',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '4cn3nx3f': {
      'en': 'Municipiul Sighetu Marmației, str. Nicolae Titulescu, FN',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '2p2tus26': {
      'en': 'Capacitatea maxima de cazare in adapost: 80',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'wcgkrfff': {
      'en': 'About Us',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'wk8xszxt': {
      'en':
          '\nOur Mission\nAt Adapostul din Sighetul Marmatiei  our mission is to rescue, rehabilitate, and rehome animals in need. We strive to reduce the stray animal population through effective community education, spaying and neutering programs, and by facilitating adoptions to loving, permanent homes. We believe every animal deserves a chance at a happy, healthy life, free from suffering and neglect.\n\nOur Services\nAnimal Shelter and Care: Our shelter provides a safe and nurturing environment for animals until they find their forever homes. We ensure all animals receive proper veterinary care, including vaccinations, treatments, and surgeries as needed.\n\nAdoption Services: We work tirelessly to match our animals with the right families. Our adoption process includes thorough vetting to ensure the best possible fit for both the animal and the adopter.\n\nSpay and Neuter Programs: To combat overpopulation, we offer spay and neuter services to the community at reduced or no cost. These programs are essential in preventing unwanted litters and reducing the number of homeless animals.\n\nRescue Operations: Our team is equipped to handle rescue operations for animals in distress, including those that are abandoned, abused, or injured. We work closely with local authorities and other organizations to ensure animals in need receive timely and effective help.\n\nGet Involved\nThere are many ways you can support our mission and help make a difference in the lives of animals:\n\nAdopt: Give a homeless animal a loving home.\n\nDonate: Your financial support allows us to continue providing essential services to animals in need.\n\nVolunteer: Join our team of dedicated volunteers and assist with daily operations, events, and animal care.\n\nFoster: Provide temporary homes for animals in need of extra care until they are ready for adoption.\n\nSpread the Word: Advocate for animal welfare and share our mission with your network.',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'tmckm1lv': {
      'en': 'Shelter Information',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
  },
  // Messagesent
  {
    'k6rtw1s4': {
      'en': 'Message succesfully sent',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '7v68h32p': {
      'en': 'Account',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '37pn7uzx': {
      'en': 'Receipt Details',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'yyxcc92s': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
  },
  // Comments
  {
    '47yju9at': {
      'en': 'Create Note',
      'de': 'Notiz erstellen',
      'es': 'Crear nota',
      'fr': 'Créer une note',
      'hu': 'Jegyzet létrehozása',
      'ro': 'Creați o notă',
    },
    'wlo0dq40': {
      'en': 'Label here...',
      'de': 'Etikett hier...',
      'es': 'Etiqueta aquí...',
      'fr': 'Étiquetez ici...',
      'hu': 'Címke itt...',
      'ro': 'Etichetați aici...',
    },
  },
  // editProfile_auth_2
  {
    'gl946lx6': {
      'en': 'Adjust the content below to update your profile.',
      'de': 'Passen Sie den Inhalt unten an, um Ihr Profil zu aktualisieren.',
      'es': 'Ajuste el contenido a continuación para actualizar su perfil.',
      'fr': 'Ajustez le contenu ci-dessous pour mettre à jour votre profil.',
      'hu': 'Módosítsa az alábbi tartalmat profilja frissítéséhez.',
      'ro': 'Ajustați conținutul de mai jos pentru a vă actualiza profilul.',
    },
    'tyncpkkc': {
      'en': 'Change Photo',
      'de': 'Foto ändern',
      'es': 'Cambiar foto',
      'fr': 'Changer la photo',
      'hu': 'Fotó megváltoztatása',
      'ro': 'Schimbare fotografie',
    },
    '54j7or2p': {
      'en': 'Full Name',
      'de': 'Vollständiger Name',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
      'hu': 'Teljes név',
      'ro': 'Numele complet',
    },
    'wujp3ee8': {
      'en': 'Your full name...',
      'de': 'Ihr vollständiger Name...',
      'es': 'Tu nombre completo...',
      'fr': 'Ton nom complet...',
      'hu': 'A teljes neved...',
      'ro': 'Numele tău complet...',
    },
    '8qzuzc5i': {
      'en': 'Owner/Founder',
      'de': 'Eigentümer/Gründer',
      'es': 'Propietario/Fundador',
      'fr': 'Propriétaire/Fondateur',
      'hu': 'Tulajdonos/alapító',
      'ro': 'Proprietar/Fondator',
    },
    'ru31n2s8': {
      'en': 'Director',
      'de': 'Direktor',
      'es': 'Director',
      'fr': 'Directeur',
      'hu': 'Rendező',
      'ro': 'Director',
    },
    '1ccpymqx': {
      'en': 'Manager',
      'de': 'Manager',
      'es': 'Gerente',
      'fr': 'Directeur',
      'hu': 'Menedzser',
      'ro': 'Administrator',
    },
    '3qjvftsz': {
      'en': 'Mid-Manager',
      'de': 'Mittlere Führungsebene',
      'es': 'Gerente medio',
      'fr': 'Manager intermédiaire',
      'hu': 'Középvezető',
      'ro': 'Manager mediu',
    },
    '08lr3nm2': {
      'en': 'Employee',
      'de': 'Mitarbeiter',
      'es': 'Empleado',
      'fr': 'Employé',
      'hu': 'Munkavállaló',
      'ro': 'Angajat',
    },
    'nyptmcni': {
      'en': 'Your Role',
      'de': 'Deine Rolle',
      'es': 'Tu rol',
      'fr': 'Ton rôle',
      'hu': 'A te szereped',
      'ro': 'Rolul tau',
    },
    '77kja728': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
      'hu': 'Tétel keresése...',
      'ro': 'Căutați un articol...',
    },
    '1j244x48': {
      'en': 'Short Description',
      'de': 'kurze Beschreibung',
      'es': 'Breve descripción',
      'fr': 'brève description',
      'hu': 'Rövid leírás',
      'ro': 'scurta descriere',
    },
    '6fawc310': {
      'en': 'A little about you...',
      'de': 'Ein bisschen über Sie …',
      'es': 'Un poco sobre ti...',
      'fr': 'Un peu de toi...',
      'hu': 'Egy kicsit rólad...',
      'ro': 'Un pic despre tine...',
    },
  },
  // Miscellaneous
  {
    'ecthvdvq': {
      'en': 'Permiteți accesul la Camera?',
      'de': '7',
      'es': '7',
      'fr': '7',
      'hu': '7',
      'ro': '7',
    },
    'z7prznum': {
      'en': 'Permiteți accesul la Galerie?',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'o8els5kp': {
      'en': 'Permiteți accesul la Galerie?',
      'de': 'Dürfen Sie die Galerie betreten?',
      'es': '¿Permite acceder a la galería?',
      'fr': 'Permiteți accéder à la Galerie?',
      'hu': 'Engedélyezi a Galerie hozzáférését?',
      'ro': 'Permiteți accesul la Galerie?',
    },
    'p66nhb42': {
      'en': 'Permiteți primirea notificărilor?',
      'de': 'Ist die Erstbenachrichtigung zulässig?',
      'es': '¿Permitirá primirea notificărilor?',
      'fr': 'Permettre la première notification ?',
      'hu': 'Permiteți primirea notificărilor?',
      'ro': 'Permiteți primirea notificărilor?',
    },
    'o0y4935r': {
      'en': 'Permiteți accesul la Contactele dvs.?',
      'de': 'Erlauben Sie den Zugriff auf den DVS-Kontakt?',
      'es': '¿Permitirá acceder a los contactos dvs.?',
      'fr': 'Permiteți accesul les Contactele dvs.?',
      'hu': 'Engedélyezi a Contactele dvs hozzáférést?',
      'ro': 'Permiteți accesul la Contactele dvs.?',
    },
    'phl5cdqr': {
      'en': 'Permiteți accesul la Camera Photo?',
      'de': 'Erlauben Sie den Zugriff auf die Fotokamera?',
      'es': '¿Permite acceder a la cámara de fotos?',
      'fr': 'Permiteți accesul la Camera Photo?',
      'hu': 'Engedélyezi a Camera Photo hozzáférést?',
      'ro': 'Permiteți accesul la Camera Photo?',
    },
    '2yrad3w4': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'as5ooyb9': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'yjjjxy1y': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '9waldd69': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'p447oqes': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'ofabdgae': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '5vs46drt': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'pxuuflin': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '2knxo7a1': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '5dowtu34': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '8iqbaszn': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'tu4wwyhb': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'zry0ybs7': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'w6fvv30r': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'meeadrmq': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '8zq1teyb': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '5rffx1gk': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '9ztkzfrb': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'svr2kwmf': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'kg29qcyh': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '7dnecs42': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'dfxw32iv': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    '8qaq5syl': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'w8fi3ix0': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
    'z8lhuvr5': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'hu': '',
      'ro': '',
    },
  },
].reduce((a, b) => a..addAll(b));
