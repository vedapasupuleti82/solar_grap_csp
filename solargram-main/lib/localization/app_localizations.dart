import 'package:flutter/material.dart';

class AppLocalizations extends ChangeNotifier {
  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'SolarGram',
      'heroTitle': 'Switch to Solar.\nSave Money.',
      'heroSubtitle': 'Empowering rural communities with smart, affordable solar energy solutions.',
      'getStarted': 'Calculate Savings',
      'benefitsTitle': 'Why Go Solar?',
      'benefit1': 'Massive Bill Reductions',
      'benefit1Desc': 'Cut your electricity bills by up to 90%',
      'benefit2': 'Govt. Subsidies (40%+)',
      'benefit2Desc': 'Avail central & state subsidies easily',
      'benefit3': 'Energy Independence',
      'benefit3Desc': 'No more power cuts or voltage issues',
      'quickActions': 'Quick Actions',
      'actionCalculator': 'Savings Calculator',
      'actionSchemes': 'Govt Schemes',
      'actionEligibility': 'Check Eligibility',
      'actionInstall': 'Request Install',
      
      // Calculator
      'calcTitle': 'Savings Estimator',
      'calcSubtitle': 'See how much you can really save.',
      'monthlyBillLabel': 'Average Monthly Bill (₹)',
      'monthlyBillHint': 'e.g. 2000',
      'calculateBtn': 'Reveal My Savings',
      'sysSize': 'System Size',
      'totalCost': 'Total Cost',
      'subsidy': 'Govt Subsidy',
      'yourCost': 'Your Final Cost',
      'monthlySave': 'Monthly Savings',
      'payback': 'Payback Time',
      
      // Schemes
      'schemesTitle': 'Available Govt Schemes',
      'pmSuryaGhar': 'PM Surya Ghar: Muft Bijli Yojana',
      'pmKusum': 'PM KUSUM Scheme',
      
      // Eligibility
      'eligibilityTitle': 'Eligibility Checker',
    },
    'te': {
      'appTitle': 'సోలార్‌గ్రామ్',
      'heroTitle': 'సోలార్‌కి మారండి.\nడబ్బు ఆదా చేయండి.',
      'heroSubtitle': 'గ్రామీణ ప్రాంతాలకు స్మార్ట్, సరసమైన సోలార్ విద్యుత్ పరిష్కారాలు.',
      'getStarted': 'పొదుపును లెక్కించండి',
      'benefitsTitle': 'సోలార్ ఎందుకు?',
      'benefit1': 'భారీగా బిల్లు తగ్గింపు',
      'benefit1Desc': 'మీ విద్యుత్ బిల్లులను 90% వరకు తగ్గించుకోండి',
      'benefit2': 'ప్రభుత్వ సబ్సిడీ (40%+)',
      'benefit2Desc': 'కేంద్ర & రాష్ట్ర సబ్సిడీలను పొందండి',
      'benefit3': 'విద్యుత్ స్వాతంత్ర్యం',
      'benefit3Desc': 'కరెంట్ కోతలు ఇక ఉండవు',
      'quickActions': 'శీఘ్ర చర్యలు',
      'actionCalculator': 'పొదుపు కాలిక్యులేటర్',
      'actionSchemes': 'ప్రభుత్వ పథకాలు',
      'actionEligibility': 'అర్హతను తనిఖీ చేయండి',
      'actionInstall': 'ఇన్‌స్టాలేషన్ అభ్యర్థించండి',
      
      // Calculator
      'calcTitle': 'పొదుపు అంచనా',
      'calcSubtitle': 'మీరు ఎంత ఆదా చేయగలరో కనుక్కోండి.',
      'monthlyBillLabel': 'నెలవారీ కరెంట్ బిల్లు (₹)',
      'monthlyBillHint': 'ఉదా. 2000',
      'calculateBtn': 'నా పొదుపును చూపించు',
      'sysSize': 'సిస్టమ్ పరిమాణం',
      'totalCost': 'మొత్తం ఖర్చు',
      'subsidy': 'ప్రభుత్వ సబ్సిడీ',
      'yourCost': 'మీ ఖర్చు',
      'monthlySave': 'నెలవారీ పొదుపు',
      'payback': 'తిరిగి చెల్లించే సమయం',
      
      // Schemes
      'schemesTitle': 'ప్రభుత్వ పథకాలు',
      'pmSuryaGhar': 'PM సూర్య ఘర్: ముఫ్త్ బిజిలీ యోజన',
      'pmKusum': 'PM KUSUM పథకం',
      
      // Eligibility
      'eligibilityTitle': 'అర్హత చెకర్',
    },
  };

  String _currentLang = 'en';

  String get currentLang => _currentLang;

  void setLang(String lang) {
    if (_localizedValues.containsKey(lang)) {
      _currentLang = lang;
      notifyListeners();
    }
  }

  String translate(String key) {
    return _localizedValues[_currentLang]?[key] ?? _localizedValues['en']![key] ?? key;
  }
}
