//
//  CurrencyList.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/3/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#define CURRENCY_UAEDIRHAM @"UAE Dirham"
#define CURRENCY_ALBANIANLEK @"Albanian Lek"
#define CURRENCY_NETHANTILLESGUILDER @"Neth Antilles Guilder"
#define CURRENCY_ARGENTINEPESO @"Argentine Peso"
#define CURRENCY_AUSTRALIANDOLLAR @"Australian Dollar"
#define CURRENCY_ARUBAFLORIN @"Aruba Florin"
#define CURRENCY_BARBADOSDOLLAR @"Barbados Dollar"
#define CURRENCY_BANGLADESHTAKA @"Bangladesh Taka"
#define CURRENCY_BULGARIANLEV @"Bulgarian Lev"
#define CURRENCY_BAHRAINIDINAR @"Bahraini Dinar"
#define CURRENCY_BURUNDIFRANC @"Burundi Franc"
#define CURRENCY_BERMUDADOLLAR @"Bermuda Dollar"
#define CURRENCY_BRUNEIDOLLAR @"Brunei Dollar"
#define CURRENCY_BOLIVIANBOLIVIANO @"Bolivian Boliviano"
#define CURRENCY_BRAZILIANREAL @"Brazilian Real"
#define CURRENCY_BAHAMIANDOLLAR @"Bahamian Dollar"
#define CURRENCY_BHUTANNGULTRUM @"Bhutan Ngultrum"
#define CURRENCY_BOTSWANAPULA @"Botswana Pula"
#define CURRENCY_BELARUSRUBLE @"Belarus Ruble"
#define CURRENCY_BELIZEDOLLAR @"Belize Dollar"
#define CURRENCY_CANADIANDOLLAR @"Canadian Dollar"
#define CURRENCY_SWISSFRANC @"Swiss Franc"
#define CURRENCY_CHILEANPESO @"Chilean Peso"
#define CURRENCY_CHINESEYUAN @"Chinese Yuan"
#define CURRENCY_COLOMBIANPESO @"Colombian Peso"
#define CURRENCY_COSTARICACOLON @"Costa Rica Colon"
#define CURRENCY_CUBANPESO @"Cuban Peso"
#define CURRENCY_CAPEVERDEESCUDO @"Cape Verde Escudo"
#define CURRENCY_CZECHKORUNA @"Czech Koruna"
#define CURRENCY_DIJIBOUTIFRANC @"Dijibouti Franc"
#define CURRENCY_DANISHKRONE @"Danish Krone"
#define CURRENCY_DOMINICANPESO @"Dominican Peso"
#define CURRENCY_ALGERIANDINAR @"Algerian Dinar"
#define CURRENCY_ESTONIANKROON @"Estonian Kroon"
#define CURRENCY_EGYPTIANPOUND @"Egyptian Pound"
#define CURRENCY_ETHIOPIANBIRR @"Ethiopian Birr"
#define CURRENCY_EURO @"Euro"
#define CURRENCY_FIJIDOLLAR @"Fiji Dollar"
#define CURRENCY_FALKLANDISLANDSPOUND @"Falkland Islands Pound"
#define CURRENCY_BRITISHPOUND @"British Pound"
#define CURRENCY_GIBRALTARPOUND @"Gibraltar Pound"
#define CURRENCY_GAMBIANDALASI @"Gambian Dalasi"
#define CURRENCY_GUINEAFRANC @"Guinea Franc"
#define CURRENCY_GUATEMALAQUETZAL @"Guatemala Quetzal"
#define CURRENCY_GUYANADOLLAR @"Guyana Dollar"
#define CURRENCY_HONGKONGDOLLAR @"Hong Kong Dollar"
#define CURRENCY_HONDURASLEMPIRA @"Honduras Lempira"
#define CURRENCY_CROATIANKUNA @"Croatian Kuna"
#define CURRENCY_HAITIGOURDE @"Haiti Gourde"
#define CURRENCY_HUNGARIANFORINT @"Hungarian Forint"
#define CURRENCY_INDONESIANRUPIAH @"Indonesian Rupiah"
#define CURRENCY_ISRAELISHEKEL @"Israeli Shekel"
#define CURRENCY_INDIANRUPEE @"Indian Rupee"
#define CURRENCY_IRAQIDINAR @"Iraqi Dinar"
#define CURRENCY_IRANRIAL @"Iran Rial"
#define CURRENCY_ICELANDKRONA @"Iceland Krona"
#define CURRENCY_JAMAICANDOLLAR @"Jamaican Dollar"
#define CURRENCY_JORDANIANDINAR @"Jordanian Dinar"
#define CURRENCY_JAPANESEYEN @"Japanese Yen"
#define CURRENCY_KENYANSHILLING @"Kenyan Shilling"
#define CURRENCY_CAMBODIARIEL @"Cambodia Riel"
#define CURRENCY_COMOROSFRANC @"Comoros Franc"
#define CURRENCY_NORTHKOREANWON @"North Korean Won"
#define CURRENCY_KOREANWON @"Korean Won"
#define CURRENCY_KUWAITIDINAR @"Kuwaiti Dinar"
#define CURRENCY_CAYMANISLANDSDOLLAR @"Cayman Islands Dollar"
#define CURRENCY_KAZAKHSTANTENGE @"Kazakhstan Tenge"
#define CURRENCY_LAOKIP @"Lao Kip"
#define CURRENCY_LEBANESEPOUND @"Lebanese Pound"
#define CURRENCY_SRILANKARUPEE @"Sri Lanka Rupee"
#define CURRENCY_LIBERIANDOLLAR @"Liberian Dollar"
#define CURRENCY_LESOTHOLOTI @"Lesotho Loti"
#define CURRENCY_LITHUANIANLITA @"Lithuanian Lita"
#define CURRENCY_LATVIANLAT @"Latvian Lat"
#define CURRENCY_LIBYANDINAR @"Libyan Dinar"
#define CURRENCY_MOROCCANDIRHAM @"Moroccan Dirham"
#define CURRENCY_MOLDOVANLEU @"Moldovan Leu"
#define CURRENCY_MACEDONIANDENAR @"Macedonian Denar"
#define CURRENCY_MYANMARKYAT @"Myanmar Kyat"
#define CURRENCY_MONGOLIANTUGRIK @"Mongolian Tugrik"
#define CURRENCY_MACAUPATACA @"Macau Pataca"
#define CURRENCY_MAURITANIAOUGULYA @"Mauritania Ougulya"
#define CURRENCY_MAURITIUSRUPEE @"Mauritius Rupee"
#define CURRENCY_MALDIVESRUFIYAA @"Maldives Rufiyaa"
#define CURRENCY_MALAWIKWACHA @"Malawi Kwacha"
#define CURRENCY_MEXICANPESO @"Mexican Peso"
#define CURRENCY_MALAYSIANRINGGIT @"Malaysian Ringgit"
#define CURRENCY_NAMIBIANDOLLAR @"Namibian Dollar"
#define CURRENCY_NIGERIANNAIRA @"Nigerian Naira"
#define CURRENCY_NICARAGUACORDOBA @"Nicaragua Cordoba"
#define CURRENCY_NORWEGIANKRONE @"Norwegian Krone"
#define CURRENCY_NEPALESERUPEE @"Nepalese Rupee"
#define CURRENCY_NEWZEALANDDOLLAR @"New Zealand Dollar"
#define CURRENCY_OMANIRIAL @"Omani Rial"
#define CURRENCY_PANAMABALBOA @"Panama Balboa"
#define CURRENCY_PERUVIANNUEVOSOL @"Peruvian Nuevo Sol"
#define CURRENCY_PAPUANEWGUINEAKINA @"Papua New Guinea Kina"
#define CURRENCY_PHILIPPINEPESO @"Philippine Peso"
#define CURRENCY_PAKISTANIRUPEE @"Pakistani Rupee"
#define CURRENCY_POLISHZLOTY @"Polish Zloty"
#define CURRENCY_PARAGUAYANGUARANI @"Paraguayan Guarani"
#define CURRENCY_QATARRIAL @"Qatar Rial"
#define CURRENCY_ROMANIANNEWLEU @"Romanian New Leu"
#define CURRENCY_RUSSIANROUBLE @"Russian Rouble"
#define CURRENCY_RWANDAFRANC @"Rwanda Franc"
#define CURRENCY_SAUDIARABIANRIYAL @"Saudi Arabian Riyal"
#define CURRENCY_SOLOMONISLANDSDOLLAR @"Solomon Islands Dollar"
#define CURRENCY_SEYCHELLESRUPEE @"Seychelles Rupee"
#define CURRENCY_SWEDISHKRONA @"Swedish Krona"
#define CURRENCY_SINGAPOREDOLLAR @"Singapore Dollar"
#define CURRENCY_STHELENAPOUND @"St Helena Pound"
#define CURRENCY_SLOVAKKORUNA @"Slovak Koruna"
#define CURRENCY_SIERRALEONELEONE @"Sierra Leone Leone"
#define CURRENCY_SOMALISHILLING @"Somali Shilling"
#define CURRENCY_SAOTOMEDOBRA @"Sao Tome Dobra"
#define CURRENCY_ELSALVADORCOLON @"El Salvador Colon"
#define CURRENCY_SYRIANPOUND @"Syrian Pound"
#define CURRENCY_SWAZILANDLILAGENI @"Swaziland Lilageni"
#define CURRENCY_THAIBAHT @"Thai Baht"
#define CURRENCY_TUNISIANDINAR @"Tunisian Dinar"
#define CURRENCY_TONGAPAANGA @"Tonga Pa'anga"
#define CURRENCY_TURKISHLIRA @"Turkish Lira"
#define CURRENCY_TRINIDADTOBAGODOLLAR @"Trinidad & Tobago Dollar"
#define CURRENCY_TAIWANDOLLAR @"Taiwan Dollar"
#define CURRENCY_TANZANIANSHILLING @"Tanzanian Shilling"
#define CURRENCY_UKRAINEHRYVNIA @"Ukraine Hryvnia"
#define CURRENCY_UGANDANSHILLING @"Ugandan Shilling"
#define CURRENCY_USDOLLAR @"U.S. Dollar"
#define CURRENCY_URUGUAYANNEWPESO @"Uruguayan New Peso"
#define CURRENCY_VIETNAMDONG @"Vietnam Dong"
#define CURRENCY_VANUATUVATU @"Vanuatu Vatu"
#define CURRENCY_SAMOATALA @"Samoa Tala"
#define CURRENCY_CFAFRANC @"CFA Franc"
#define CURRENCY_SILVEROUNCES @"Silver Ounces"
#define CURRENCY_GOLDOUNCES @"Gold Ounces"
#define CURRENCY_EASTCARIBBEANDOLLAR @"East Caribbean Dollar"
#define CURRENCY_COPPERPOUNDS @"Copper Pounds"
#define CURRENCY_CFAFRANC @"CFA Franc"
#define CURRENCY_PALLADIUMOUNCES @"Palladium Ounces"
#define CURRENCY_PACIFICFRANC @"Pacific Franc"
#define CURRENCY_PLATINUMOUNCES @"Platinum Ounces"
#define CURRENCY_YEMENRIYAL @"Yemen Riyal"
#define CURRENCY_SOUTHAFRICANRAND @"South African Rand"
#define CURRENCY_ZAMBIANKWACHA @"Zambian Kwacha"
#define CURRENCY_ZIMBABWEDOLLAR @"Zimbabwe Dollar"

