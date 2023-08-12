import 'package:currency_formatter/currency_formatter.dart';

String formatCurrency({required String? currency}) {
  CurrencyFormatterSettings formaterSetting = CurrencyFormatterSettings(
    symbol: 'ZTX',
    symbolSide: SymbolSide.right,
    thousandSeparator: '.',
    decimalSeparator: ',',
    symbolSeparator: ' ',
  );
  return CurrencyFormatter.format(currency, formaterSetting);
}
