String convertType(int value) {
    const units = <int, String>{
      100000000: 'B',
      1000000: 'M',
      1000: 'K',
    };
    return units.entries.map((e) => '${value ~/ e.key}${e.value}').firstWhere(
        (element) => !element.startsWith('0'),
        orElse: () => '$value');
  }