#define CURRENCYSYM_AED @"AED"
#define CURRENCYSYM_ALL @"ALL"
#define CURRENCYSYM_ANG @"ANG"
#define CURRENCYSYM_ARS @"ARS"
#define CURRENCYSYM_AUD @"AUD"
#define CURRENCYSYM_AWG @"AWG"
#define CURRENCYSYM_BBD @"BBD"
#define CURRENCYSYM_BDT @"BDT"
#define CURRENCYSYM_BGN @"BGN"
#define CURRENCYSYM_BHD @"BHD"
#define CURRENCYSYM_BIF @"BIF"
#define CURRENCYSYM_BMD @"BMD"
#define CURRENCYSYM_BND @"BND"
#define CURRENCYSYM_BOB @"BOB"
#define CURRENCYSYM_BRL @"BRL"
#define CURRENCYSYM_BSD @"BSD"
#define CURRENCYSYM_BTN @"BTN"
#define CURRENCYSYM_BWP @"BWP"
#define CURRENCYSYM_BYR @"BYR"
#define CURRENCYSYM_BZD @"BZD"
#define CURRENCYSYM_CAD @"CAD"
#define CURRENCYSYM_CHF @"CHF"
#define CURRENCYSYM_CLP @"CLP"
#define CURRENCYSYM_CNY @"CNY"
#define CURRENCYSYM_COP @"COP"
#define CURRENCYSYM_CRC @"CRC"
#define CURRENCYSYM_CUP @"CUP"
#define CURRENCYSYM_CVE @"CVE"
#define CURRENCYSYM_CZK @"CZK"
#define CURRENCYSYM_DJF @"DJF"
#define CURRENCYSYM_DKK @"DKK"
#define CURRENCYSYM_DOP @"DOP"
#define CURRENCYSYM_DZD @"DZD"
#define CURRENCYSYM_EEK @"EEK"
#define CURRENCYSYM_EGP @"EGP"
#define CURRENCYSYM_ETB @"ETB"
#define CURRENCYSYM_EUR @"EUR"
#define CURRENCYSYM_FJD @"FJD"
#define CURRENCYSYM_FKP @"FKP"
#define CURRENCYSYM_GBP @"GBP"
#define CURRENCYSYM_GIP @"GIP"
#define CURRENCYSYM_GMD @"GMD"
#define CURRENCYSYM_GNF @"GNF"
#define CURRENCYSYM_GTQ @"GTQ"
#define CURRENCYSYM_GYD @"GYD"
#define CURRENCYSYM_HKD @"HKD"
#define CURRENCYSYM_HNL @"HNL"
#define CURRENCYSYM_HRK @"HRK"
#define CURRENCYSYM_HTG @"HTG"
#define CURRENCYSYM_HUF @"HUF"
#define CURRENCYSYM_IDR @"IDR"
#define CURRENCYSYM_ILS @"ILS"
#define CURRENCYSYM_INR @"INR"
#define CURRENCYSYM_IQD @"IQD"
#define CURRENCYSYM_IRR @"IRR"
#define CURRENCYSYM_ISK @"ISK"
#define CURRENCYSYM_JMD @"JMD"
#define CURRENCYSYM_JOD @"JOD"
#define CURRENCYSYM_JPY @"JPY"
#define CURRENCYSYM_KES @"KES"
#define CURRENCYSYM_KHR @"KHR"
#define CURRENCYSYM_KMF @"KMF"
#define CURRENCYSYM_KPW @"KPW"
#define CURRENCYSYM_KRW @"KRW"
#define CURRENCYSYM_KWD @"KWD"
#define CURRENCYSYM_KYD @"KYD"
#define CURRENCYSYM_KZT @"KZT"
#define CURRENCYSYM_LAK @"LAK"
#define CURRENCYSYM_LBP @"LBP"
#define CURRENCYSYM_LKR @"LKR"
#define CURRENCYSYM_LRD @"LRD"
#define CURRENCYSYM_LSL @"LSL"
#define CURRENCYSYM_LTL @"LTL"
#define CURRENCYSYM_LVL @"LVL"
#define CURRENCYSYM_LYD @"LYD"
#define CURRENCYSYM_MAD @"MAD"
#define CURRENCYSYM_MDL @"MDL"
#define CURRENCYSYM_MKD @"MKD"
#define CURRENCYSYM_MMK @"MMK"
#define CURRENCYSYM_MNT @"MNT"
#define CURRENCYSYM_MOP @"MOP"
#define CURRENCYSYM_MRO @"MRO"
#define CURRENCYSYM_MUR @"MUR"
#define CURRENCYSYM_MVR @"MVR"
#define CURRENCYSYM_MWK @"MWK"
#define CURRENCYSYM_MXN @"MXN"
#define CURRENCYSYM_MYR @"MYR"
#define CURRENCYSYM_NAD @"NAD"
#define CURRENCYSYM_NGN @"NGN"
#define CURRENCYSYM_NIO @"NIO"
#define CURRENCYSYM_NOK @"NOK"
#define CURRENCYSYM_NPR @"NPR"
#define CURRENCYSYM_NZD @"NZD"
#define CURRENCYSYM_OMR @"OMR"
#define CURRENCYSYM_PAB @"PAB"
#define CURRENCYSYM_PEN @"PEN"
#define CURRENCYSYM_PGK @"PGK"
#define CURRENCYSYM_PHP @"PHP"
#define CURRENCYSYM_PKR @"PKR"
#define CURRENCYSYM_PLN @"PLN"
#define CURRENCYSYM_PYG @"PYG"
#define CURRENCYSYM_QAR @"QAR"
#define CURRENCYSYM_RON @"RON"
#define CURRENCYSYM_RUB @"RUB"
#define CURRENCYSYM_RWF @"RWF"
#define CURRENCYSYM_SAR @"SAR"
#define CURRENCYSYM_SBD @"SBD"
#define CURRENCYSYM_SCR @"SCR"
#define CURRENCYSYM_SEK @"SEK"
#define CURRENCYSYM_SGD @"SGD"
#define CURRENCYSYM_SHP @"SHP"
#define CURRENCYSYM_SKK @"SKK"
#define CURRENCYSYM_SLL @"SLL"
#define CURRENCYSYM_SOS @"SOS"
#define CURRENCYSYM_STD @"STD"
#define CURRENCYSYM_SVC @"SVC"
#define CURRENCYSYM_SYP @"SYP"
#define CURRENCYSYM_SZL @"SZL"
#define CURRENCYSYM_THB @"THB"
#define CURRENCYSYM_TND @"TND"
#define CURRENCYSYM_TOP @"TOP"
#define CURRENCYSYM_TRY @"TRY"
#define CURRENCYSYM_TTD @"TTD"
#define CURRENCYSYM_TWD @"TWD"
#define CURRENCYSYM_TZS @"TZS"
#define CURRENCYSYM_UAH @"UAH"
#define CURRENCYSYM_UGX @"UGX"
#define CURRENCYSYM_USD @"USD"
#define CURRENCYSYM_UYU @"UYU"
#define CURRENCYSYM_VND @"VND"
#define CURRENCYSYM_VUV @"VUV"
#define CURRENCYSYM_WST @"WST"
#define CURRENCYSYM_XAF @"XAF"
#define CURRENCYSYM_XAG @"XAG"
#define CURRENCYSYM_XAU @"XAU"
#define CURRENCYSYM_XCD @"XCD"
#define CURRENCYSYM_XCP @"XCP"
#define CURRENCYSYM_XOF @"XOF"
#define CURRENCYSYM_XPD @"XPD"
#define CURRENCYSYM_XPF @"XPF"
#define CURRENCYSYM_XPT @"XPT"
#define CURRENCYSYM_YER @"YER"
#define CURRENCYSYM_ZAR @"ZAR"
#define CURRENCYSYM_ZMK @"ZMK"
#define CURRENCYSYM_ZWD @"ZWD"
#import "CurrencyList.h"

