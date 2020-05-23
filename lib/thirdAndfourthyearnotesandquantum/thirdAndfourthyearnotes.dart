import "package:flutter/material.dart";
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Notes3and4 extends StatefulWidget {
  final String subject;
  Notes3and4({Key key, @required this.subject}) : super(key: key);
  @override
  _Notes3and4State createState() => _Notes3and4State();
}

class _Notes3and4State extends State<Notes3and4> {
  String compilerdesignq_unit1 =
      "https://drive.google.com/open?id=1Gimg4pwIMNu48Rt1Ff9FjqaOqzh4pUaY";

  String compilerdesignq_unit2 =
      "https://drive.google.com/open?id=1GwQfzutdUANQZk8lvd1hlSxmH5ljjqSC";
  String compilerdesignq_unit3 =
      "https://drive.google.com/open?id=1GgTlgkgwYkygxF6o0SE_b7LMcgLFffku";
  String compilerdesignq_unit4 =
      "https://drive.google.com/open?id=1GuBmYyq1AlU231yrhw1NJ08bas15ziFm";

  //for indistrial managaemnt
  String IMqunit1 =
      "https://drive.google.com/open?id=1G-YnH5XuzsvBVXfvqWhb90aLCNvI38cW";
  String IMqunit2 =
      "https://drive.google.com/open?id=1FsN2kxjVUch53yPq8oRcLCGu1pAaMumr";
  String IMqunit3 =
      "https://drive.google.com/open?id=1Q5ObsE4Z_ED2vlmpn553ndpH8HTClPDd";
  String IMqunit4 =
      "https://drive.google.com/open?id=1QF1yh1WxErP_YivU-T_Bz1_ozVexfhnd";

  String IMqunit5 =
      "https://drive.google.com/open?id=1QQ8OrNI4nUgHuGXO0VtwXSZmEQXTXL2Y";

  String computergraphicsq =
      "https://drive.google.com/open?id=1FEtOmaPNnKtVZCk55JxNOx03e-yQygJk";

  String computernetworkunit1q =
      "https://drive.google.com/open?id=1Gah0YqYCNPdtiZnoeiOptdfW0VCEXg7g";

  String computernetworkq =
      "https://drive.google.com/open?id=1QnNOSNt66UYhBl7a4t8CT-hnt38g09SW";

  String IndustrialSocioology_qunit1 =
      "https://drive.google.com/open?id=1OlIu3NwN5Rn1DdYBla3sf1aQPUEHppUV";

  String IndustrialSocioology_qunit2 =
      "https://drive.google.com/open?id=1OyOLTJIJ9t-g08rEoi2IIHan_7GY0eZw";

  String IndustrialSocioology_qunit3 =
      "https://drive.google.com/open?id=1PDQPrS2fVag_zQhKZbzI7HEcgyoHecOY";

  String IndustrialSocioology_qunit4 =
      "https://drive.google.com/open?id=1PpZEiIb7N5Bi2vzlpjbtxGHfRV_uxuRT";

  String IndustrialSocioology_qunit5 =
      "https://drive.google.com/open?id=1PRIznyQKjNeim7DuvBhkXtiOUwoA6Nmg";

  //fourth year quantum

  String Distributessystemq_unit1 =
      "https://drive.google.com/open?id=1NObmzaiEEgvc0P4AUZkoNR51zAAIbLMt";
  String Distributessystemq_unit2 =
      "https://drive.google.com/open?id=1NUhIZz0oRV2ELqahL3qtY4sYz-ziXutL";
  String Distributessystemq_unit3 =
      "https://drive.google.com/open?id=1NcJ2q0cxFbd-9cyn-GWDKca6TJv__3Xt";
  String Distributessystemq_unit4 =
      "https://drive.google.com/open?id=1NhcKHmO0egROHXxzC7FjTLP_EHuM6YWs";
  String Distributessystemq_unit5 =
      "https://drive.google.com/open?id=1NtxRcigFrq3ZcirUgyGOrwYnXwsJukmu";

  String cloudcomputingq =
      "https://drive.google.com/open?id=1MPrOrPBs-_mzcRBRkQi3NgiYmUjrnJM8";

  String datacomressionq =
      "https://drive.google.com/open?id=1MZIUVTFWDTM0nPxlvMnlDuXi05EqXUyO";

  String machinelearningq =
      "https://drive.google.com/open?id=1MiXblQKEb2VusNzwEBOY23Kuzc3bmXvo";

  String humancoumpterinterfaceq =
      "https://drive.google.com/open?id=1Ms5TnW28Whm9MKNyeUGN8KAnSE0SxbAX";

  String understandingthehumanbeingq =
      "https://drive.google.com/open?id=1Mx4aAv0g2T6tutm6gS0jIB_8EaU3cauM";

  String Mysubject() {
    if (widget.subject == "compilerdesignq_unit1") {
      return (compilerdesignq_unit1);
    } else if (widget.subject == "compilerdesignq_unit2") {
      return (compilerdesignq_unit2);
    } else if (widget.subject == "compilerdesignq_unit3") {
      return (compilerdesignq_unit3);
    } else if (widget.subject == "compilerdesignq_unit4") {
      return (compilerdesignq_unit4);
    } else if (widget.subject == "IMqunit1") {
      return (IMqunit1);
    } else if (widget.subject == "IMqunit2") {
      return (IMqunit2);
    } else if (widget.subject == "IMqunit3") {
      return (IMqunit3);
    }else if (widget.subject == "IMqunit4") {
      return (IMqunit4);
    }else if (widget.subject == "IMqunit5") {
      return (IMqunit5);
    }
    else if (widget.subject == "computergraphicsq") {
      return (computergraphicsq);
    } else if (widget.subject == "computernetworkq ") {
      return (computernetworkq);
    } else if (widget.subject == "Distributessystemq_unit1") {
      return (Distributessystemq_unit1);
    } else if (widget.subject == "Distributessystemq_unit2") {
      return (Distributessystemq_unit2);
    } else if (widget.subject == "Distributessystemq_unit3") {
      return (Distributessystemq_unit3);
    } else if (widget.subject == "Distributessystemq_unit4") {
      return (Distributessystemq_unit4);
    } else if (widget.subject == "Distributessystemq_unit5") {
      return (Distributessystemq_unit5);
    } else if (widget.subject == "cloudcomputingq") {
      return (cloudcomputingq);
    } else if (widget.subject == "datacomressionq") {
      return (datacomressionq);
    } else if (widget.subject == "machinelearningq") {
      return (machinelearningq);
    } else if (widget.subject == "humancoumpterinterfaceq") {
      return (humancoumpterinterfaceq);
    } else if (widget.subject == "understandingthehumanbeingq") {
      return (understandingthehumanbeingq);
    } else if (widget.subject == "IndustrialSocioology_qunit1") {
      return (IndustrialSocioology_qunit1);
    } else if (widget.subject == "IndustrialSocioology_qunit2") {
      return (IndustrialSocioology_qunit2);
    }else if (widget.subject == "IndustrialSocioology_qunit3") {
      return (IndustrialSocioology_qunit3);
    }else if (widget.subject == "IndustrialSocioology_qunit4") {
      return (IndustrialSocioology_qunit4);
    }else if (widget.subject == "IndustrialSocioology_qunit5") {
      return (IndustrialSocioology_qunit5);
    }
    else {
      return (computernetworkq);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.subject),
        ),
        body: WebView(
          initialUrl: Mysubject(),
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