@implementation CurrencyList

- (CurrencyList *)init{
    self = [super init];
    
    if (self) {
        _propListCurrencySymbols = @[CURRENCYSYM_AED, CURRENCYSYM_ALL, CURRENCYSYM_ANG, CURRENCYSYM_ARS, CURRENCYSYM_AUD, CURRENCYSYM_AWG, CURRENCYSYM_BBD, CURRENCYSYM_BDT, CURRENCYSYM_BGN, CURRENCYSYM_BHD, CURRENCYSYM_BIF, CURRENCYSYM_BMD, CURRENCYSYM_BND, CURRENCYSYM_BOB, CURRENCYSYM_BRL, CURRENCYSYM_BSD, CURRENCYSYM_BTN, CURRENCYSYM_BWP, CURRENCYSYM_BYR, CURRENCYSYM_BZD, CURRENCYSYM_CAD, CURRENCYSYM_CHF, CURRENCYSYM_CLP, CURRENCYSYM_CNY, CURRENCYSYM_COP, CURRENCYSYM_CRC, CURRENCYSYM_CUP, CURRENCYSYM_CVE, CURRENCYSYM_CZK, CURRENCYSYM_DJF, CURRENCYSYM_DKK, CURRENCYSYM_DOP, CURRENCYSYM_DZD, CURRENCYSYM_EEK, CURRENCYSYM_EGP, CURRENCYSYM_ETB, CURRENCYSYM_EUR, CURRENCYSYM_FJD, CURRENCYSYM_FKP, CURRENCYSYM_GBP, CURRENCYSYM_GIP, CURRENCYSYM_GMD, CURRENCYSYM_GNF, CURRENCYSYM_GTQ, CURRENCYSYM_GYD, CURRENCYSYM_HKD, CURRENCYSYM_HNL, CURRENCYSYM_HRK, CURRENCYSYM_HTG, CURRENCYSYM_HUF, CURRENCYSYM_IDR, CURRENCYSYM_ILS, CURRENCYSYM_INR, CURRENCYSYM_IQD, CURRENCYSYM_IRR, CURRENCYSYM_ISK, CURRENCYSYM_JMD, CURRENCYSYM_JOD, CURRENCYSYM_JPY, CURRENCYSYM_KES, CURRENCYSYM_KHR, CURRENCYSYM_KMF, CURRENCYSYM_KPW, CURRENCYSYM_KRW, CURRENCYSYM_KWD, CURRENCYSYM_KYD, CURRENCYSYM_KZT, CURRENCYSYM_LAK, CURRENCYSYM_LBP, CURRENCYSYM_LKR, CURRENCYSYM_LRD, CURRENCYSYM_LSL, CURRENCYSYM_LTL, CURRENCYSYM_LVL, CURRENCYSYM_LYD, CURRENCYSYM_MAD, CURRENCYSYM_MDL, CURRENCYSYM_MKD, CURRENCYSYM_MMK, CURRENCYSYM_MNT, CURRENCYSYM_MOP, CURRENCYSYM_MRO, CURRENCYSYM_MUR, CURRENCYSYM_MVR, CURRENCYSYM_MWK, CURRENCYSYM_MXN, CURRENCYSYM_MYR, CURRENCYSYM_NAD, CURRENCYSYM_NGN, CURRENCYSYM_NIO, CURRENCYSYM_NOK, CURRENCYSYM_NPR, CURRENCYSYM_NZD, CURRENCYSYM_OMR, CURRENCYSYM_PAB, CURRENCYSYM_PEN, CURRENCYSYM_PGK, CURRENCYSYM_PHP, CURRENCYSYM_PKR, CURRENCYSYM_PLN, CURRENCYSYM_PYG, CURRENCYSYM_QAR, CURRENCYSYM_RON, CURRENCYSYM_RUB, CURRENCYSYM_RWF, CURRENCYSYM_SAR, CURRENCYSYM_SBD, CURRENCYSYM_SCR, CURRENCYSYM_SEK, CURRENCYSYM_SGD, CURRENCYSYM_SHP, CURRENCYSYM_SKK, CURRENCYSYM_SLL, CURRENCYSYM_SOS, CURRENCYSYM_STD, CURRENCYSYM_SVC, CURRENCYSYM_SYP, CURRENCYSYM_SZL, CURRENCYSYM_THB, CURRENCYSYM_TND, CURRENCYSYM_TOP, CURRENCYSYM_TRY, CURRENCYSYM_TTD, CURRENCYSYM_TWD, CURRENCYSYM_TZS, CURRENCYSYM_UAH, CURRENCYSYM_UGX, CURRENCYSYM_USD, CURRENCYSYM_UYU, CURRENCYSYM_VND, CURRENCYSYM_VUV, CURRENCYSYM_WST, CURRENCYSYM_XAF, CURRENCYSYM_XAG, CURRENCYSYM_XAU, CURRENCYSYM_XCD, CURRENCYSYM_XCP, CURRENCYSYM_XOF, CURRENCYSYM_XPD, CURRENCYSYM_XPF, CURRENCYSYM_XPT, CURRENCYSYM_YER, CURRENCYSYM_ZAR, CURRENCYSYM_ZMK, CURRENCYSYM_ZWD];
        
        _propListCurrencyNames = @[CURRENCY_UAEDIRHAM, CURRENCY_ALBANIANLEK, CURRENCY_NETHANTILLESGUILDER, CURRENCY_ARGENTINEPESO, CURRENCY_AUSTRALIANDOLLAR, CURRENCY_ARUBAFLORIN, CURRENCY_BARBADOSDOLLAR, CURRENCY_BANGLADESHTAKA, CURRENCY_BULGARIANLEV, CURRENCY_BAHRAINIDINAR, CURRENCY_BURUNDIFRANC, CURRENCY_BERMUDADOLLAR, CURRENCY_BRUNEIDOLLAR, CURRENCY_BOLIVIANBOLIVIANO, CURRENCY_BRAZILIANREAL, CURRENCY_BAHAMIANDOLLAR, CURRENCY_BHUTANNGULTRUM, CURRENCY_BOTSWANAPULA, CURRENCY_BELARUSRUBLE, CURRENCY_BELIZEDOLLAR, CURRENCY_CANADIANDOLLAR, CURRENCY_SWISSFRANC, CURRENCY_CHILEANPESO, CURRENCY_CHINESEYUAN, CURRENCY_COLOMBIANPESO, CURRENCY_COSTARICACOLON, CURRENCY_CUBANPESO, CURRENCY_CAPEVERDEESCUDO, CURRENCY_CZECHKORUNA, CURRENCY_DIJIBOUTIFRANC, CURRENCY_DANISHKRONE, CURRENCY_DOMINICANPESO, CURRENCY_ALGERIANDINAR, CURRENCY_ESTONIANKROON, CURRENCY_EGYPTIANPOUND, CURRENCY_ETHIOPIANBIRR, CURRENCY_EURO, CURRENCY_FIJIDOLLAR, CURRENCY_FALKLANDISLANDSPOUND, CURRENCY_BRITISHPOUND, CURRENCY_GIBRALTARPOUND, CURRENCY_GAMBIANDALASI, CURRENCY_GUINEAFRANC, CURRENCY_GUATEMALAQUETZAL, CURRENCY_GUYANADOLLAR, CURRENCY_HONGKONGDOLLAR, CURRENCY_HONDURASLEMPIRA, CURRENCY_CROATIANKUNA, CURRENCY_HAITIGOURDE, CURRENCY_HUNGARIANFORINT, CURRENCY_INDONESIANRUPIAH, CURRENCY_ISRAELISHEKEL, CURRENCY_INDIANRUPEE, CURRENCY_IRAQIDINAR, CURRENCY_IRANRIAL, CURRENCY_ICELANDKRONA, CURRENCY_JAMAICANDOLLAR, CURRENCY_JORDANIANDINAR, CURRENCY_JAPANESEYEN, CURRENCY_KENYANSHILLING, CURRENCY_CAMBODIARIEL, CURRENCY_COMOROSFRANC, CURRENCY_NORTHKOREANWON, CURRENCY_KOREANWON, CURRENCY_KUWAITIDINAR, CURRENCY_CAYMANISLANDSDOLLAR, CURRENCY_KAZAKHSTANTENGE, CURRENCY_LAOKIP, CURRENCY_LEBANESEPOUND, CURRENCY_SRILANKARUPEE, CURRENCY_LIBERIANDOLLAR, CURRENCY_LESOTHOLOTI, CURRENCY_LITHUANIANLITA, CURRENCY_LATVIANLAT, CURRENCY_LIBYANDINAR, CURRENCY_MOROCCANDIRHAM, CURRENCY_MOLDOVANLEU, CURRENCY_MACEDONIANDENAR, CURRENCY_MYANMARKYAT, CURRENCY_MONGOLIANTUGRIK, CURRENCY_MACAUPATACA, CURRENCY_MAURITANIAOUGULYA, CURRENCY_MAURITIUSRUPEE, CURRENCY_MALDIVESRUFIYAA, CURRENCY_MALAWIKWACHA, CURRENCY_MEXICANPESO, CURRENCY_MALAYSIANRINGGIT, CURRENCY_NAMIBIANDOLLAR, CURRENCY_NIGERIANNAIRA, CURRENCY_NICARAGUACORDOBA, CURRENCY_NORWEGIANKRONE, CURRENCY_NEPALESERUPEE, CURRENCY_NEWZEALANDDOLLAR, CURRENCY_OMANIRIAL, CURRENCY_PANAMABALBOA, CURRENCY_PERUVIANNUEVOSOL, CURRENCY_PAPUANEWGUINEAKINA, CURRENCY_PHILIPPINEPESO, CURRENCY_PAKISTANIRUPEE, CURRENCY_POLISHZLOTY, CURRENCY_PARAGUAYANGUARANI, CURRENCY_QATARRIAL, CURRENCY_ROMANIANNEWLEU, CURRENCY_RUSSIANROUBLE, CURRENCY_RWANDAFRANC, CURRENCY_SAUDIARABIANRIYAL, CURRENCY_SOLOMONISLANDSDOLLAR, CURRENCY_SEYCHELLESRUPEE, CURRENCY_SWEDISHKRONA, CURRENCY_SINGAPOREDOLLAR, CURRENCY_STHELENAPOUND, CURRENCY_SLOVAKKORUNA, CURRENCY_SIERRALEONELEONE, CURRENCY_SOMALISHILLING, CURRENCY_SAOTOMEDOBRA, CURRENCY_ELSALVADORCOLON, CURRENCY_SYRIANPOUND, CURRENCY_SWAZILANDLILAGENI, CURRENCY_THAIBAHT, CURRENCY_TUNISIANDINAR, CURRENCY_TONGAPAANGA, CURRENCY_TURKISHLIRA, CURRENCY_TRINIDADTOBAGODOLLAR, CURRENCY_TAIWANDOLLAR, CURRENCY_TANZANIANSHILLING, CURRENCY_UKRAINEHRYVNIA, CURRENCY_UGANDANSHILLING, CURRENCY_USDOLLAR, CURRENCY_URUGUAYANNEWPESO, CURRENCY_VIETNAMDONG, CURRENCY_VANUATUVATU, CURRENCY_SAMOATALA, CURRENCY_CFAFRANC, CURRENCY_SILVEROUNCES, CURRENCY_GOLDOUNCES, CURRENCY_EASTCARIBBEANDOLLAR, CURRENCY_COPPERPOUNDS, CURRENCY_CFAFRANC, CURRENCY_PALLADIUMOUNCES, CURRENCY_PACIFICFRANC, CURRENCY_PLATINUMOUNCES, CURRENCY_YEMENRIYAL, CURRENCY_SOUTHAFRICANRAND, CURRENCY_ZAMBIANKWACHA, CURRENCY_ZIMBABWEDOLLAR];
        
        _propDictCurrencySymbolNames = [[NSMutableDictionary alloc] init];
        [_propDictCurrencySymbolNames setValue:CURRENCY_UAEDIRHAM forKey:CURRENCYSYM_AED];
        [_propDictCurrencySymbolNames setValue:CURRENCY_ALBANIANLEK forKey:CURRENCYSYM_ALL];
        [_propDictCurrencySymbolNames setValue:CURRENCY_NETHANTILLESGUILDER forKey:CURRENCYSYM_ANG];
        [_propDictCurrencySymbolNames setValue:CURRENCY_ARGENTINEPESO forKey:CURRENCYSYM_ARS];
        [_propDictCurrencySymbolNames setValue:CURRENCY_AUSTRALIANDOLLAR forKey:CURRENCYSYM_AUD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_ARUBAFLORIN forKey:CURRENCYSYM_AWG];
        [_propDictCurrencySymbolNames setValue:CURRENCY_BARBADOSDOLLAR forKey:CURRENCYSYM_BBD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_BANGLADESHTAKA forKey:CURRENCYSYM_BDT];
        [_propDictCurrencySymbolNames setValue:CURRENCY_BULGARIANLEV forKey:CURRENCYSYM_BGN];
        [_propDictCurrencySymbolNames setValue:CURRENCY_BAHRAINIDINAR forKey:CURRENCYSYM_BHD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_BURUNDIFRANC forKey:CURRENCYSYM_BIF];
        [_propDictCurrencySymbolNames setValue:CURRENCY_BERMUDADOLLAR forKey:CURRENCYSYM_BMD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_BRUNEIDOLLAR forKey:CURRENCYSYM_BND];
        [_propDictCurrencySymbolNames setValue:CURRENCY_BOLIVIANBOLIVIANO forKey:CURRENCYSYM_BOB];
        [_propDictCurrencySymbolNames setValue:CURRENCY_BRAZILIANREAL forKey:CURRENCYSYM_BRL];
        [_propDictCurrencySymbolNames setValue:CURRENCY_BAHAMIANDOLLAR forKey:CURRENCYSYM_BSD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_BHUTANNGULTRUM forKey:CURRENCYSYM_BTN];
        [_propDictCurrencySymbolNames setValue:CURRENCY_BOTSWANAPULA forKey:CURRENCYSYM_BWP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_BELARUSRUBLE forKey:CURRENCYSYM_BYR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_BELIZEDOLLAR forKey:CURRENCYSYM_BZD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_CANADIANDOLLAR forKey:CURRENCYSYM_CAD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SWISSFRANC forKey:CURRENCYSYM_CHF];
        [_propDictCurrencySymbolNames setValue:CURRENCY_CHILEANPESO forKey:CURRENCYSYM_CLP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_CHINESEYUAN forKey:CURRENCYSYM_CNY];
        [_propDictCurrencySymbolNames setValue:CURRENCY_COLOMBIANPESO forKey:CURRENCYSYM_COP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_COSTARICACOLON forKey:CURRENCYSYM_CRC];
        [_propDictCurrencySymbolNames setValue:CURRENCY_CUBANPESO forKey:CURRENCYSYM_CUP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_CAPEVERDEESCUDO forKey:CURRENCYSYM_CVE];
        [_propDictCurrencySymbolNames setValue:CURRENCY_CZECHKORUNA forKey:CURRENCYSYM_CZK];
        [_propDictCurrencySymbolNames setValue:CURRENCY_DIJIBOUTIFRANC forKey:CURRENCYSYM_DJF];
        [_propDictCurrencySymbolNames setValue:CURRENCY_DANISHKRONE forKey:CURRENCYSYM_DKK];
        [_propDictCurrencySymbolNames setValue:CURRENCY_DOMINICANPESO forKey:CURRENCYSYM_DOP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_ALGERIANDINAR forKey:CURRENCYSYM_DZD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_ESTONIANKROON forKey:CURRENCYSYM_EEK];
        [_propDictCurrencySymbolNames setValue:CURRENCY_EGYPTIANPOUND forKey:CURRENCYSYM_EGP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_ETHIOPIANBIRR forKey:CURRENCYSYM_ETB];
        [_propDictCurrencySymbolNames setValue:CURRENCY_EURO forKey:CURRENCYSYM_EUR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_FIJIDOLLAR forKey:CURRENCYSYM_FJD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_FALKLANDISLANDSPOUND forKey:CURRENCYSYM_FKP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_BRITISHPOUND forKey:CURRENCYSYM_GBP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_GIBRALTARPOUND forKey:CURRENCYSYM_GIP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_GAMBIANDALASI forKey:CURRENCYSYM_GMD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_GUINEAFRANC forKey:CURRENCYSYM_GNF];
        [_propDictCurrencySymbolNames setValue:CURRENCY_GUATEMALAQUETZAL forKey:CURRENCYSYM_GTQ];
        [_propDictCurrencySymbolNames setValue:CURRENCY_GUYANADOLLAR forKey:CURRENCYSYM_GYD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_HONGKONGDOLLAR forKey:CURRENCYSYM_HKD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_HONDURASLEMPIRA forKey:CURRENCYSYM_HNL];
        [_propDictCurrencySymbolNames setValue:CURRENCY_CROATIANKUNA forKey:CURRENCYSYM_HRK];
        [_propDictCurrencySymbolNames setValue:CURRENCY_HAITIGOURDE forKey:CURRENCYSYM_HTG];
        [_propDictCurrencySymbolNames setValue:CURRENCY_HUNGARIANFORINT forKey:CURRENCYSYM_HUF];
        [_propDictCurrencySymbolNames setValue:CURRENCY_INDONESIANRUPIAH forKey:CURRENCYSYM_IDR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_ISRAELISHEKEL forKey:CURRENCYSYM_ILS];
        [_propDictCurrencySymbolNames setValue:CURRENCY_INDIANRUPEE forKey:CURRENCYSYM_INR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_IRAQIDINAR forKey:CURRENCYSYM_IQD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_IRANRIAL forKey:CURRENCYSYM_IRR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_ICELANDKRONA forKey:CURRENCYSYM_ISK];
        [_propDictCurrencySymbolNames setValue:CURRENCY_JAMAICANDOLLAR forKey:CURRENCYSYM_JMD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_JORDANIANDINAR forKey:CURRENCYSYM_JOD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_JAPANESEYEN forKey:CURRENCYSYM_JPY];
        [_propDictCurrencySymbolNames setValue:CURRENCY_KENYANSHILLING forKey:CURRENCYSYM_KES];
        [_propDictCurrencySymbolNames setValue:CURRENCY_CAMBODIARIEL forKey:CURRENCYSYM_KHR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_COMOROSFRANC forKey:CURRENCYSYM_KMF];
        [_propDictCurrencySymbolNames setValue:CURRENCY_NORTHKOREANWON forKey:CURRENCYSYM_KPW];
        [_propDictCurrencySymbolNames setValue:CURRENCY_KOREANWON forKey:CURRENCYSYM_KRW];
        [_propDictCurrencySymbolNames setValue:CURRENCY_KUWAITIDINAR forKey:CURRENCYSYM_KWD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_CAYMANISLANDSDOLLAR forKey:CURRENCYSYM_KYD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_KAZAKHSTANTENGE forKey:CURRENCYSYM_KZT];
        [_propDictCurrencySymbolNames setValue:CURRENCY_LAOKIP forKey:CURRENCYSYM_LAK];
        [_propDictCurrencySymbolNames setValue:CURRENCY_LEBANESEPOUND forKey:CURRENCYSYM_LBP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SRILANKARUPEE forKey:CURRENCYSYM_LKR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_LIBERIANDOLLAR forKey:CURRENCYSYM_LRD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_LESOTHOLOTI forKey:CURRENCYSYM_LSL];
        [_propDictCurrencySymbolNames setValue:CURRENCY_LITHUANIANLITA forKey:CURRENCYSYM_LTL];
        [_propDictCurrencySymbolNames setValue:CURRENCY_LATVIANLAT forKey:CURRENCYSYM_LVL];
        [_propDictCurrencySymbolNames setValue:CURRENCY_LIBYANDINAR forKey:CURRENCYSYM_LYD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_MOROCCANDIRHAM forKey:CURRENCYSYM_MAD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_MOLDOVANLEU forKey:CURRENCYSYM_MDL];
        [_propDictCurrencySymbolNames setValue:CURRENCY_MACEDONIANDENAR forKey:CURRENCYSYM_MKD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_MYANMARKYAT forKey:CURRENCYSYM_MMK];
        [_propDictCurrencySymbolNames setValue:CURRENCY_MONGOLIANTUGRIK forKey:CURRENCYSYM_MNT];
        [_propDictCurrencySymbolNames setValue:CURRENCY_MACAUPATACA forKey:CURRENCYSYM_MOP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_MAURITANIAOUGULYA forKey:CURRENCYSYM_MRO];
        [_propDictCurrencySymbolNames setValue:CURRENCY_MAURITIUSRUPEE forKey:CURRENCYSYM_MUR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_MALDIVESRUFIYAA forKey:CURRENCYSYM_MVR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_MALAWIKWACHA forKey:CURRENCYSYM_MWK];
        [_propDictCurrencySymbolNames setValue:CURRENCY_MEXICANPESO forKey:CURRENCYSYM_MXN];
        [_propDictCurrencySymbolNames setValue:CURRENCY_MALAYSIANRINGGIT forKey:CURRENCYSYM_MYR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_NAMIBIANDOLLAR forKey:CURRENCYSYM_NAD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_NIGERIANNAIRA forKey:CURRENCYSYM_NGN];
        [_propDictCurrencySymbolNames setValue:CURRENCY_NICARAGUACORDOBA forKey:CURRENCYSYM_NIO];
        [_propDictCurrencySymbolNames setValue:CURRENCY_NORWEGIANKRONE forKey:CURRENCYSYM_NOK];
        [_propDictCurrencySymbolNames setValue:CURRENCY_NEPALESERUPEE forKey:CURRENCYSYM_NPR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_NEWZEALANDDOLLAR forKey:CURRENCYSYM_NZD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_OMANIRIAL forKey:CURRENCYSYM_OMR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_PANAMABALBOA forKey:CURRENCYSYM_PAB];
        [_propDictCurrencySymbolNames setValue:CURRENCY_PERUVIANNUEVOSOL forKey:CURRENCYSYM_PEN];
        [_propDictCurrencySymbolNames setValue:CURRENCY_PAPUANEWGUINEAKINA forKey:CURRENCYSYM_PGK];
        [_propDictCurrencySymbolNames setValue:CURRENCY_PHILIPPINEPESO forKey:CURRENCYSYM_PHP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_PAKISTANIRUPEE forKey:CURRENCYSYM_PKR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_POLISHZLOTY forKey:CURRENCYSYM_PLN];
        [_propDictCurrencySymbolNames setValue:CURRENCY_PARAGUAYANGUARANI forKey:CURRENCYSYM_PYG];
        [_propDictCurrencySymbolNames setValue:CURRENCY_QATARRIAL forKey:CURRENCYSYM_QAR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_ROMANIANNEWLEU forKey:CURRENCYSYM_RON];
        [_propDictCurrencySymbolNames setValue:CURRENCY_RUSSIANROUBLE forKey:CURRENCYSYM_RUB];
        [_propDictCurrencySymbolNames setValue:CURRENCY_RWANDAFRANC forKey:CURRENCYSYM_RWF];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SAUDIARABIANRIYAL forKey:CURRENCYSYM_SAR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SOLOMONISLANDSDOLLAR forKey:CURRENCYSYM_SBD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SEYCHELLESRUPEE forKey:CURRENCYSYM_SCR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SWEDISHKRONA forKey:CURRENCYSYM_SEK];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SINGAPOREDOLLAR forKey:CURRENCYSYM_SGD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_STHELENAPOUND forKey:CURRENCYSYM_SHP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SLOVAKKORUNA forKey:CURRENCYSYM_SKK];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SIERRALEONELEONE forKey:CURRENCYSYM_SLL];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SOMALISHILLING forKey:CURRENCYSYM_SOS];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SAOTOMEDOBRA forKey:CURRENCYSYM_STD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_ELSALVADORCOLON forKey:CURRENCYSYM_SVC];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SYRIANPOUND forKey:CURRENCYSYM_SYP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SWAZILANDLILAGENI forKey:CURRENCYSYM_SZL];
        [_propDictCurrencySymbolNames setValue:CURRENCY_THAIBAHT forKey:CURRENCYSYM_THB];
        [_propDictCurrencySymbolNames setValue:CURRENCY_TUNISIANDINAR forKey:CURRENCYSYM_TND];
        [_propDictCurrencySymbolNames setValue:CURRENCY_TONGAPAANGA forKey:CURRENCYSYM_TOP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_TURKISHLIRA forKey:CURRENCYSYM_TRY];
        [_propDictCurrencySymbolNames setValue:CURRENCY_TRINIDADTOBAGODOLLAR forKey:CURRENCYSYM_TTD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_TAIWANDOLLAR forKey:CURRENCYSYM_TWD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_TANZANIANSHILLING forKey:CURRENCYSYM_TZS];
        [_propDictCurrencySymbolNames setValue:CURRENCY_UKRAINEHRYVNIA forKey:CURRENCYSYM_UAH];
        [_propDictCurrencySymbolNames setValue:CURRENCY_UGANDANSHILLING forKey:CURRENCYSYM_UGX];
        [_propDictCurrencySymbolNames setValue:CURRENCY_USDOLLAR forKey:CURRENCYSYM_USD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_URUGUAYANNEWPESO forKey:CURRENCYSYM_UYU];
        [_propDictCurrencySymbolNames setValue:CURRENCY_VIETNAMDONG forKey:CURRENCYSYM_VND];
        [_propDictCurrencySymbolNames setValue:CURRENCY_VANUATUVATU forKey:CURRENCYSYM_VUV];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SAMOATALA forKey:CURRENCYSYM_WST];
        [_propDictCurrencySymbolNames setValue:CURRENCY_CFAFRANC forKey:CURRENCYSYM_XAF];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SILVEROUNCES forKey:CURRENCYSYM_XAG];
        [_propDictCurrencySymbolNames setValue:CURRENCY_GOLDOUNCES forKey:CURRENCYSYM_XAU];
        [_propDictCurrencySymbolNames setValue:CURRENCY_EASTCARIBBEANDOLLAR forKey:CURRENCYSYM_XCD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_COPPERPOUNDS forKey:CURRENCYSYM_XCP];
        [_propDictCurrencySymbolNames setValue:CURRENCY_CFAFRANC forKey:CURRENCYSYM_XOF];
        [_propDictCurrencySymbolNames setValue:CURRENCY_PALLADIUMOUNCES forKey:CURRENCYSYM_XPD];
        [_propDictCurrencySymbolNames setValue:CURRENCY_PACIFICFRANC forKey:CURRENCYSYM_XPF];
        [_propDictCurrencySymbolNames setValue:CURRENCY_PLATINUMOUNCES forKey:CURRENCYSYM_XPT];
        [_propDictCurrencySymbolNames setValue:CURRENCY_YEMENRIYAL forKey:CURRENCYSYM_YER];
        [_propDictCurrencySymbolNames setValue:CURRENCY_SOUTHAFRICANRAND forKey:CURRENCYSYM_ZAR];
        [_propDictCurrencySymbolNames setValue:CURRENCY_ZAMBIANKWACHA forKey:CURRENCYSYM_ZMK];
        [_propDictCurrencySymbolNames setValue:CURRENCY_ZIMBABWEDOLLAR forKey:CURRENCYSYM_ZWD];
         
    }
    
    return self;
}

@end
