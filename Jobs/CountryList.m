//
//  CountryList.m
//  Jobs
//
//  Created by Rick Royd Aban on 9/26/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//
#define ANY @"Any"
#define AFGHANISTAN @"Afghanistan"
#define ALAND_ISLANDS @"Aland Islands"
#define ALBANIA @"Albania"
#define ALGERIA @"Algeria"
#define AMERICAN_SAMOA  @"American Samoa"
#define ANDRORRA @"Andorra"
#define ANGOLA @"Angola"
#define ANGUILLA @"Anguilla"
#define ANTARTCTICA @"Antarctica"
#define ANTIGUA_AND_BARBUDA @"Antigua and Barbuda"
#define ARGENTINA @"Argentina"
#define ARMENIA @"Armenia"
#define ARUBA @"Aruba"
#define AUSTRALIA @"Australia"
#define AUSTRIA @"Austria"
#define AZERBAIJAN @"Azerbaijan"
#define BAHAMAS @"Bahamas"
#define BAHRAIN @"Bahrain"
#define BANGLADESH @"Banglaadesh"
#define BARBADOS @"Barbados"
#define BELARUS @"Belarus"
#define BELGIUM @"Belgium"
#define BELIZE @"Belize"
#define BENIN @"Benin"
#define BERMUDA @"Bermuda"
#define BHUTAN @"Bhutan"
#define BOLIVIA @"Bolivia"
#define BONAIRE @"Bonaire, Saint Eustatius and Saba"
#define BOSNIA_AND_HERZEGOVINA @"Bosnia and Herzegovina"
#define BOTSWANA @"Botswana"
#define BOUVET_ISLAND @"Bouvet Islands"
#define BRAZIL @"Brazil"
#define BRITISH_INDIAN_OCEAN_TERRITORY @"British Indian Ocean Territory"
#define BRUNEI @"Brunei Darussalam"
#define BULGARIA @"Bulgaria"
#define BURKINA_FASO @"Burkina Faso"
#define BURUNDI @"Burundi"
#define CAMBODIA @"Cambodia"
#define CAMEROON @"Cameroon"
#define CANADA @"Canada"
#define CAPE_VERDE @"Cape Verde"
#define CAYMAN_ISLANDS @"Cayman Islands"
#define CENTRAL_AFRICAN_REPUBLIC @"Central African Republic"
#define CHAD @"Chad"
#define CHILE @"Chile"
#define CHINA @"China"
#define CHRISTMAS_ISLAND @"Christmas Islands"
#define COCOS_ISLAND @"Cocos (Keeling) Islands"
#define COLOMBIA @"Colombia"
#define COMOROS @"Comoros"
#define CONGO @"Congo"
#define CONGO_DEMOCRATIC @"Congo, The Democratic Republic of the"
#define COOK_ISLANDS @"Cook Islands"
#define COSTA_RICA @"Costa Rica"
#define COTE @"Cote d'Ivoire"
#define CROATIA @"Croatia"
#define CUBA @"Cuba"
#define CURACAO @"Curacao"
#define CYPRUS @"Cyprus"
#define CZECH @"Czech Republic"
#define DENMARK @"Denmark"
#define DJIBOUTI @"Djibouti"
#define DOMINICA @"Dominica"
#define DOMINICAN_REPUBLIC @"Dominican Republic"
#define ECUADOR @"Ecuador"
#define EGYPT @"Egypt"
#define EL_SALVADOR @"El Salvador"
#define EQUATORIAL_GUINEA @"Equatorial Guinea"
#define ERITREA @"Eritrea"
#define ESTONIA @"Estonia"
#define ETHIOPIA @"Ethiopia"
#define FALKLAND_ISLANDS @"Falkland Islands (Malvinas)"
#define FAROE_ISLANDS @"Faroe Islands"
#define FIJI @"Fiji"
#define FINLAND @"Finland"
#define FRANCE @"France"
#define FRENCH_GUIANA @"Frech Guiana"
#define FRENCH_POLYNESIA @"French Polynesia"
#define FRECH_SOUTHERN_TERRITORIES @"French Southern Territories"
#define GABON @"Gabon"
#define GAMBIA @"Gambia"
#define GEORGIA @"Georgia"
#define GERMANY @"Germany"
#define GHANA @"Ghana"
#define GIBRALTAR @"Gibraltar"
#define GREECE @"Greece"
#define GREENLAND @"Greenland"
#define GRENADA @"Grenada"
#define GUADELOUPE @"Guadeloupe"
#define GUAM @"Guam"
#define GUATEMALA @"Guatemala"
#define GEURNSEY @"Guernsey"
#define GUINEA @"Guinea"
#define GUINEA_BISSAU @"Guinea-Bissau"
#define GUYANA @"Guyana"
#define HAITI @"Haiti"
#define HEARD_ISLAND @"Heard Island and McDonald Islands"
#define HOLY_SEE @"Holy See (Vatican City State)"
#define HONDURAS @"Honduras"
#define HONGKONG @"Hong Kong"
#define HUNGARY @"Hungary"
#define ICELAND @"Iceland"
#define INDIA @"India"
#define INDONESIA @"Indonesia"
#define IRAN @"Iran, Islamic Republic of"
#define IRAQ @"Iraq"
#define IRELAND @"Ireland"
#define ISLE_OF_MAN @"Isle of Man"
#define ISRAEL @"Israel"
#define ITALY @"Italy"
#define JAMAICA @"Jamaica"
#define JAPAN @"Japan"
#define JERSEY @"Jersey"
#define JORDAN @"Jordan"
#define KAZAKHSTAN @"Kazakhstan"
#define KENYA @"Kenya"
#define KIRIBATI @"Kiribati"
#define SOUTH_KOREA @"Korea, Democratic People's Republic of"
#define NORTH_KOREA @"Korea, Republic of"
#define KUWAIT @"Kuwait"
#define KYRGYZSTAN @"Kyrgyzstan"
#define LAOS @"Lao People's Democratic Republic"
#define LATVIA @"Latvia"
#define LEBANON @"Lebanon"
#define LESOTHO @"Lesotho"
#define LIBERIA @"Liberia"
#define LIBYA @"Libyan Arab Jamahiriya"
#define LIECHTENSTEIN @"Liechtenstein"
#define LITHUANIA @"Lithuana"
#define LUXEMBOURG @"Luxembourg"
#define MACAO @"Macao"
#define MACEDONIA @"Macedonia"
#define MADAGASCAR @"Madagascar"
#define MALAWI @"Malawi"
#define MALAYSIA @"Maysia"
#define MALDIVES @"Maldives"
#define MALI @"Mali"
#define MALTA @"Malta"
#define MARSHALL_ISLANDS @"Marshall Islands"
#define MARTINIQUE @"Martinique"
#define MAURITANIA @"Mauritinia"
#define MAURITIUS @"Mauritius"
#define MAYOTTE @"Mayotte"
#define MEXICO @"Mexico"
#define MICRONESIA @"Micronesia, Federated States of"
#define MOLDOVA @"Moldova, Republic of"
#define MONACO @"Monaco"
#define MONGOLIA @"Mongolia"
#define MONTENEGRO @"Montenegro"
#define MONTSERRAT @"Montserrat"
#define MOROCCO @"Morocco"
#define MOZAMBIQUE @"Mozambique"
#define MYANMAR @"Myanmar"
#define NAMIBIA @"Namibia"
#define NAURU @"Nauru"
#define NEPAL @"Nepal"
#define NETHERLANDS @"Netherlands"
#define NEW_CALEDONIA @"New Caledonia"
#define NEW_ZEALAND @"New Zealand"
#define NICARAGUA @"Nicaragua"
#define NIGER @"Niger"
#define NIGERIA @"Nigeria"
#define NIUE @"Niue"
#define NORFOLK_ISLAND @"Norfolk Island"
#define NORTHERN_MARIANA_ISLAND @"Northern Mariana Islands"
#define NORWAY @"Norway"
#define OMAN @"Oman"
#define OTHER_COUNTRY @"Other Country"
#define PAKISTAN @"Pakistan"
#define PALAU @"Palau"
#define PALESTINE @"Palestinian Territory"
#define PANAMA @"Panama"
#define PAPUA_NEW_GUINEA @"Papua New Guinea"
#define PARAGUAY @"Paraguay"
#define PERU @"Peru"
#define PHILIPPINES @"Philippines"
#define PITCAIRN @"Pitcairn"
#define POLAND @"Poland"
#define PORTUGAL @"Portugal"
#define PUERTO_RICO @"Puerto Rico"
#define QATAR @"Qatar"
#define REUNION @"Reunion"
#define ROMANIA @"Romania"
#define RUSSIAN_FEDERATION @"Russian Federation"
#define RWANDA @"Rwanda"
#define SAINT_BARTELEMEY @"Saint Bartelemey"
#define SAINT_HELENA @"Saint Helena"
#define SAINT_KITTS @"Saint Kitts and Nevis"
#define SAINT_LUCIA @"Saint Lucia"
#define SAINT_MARTIN @"Saint Martin"
#define SAINT_PIERRE @"Saint Pierre and Miquelon"
#define SAINT_VINCENT @"Saint Vincent and the Grenadines"
#define SAMOA @"Samoa"
#define SAN_MARINO @"San Marino"
#define SAO_TOME @"Sao Tome and Principe"
#define SAUDI_ARABIA @"Saudi Arabia"
#define SENEGAL @"Senegal"
#define SERBIA @"Serbia"
#define SEYCHELLES @"Seychelles"
#define SIERRA_LEONE @"Sierra Leone"
#define SINGAPORE @"Singapore"
#define SINT_MAARTEN @"Sint Maarten"
#define SLOVAKIA @"Slovakia"
#define SLOVENIA @"Slovenia"
#define SOLOMON_ISLANDS @"Solomon Islands"
#define SOMALIA @"Somalia"
#define SOUTH_AFRICA @"South Africa"
#define SOUTH_GEORGIA @"South Georgia and the South Sandwich Islands"
#define SPAIN @"Spain"
#define SRI_LANKA @"Sri Lanka"
#define SUDAN @"Sudan"
#define SURINAME @"Suriname"
#define SVALBARD @"Svalbard and Jan Mayen"
#define SWAZILAND @"Swaziland"
#define SWEDEN @"Swedend"
#define SWITZERLAND @"Switzerland"
#define SYRIA @"Syrian Arab Republic"
#define TAIWAN @"Tawian"
#define TAJIKISTAN @"Tajikistan"
#define TANZANIA @"Tanzania, United Republic Of"
#define THAILAND @"Thailand"
#define TIMOR @"Timor-Leste"
#define TOGO @"Togo"
#define TOKELAU @"Tokelau"
#define TONGA @"Tonga"
#define TRINIDAD @"Trinidad and Tobago"
#define TUNISIA @"Tunisia"
#define TURKEY @"Turkey"
#define TURKMENISTAN @"Turkmenistan"
#define TURKS @"Turks and Caicos Islands"
#define TUVALU @"Tuvalu"
#define UGANDA @"Uganda"
#define UKRAINE @"Ukraine"
#define UAE @"United Arab Emirates "
#define UK @"United Kingdom"
#define US @"United States"
#define US_MINOR @"United States Minor Outlying Islands"
#define URUGUAY @"Uruguay"
#define UZBEKISTAN @"Uzbekistan"
#define VANUATU @"Vanuatu"
#define VENEZUELA @"Venezuela"
#define VIETNAM @"Vietnam"
#define VIGRIN_ISLANDS_BRITISH @"Virgin Islands, British"
#define VIRGIN_ISLANDS_US @"Virgin Islands, U.S."
#define WALLIS_AND_FUTUNA @"Wwallis and Futuna"
#define WESTERN_SAHARA @"Western Sahara"
#define YEMEN @"Yemen"
#define ZAMBIA @"Zambia"
#define ZIMBABWE @"Zimbabwe"


#import "CountryList.h"

@implementation CountryList

static CountryList *sharedCountryList = nil;

+ (CountryList *)sharedCountryList{
    if(sharedCountryList == nil)
        sharedCountryList = [[super alloc] init];
    
    return sharedCountryList;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _countryIds = [NSMutableDictionary dictionary];
        [_countryIds setValue:@"0" forKey:ANY];
        [_countryIds setValue:@"1" forKey:AFGHANISTAN];
        [_countryIds setValue:@"2" forKey:ALAND_ISLANDS];
        [_countryIds setValue:@"3" forKey:ALBANIA];
        [_countryIds setValue:@"4" forKey:ALGERIA];
        [_countryIds setValue:@"5" forKey:AMERICAN_SAMOA];
        [_countryIds setValue:@"6" forKey:ANDRORRA];
        [_countryIds setValue:@"7" forKey:ANGOLA];
        [_countryIds setValue:@"8" forKey:ANGUILLA];
        [_countryIds setValue:@"9" forKey:ANTARTCTICA];
        [_countryIds setValue:@"10" forKey:ANTIGUA_AND_BARBUDA];
        [_countryIds setValue:@"11" forKey:ARGENTINA];
        [_countryIds setValue:@"12" forKey:ARMENIA];
        [_countryIds setValue:@"13" forKey:ARUBA];
        [_countryIds setValue:@"15" forKey:AUSTRALIA];
        [_countryIds setValue:@"16" forKey:AUSTRIA];
        [_countryIds setValue:@"17" forKey:AZERBAIJAN];
        [_countryIds setValue:@"18" forKey:BAHAMAS];
        [_countryIds setValue:@"19" forKey:BAHRAIN];
        [_countryIds setValue:@"20" forKey:BANGLADESH];
        [_countryIds setValue:@"21" forKey:BARBADOS];
        [_countryIds setValue:@"22" forKey:BELARUS];
        [_countryIds setValue:@"23" forKey:BELGIUM];
        [_countryIds setValue:@"24" forKey:BELIZE];
        [_countryIds setValue:@"25" forKey:BENIN];
        [_countryIds setValue:@"26" forKey:BERMUDA];
        [_countryIds setValue:@"27" forKey:BHUTAN];
        [_countryIds setValue:@"28" forKey:BOLIVIA];
        [_countryIds setValue:@"29" forKey:BONAIRE];
        [_countryIds setValue:@"30" forKey:BOSNIA_AND_HERZEGOVINA];
        [_countryIds setValue:@"31" forKey:BOTSWANA];
        [_countryIds setValue:@"32" forKey:BOUVET_ISLAND];
        [_countryIds setValue:@"33" forKey:BRAZIL];
        [_countryIds setValue:@"34" forKey:BRITISH_INDIAN_OCEAN_TERRITORY];
        [_countryIds setValue:@"35" forKey:BRUNEI];
        [_countryIds setValue:@"36" forKey:BULGARIA];
        [_countryIds setValue:@"37" forKey:BURKINA_FASO];
        [_countryIds setValue:@"38" forKey:BURUNDI];
        [_countryIds setValue:@"39" forKey:CAMBODIA];
        [_countryIds setValue:@"40" forKey:CAMEROON];
        [_countryIds setValue:@"41" forKey:CANADA];
        [_countryIds setValue:@"42" forKey:CAPE_VERDE];
        [_countryIds setValue:@"43" forKey:CAYMAN_ISLANDS];
        [_countryIds setValue:@"44" forKey:CENTRAL_AFRICAN_REPUBLIC];
        [_countryIds setValue:@"45" forKey:CHAD];
        [_countryIds setValue:@"46" forKey:CHILE];
        [_countryIds setValue:@"47" forKey:CHINA];
        [_countryIds setValue:@"48" forKey:CHRISTMAS_ISLAND];
        [_countryIds setValue:@"49" forKey:COCOS_ISLAND];
        [_countryIds setValue:@"50" forKey:COLOMBIA];
        [_countryIds setValue:@"51" forKey:COMOROS];
        [_countryIds setValue:@"52" forKey:CONGO];
        [_countryIds setValue:@"53" forKey:CONGO_DEMOCRATIC];
        [_countryIds setValue:@"54" forKey:COOK_ISLANDS];
        [_countryIds setValue:@"55" forKey:COSTA_RICA];
        [_countryIds setValue:@"56" forKey:COTE];
        [_countryIds setValue:@"57" forKey:CROATIA];
        [_countryIds setValue:@"58" forKey:CUBA];
        [_countryIds setValue:@"59" forKey:CURACAO];
        [_countryIds setValue:@"60" forKey:CYPRUS];
        [_countryIds setValue:@"61" forKey:CZECH];
        [_countryIds setValue:@"62" forKey:DENMARK];
        [_countryIds setValue:@"63" forKey:DJIBOUTI];
        [_countryIds setValue:@"64" forKey:DOMINICA];
        [_countryIds setValue:@"65" forKey:DOMINICAN_REPUBLIC];
        [_countryIds setValue:@"66" forKey:ECUADOR];
        [_countryIds setValue:@"67" forKey:EGYPT];
        [_countryIds setValue:@"68" forKey:EL_SALVADOR];
        [_countryIds setValue:@"69" forKey:EQUATORIAL_GUINEA];
        [_countryIds setValue:@"70" forKey:ERITREA];
        [_countryIds setValue:@"71" forKey:ESTONIA];
        [_countryIds setValue:@"72" forKey:ETHIOPIA];
        [_countryIds setValue:@"74" forKey:FALKLAND_ISLANDS];
        [_countryIds setValue:@"75" forKey:FAROE_ISLANDS];
        [_countryIds setValue:@"76" forKey:FIJI];
        [_countryIds setValue:@"77" forKey:FINLAND];
        [_countryIds setValue:@"78" forKey:FRANCE];
        [_countryIds setValue:@"79" forKey:FRENCH_GUIANA];
        [_countryIds setValue:@"80" forKey:FRENCH_POLYNESIA];
        [_countryIds setValue:@"81" forKey:FRECH_SOUTHERN_TERRITORIES];
        [_countryIds setValue:@"82" forKey:GABON];
        [_countryIds setValue:@"83" forKey:GAMBIA];
        [_countryIds setValue:@"84" forKey:GEORGIA];
        [_countryIds setValue:@"85" forKey:GERMANY];
        [_countryIds setValue:@"86" forKey:GHANA];
        [_countryIds setValue:@"87" forKey:GIBRALTAR];
        [_countryIds setValue:@"88" forKey:GREECE];
        [_countryIds setValue:@"89" forKey:GREENLAND];
        [_countryIds setValue:@"90" forKey:GRENADA];
        [_countryIds setValue:@"91" forKey:GUADELOUPE];
        [_countryIds setValue:@"92" forKey:GUAM];
        [_countryIds setValue:@"93" forKey:GUATEMALA];
        [_countryIds setValue:@"94" forKey:GEURNSEY];
        [_countryIds setValue:@"95" forKey:GUINEA];
        [_countryIds setValue:@"96" forKey:GUINEA_BISSAU];
        [_countryIds setValue:@"97" forKey:GUYANA];
        [_countryIds setValue:@"98" forKey:HAITI];
        [_countryIds setValue:@"99" forKey:HEARD_ISLAND];
        [_countryIds setValue:@"100" forKey:HOLY_SEE];
        [_countryIds setValue:@"101" forKey:HONDURAS];
        [_countryIds setValue:@"102" forKey:HONGKONG];
        [_countryIds setValue:@"103" forKey:HUNGARY];
        [_countryIds setValue:@"104" forKey:ICELAND];
        [_countryIds setValue:@"105" forKey:INDIA];
        [_countryIds setValue:@"106" forKey:INDONESIA];
        [_countryIds setValue:@"107" forKey:IRAN];
        [_countryIds setValue:@"108" forKey:IRAQ];
        [_countryIds setValue:@"109" forKey:IRELAND];
        [_countryIds setValue:@"110" forKey:ISLE_OF_MAN];
        [_countryIds setValue:@"111" forKey:ISRAEL];
        [_countryIds setValue:@"112" forKey:ITALY];
        [_countryIds setValue:@"113" forKey:JAMAICA];
        [_countryIds setValue:@"114" forKey:JAPAN];
        [_countryIds setValue:@"115" forKey:JERSEY];
        [_countryIds setValue:@"116" forKey:JORDAN];
        [_countryIds setValue:@"117" forKey:KAZAKHSTAN];
        [_countryIds setValue:@"118" forKey:KENYA];
        [_countryIds setValue:@"119" forKey:KIRIBATI];
        [_countryIds setValue:@"120" forKey:SOUTH_KOREA];
        [_countryIds setValue:@"121" forKey:NORTH_KOREA];
        [_countryIds setValue:@"122" forKey:KUWAIT];
        [_countryIds setValue:@"123" forKey:KYRGYZSTAN];
        [_countryIds setValue:@"124" forKey:LAOS];
        [_countryIds setValue:@"125" forKey:LATVIA];
        [_countryIds setValue:@"126" forKey:LEBANON];
        [_countryIds setValue:@"127" forKey:LESOTHO];
        [_countryIds setValue:@"128" forKey:LIBERIA];
        [_countryIds setValue:@"129" forKey:LIBYA];
        [_countryIds setValue:@"130" forKey:LIECHTENSTEIN];
        [_countryIds setValue:@"131" forKey:LITHUANIA];
        [_countryIds setValue:@"132" forKey:LUXEMBOURG];
        [_countryIds setValue:@"133" forKey:MACAO];
        [_countryIds setValue:@"134" forKey:MACEDONIA];
        [_countryIds setValue:@"135" forKey:MADAGASCAR];
        [_countryIds setValue:@"136" forKey:MALAWI];
        [_countryIds setValue:@"137" forKey:MALAYSIA];
        [_countryIds setValue:@"138" forKey:MALDIVES];
        [_countryIds setValue:@"139" forKey:MALI];
        [_countryIds setValue:@"140" forKey:MALTA];
        [_countryIds setValue:@"141" forKey:MARSHALL_ISLANDS];
        [_countryIds setValue:@"142" forKey:MARTINIQUE];
        [_countryIds setValue:@"143" forKey:MAURITANIA];
        [_countryIds setValue:@"144" forKey:MAURITIUS];
        [_countryIds setValue:@"145" forKey:MAYOTTE];
        [_countryIds setValue:@"146" forKey:MEXICO];
        [_countryIds setValue:@"147" forKey:MICRONESIA];
        [_countryIds setValue:@"148" forKey:MOLDOVA];
        [_countryIds setValue:@"149" forKey:MONACO];
        [_countryIds setValue:@"150" forKey:MONGOLIA];
        [_countryIds setValue:@"151" forKey:MONTENEGRO];
        [_countryIds setValue:@"152" forKey:MONTSERRAT];
        [_countryIds setValue:@"153" forKey:MOROCCO];
        [_countryIds setValue:@"154" forKey:MOZAMBIQUE];
        [_countryIds setValue:@"155" forKey:MYANMAR];
        [_countryIds setValue:@"156" forKey:NAMIBIA];
        [_countryIds setValue:@"157" forKey:NAURU];
        [_countryIds setValue:@"158" forKey:NEPAL];
        [_countryIds setValue:@"159" forKey:NETHERLANDS];
        [_countryIds setValue:@"160" forKey:NEW_CALEDONIA];
        [_countryIds setValue:@"161" forKey:NEW_ZEALAND];
        [_countryIds setValue:@"162" forKey:NICARAGUA];
        [_countryIds setValue:@"163" forKey:NIGER];
        [_countryIds setValue:@"164" forKey:NIGERIA];
        [_countryIds setValue:@"165" forKey:NIUE];
        [_countryIds setValue:@"166" forKey:NORFOLK_ISLAND];
        [_countryIds setValue:@"167" forKey:NORTHERN_MARIANA_ISLAND];
        [_countryIds setValue:@"168" forKey:NORWAY];
        [_countryIds setValue:@"169" forKey:OMAN];
        [_countryIds setValue:@"999" forKey:OTHER_COUNTRY];
        [_countryIds setValue:@"170" forKey:PAKISTAN];
        [_countryIds setValue:@"171" forKey:PALAU];
        [_countryIds setValue:@"172" forKey:PALESTINE];
        [_countryIds setValue:@"173" forKey:PANAMA];
        [_countryIds setValue:@"174" forKey:PAPUA_NEW_GUINEA];
        [_countryIds setValue:@"175" forKey:PARAGUAY];
        [_countryIds setValue:@"176" forKey:PERU];
        [_countryIds setValue:@"177" forKey:PHILIPPINES];
        [_countryIds setValue:@"178" forKey:PITCAIRN];
        [_countryIds setValue:@"179" forKey:POLAND];
        [_countryIds setValue:@"180" forKey:PORTUGAL];
        [_countryIds setValue:@"181" forKey:PUERTO_RICO];
        [_countryIds setValue:@"182" forKey:QATAR];
        [_countryIds setValue:@"183" forKey:REUNION];
        [_countryIds setValue:@"184" forKey:ROMANIA];
        [_countryIds setValue:@"185" forKey:RUSSIAN_FEDERATION];
        [_countryIds setValue:@"186" forKey:RWANDA];
        [_countryIds setValue:@"187" forKey:SAINT_BARTELEMEY];
        [_countryIds setValue:@"188" forKey:SAINT_HELENA];
        [_countryIds setValue:@"189" forKey:SAINT_KITTS];
        [_countryIds setValue:@"190" forKey:SAINT_LUCIA];
        [_countryIds setValue:@"191" forKey:SAINT_MARTIN];
        [_countryIds setValue:@"192" forKey:SAINT_PIERRE];
        [_countryIds setValue:@"193" forKey:SAINT_VINCENT];
        [_countryIds setValue:@"194" forKey:SAMOA];
        [_countryIds setValue:@"195" forKey:SAN_MARINO];
        [_countryIds setValue:@"196" forKey:SAO_TOME];
        [_countryIds setValue:@"197" forKey:SAUDI_ARABIA];
        [_countryIds setValue:@"198" forKey:SENEGAL];
        [_countryIds setValue:@"199" forKey:SERBIA];
        [_countryIds setValue:@"200" forKey:SEYCHELLES];
        [_countryIds setValue:@"201" forKey:SIERRA_LEONE];
        [_countryIds setValue:@"202" forKey:SINGAPORE];
        [_countryIds setValue:@"203" forKey:SINT_MAARTEN];
        [_countryIds setValue:@"204" forKey:SLOVAKIA];
        [_countryIds setValue:@"205" forKey:SLOVENIA];
        [_countryIds setValue:@"206" forKey:SOLOMON_ISLANDS];
        [_countryIds setValue:@"207" forKey:SOMALIA];
        [_countryIds setValue:@"208" forKey:SOUTH_AFRICA];
        [_countryIds setValue:@"209" forKey:SOUTH_GEORGIA];
        [_countryIds setValue:@"210" forKey:SPAIN];
        [_countryIds setValue:@"211" forKey:SRI_LANKA];
        [_countryIds setValue:@"212" forKey:SUDAN];
        [_countryIds setValue:@"213" forKey:SURINAME];
        [_countryIds setValue:@"214" forKey:SVALBARD];
        [_countryIds setValue:@"215" forKey:SWAZILAND];
        [_countryIds setValue:@"216" forKey:SWEDEN];
        [_countryIds setValue:@"217" forKey:SWITZERLAND];
        [_countryIds setValue:@"218" forKey:SYRIA];
        [_countryIds setValue:@"219" forKey:TAIWAN];
        [_countryIds setValue:@"220" forKey:TAJIKISTAN];
        [_countryIds setValue:@"221" forKey:TANZANIA];
        [_countryIds setValue:@"222" forKey:THAILAND];
        [_countryIds setValue:@"223" forKey:TIMOR];
        [_countryIds setValue:@"224" forKey:TOGO];
        [_countryIds setValue:@"225" forKey:TOKELAU];
        [_countryIds setValue:@"226" forKey:TONGA];
        [_countryIds setValue:@"227" forKey:TRINIDAD];
        [_countryIds setValue:@"228" forKey:TUNISIA];
        [_countryIds setValue:@"229" forKey:TURKEY];
        [_countryIds setValue:@"230" forKey:TURKMENISTAN];
        [_countryIds setValue:@"231" forKey:TURKS];
        [_countryIds setValue:@"232" forKey:TUVALU];
        [_countryIds setValue:@"233" forKey:UGANDA];
        [_countryIds setValue:@"234" forKey:UKRAINE];
        [_countryIds setValue:@"235" forKey:UAE];
        [_countryIds setValue:@"236" forKey:UK];
        [_countryIds setValue:@"237" forKey:US];
        [_countryIds setValue:@"238" forKey:US_MINOR];
        [_countryIds setValue:@"239" forKey:URUGUAY];
        [_countryIds setValue:@"240" forKey:UZBEKISTAN];
        [_countryIds setValue:@"241" forKey:VANUATU];
        [_countryIds setValue:@"242" forKey:VENEZUELA];
        [_countryIds setValue:@"243" forKey:VIETNAM];
        [_countryIds setValue:@"244" forKey:VIGRIN_ISLANDS_BRITISH];
        [_countryIds setValue:@"245" forKey:VIRGIN_ISLANDS_US];
        [_countryIds setValue:@"246" forKey:WALLIS_AND_FUTUNA];
        [_countryIds setValue:@"247" forKey:WESTERN_SAHARA];
        [_countryIds setValue:@"248" forKey:YEMEN];
        [_countryIds setValue:@"249" forKey:ZAMBIA];
        [_countryIds setValue:@"250" forKey:ZIMBABWE];
        
        _aCountries = @[@"Any", @"Afghanistan", @"Aland Islands", @"Albania", @"Algeria", @"American Samoa", @"Andorra", @"Angola", @"Anguilla", @"Antartica", @"Antigua and Barbuda", @"Argentina", @"Armenia", @"Aruba", @"Australia", @"Austria", @"Azerbaijan"];
        _bCountries = @[@"Bahamas", @"Bahrain", @"Bangladesh", @"Barbados", @"Belarus", @"Belgium", @"Belize", @"Benin", @"Bermuda", @"Bhutan", @"Bolivia", @"Bonaire, Saint Eustastius and Saba", @"Bosnia and Herzegovina", @"Botswana", @"Bouvet Island", @"Brazil", @"British Indian Ocean Territory", @"Brunei Darussalam", @"Bulgaria", @"Burkina Faso", @"Burundi"];
        _cCountries = @[@"Cambodia", @"Cameroon", @"Canada", @"Cape Verde", @"Cayman Islands", @"Central African Republic", @"Chad", @"Chile", @"China", @"Christmas Island", @"Cocos (Keeling) Islands", @"Colombia", @"Comoros", @"Congo", @"Congo, The Democratic Republic of the", @"Cook Islands", @"Costa Rica", @"Cote d'Ivoire", @"Criotia", @"Cuba", @"Curacao", @"Cyprus", @"Czech Republic"];
        _dCountries = @[@"Denmark", @"Djibouti", @"Dominica", @"Dominican Republic"];
        _eCountries = @[@"Ecuador", @"Egypt", @"El Salvador", @"Equatorial Guinea", @"Eritrea", @"Estonia", @"Ethiopia"];
        _fCountries = @[@"Falkland Islands", @"Faroe Islands", @"Fiji", @"Finland", @"France", @"French Guiana", @"French Polynesia", @"French Southern Territories"];
        _gCountries = @[@"Gabon", @"Gambia", @"Georgia", @"Germany", @"Ghana", @"Gibraltar", @"Greece", @"Greenland", @"Grenada", @"Guadeloupe", @"Guam", @"Guatemala", @"Guernsey", @"Guinea", @"Guinea-Bissau", @"Guyana"];
        _hCountries = @[@"Haiti", @"Heard Island and McDonald Islands", @"Holy See (Vatican City State)", @"Honduras", @"Hong Kong", @"Hungary"];
        _iCountries = @[@"Iceland", @"India", @"Indonesia", @"Iran, Islamic Republic of", @"Iraq", @"Ireland", @"Isle of Man", @"Israel", @"Italy"];
        _jCountries = @[@"Jamaica", @"Japan", @"Jersey", @"Jordan"];
        _kCountries = @[@"Kazakhstan", @"Kenya", @"Kiribati", @"Korea, Democratic People's Republic Of", @"Korea, Republic of", @"Kuwait", @"Kyrgyzstan"];
        _lCountries = @[@"Lao People's Democratic Republic", @"Latvia", @"Lebanon", @"Lesotho", @"Liberia", @"Libyan Arab Jamahiriya", @"Liechtenstein", @"Lithuania", @"Luxembourg"];
        _mCountries = @[@"Macao", @"Macedonia", @"Madagascar", @"Malawi", @"Malaysia", @"Maldives", @"Mali", @"Malta", @"Marshall Islands", @"Martinique", @"Mauritania", @"Mauritius", @"Mayotte", @"Mexico", @"Micronesia, Federated States of", @"Moldova, Republic of", @"Monaco", @"Mongolia", @"Montenegro", @"Montserrat", @"Morocco", @"Mozambique", @"Myanmar"];
        _nCountries = @[@"Namibia", @"Nauru", @"Nepal", @"Netherlands", @"New Caledonia", @"New zealand", @"Nicaragua", @"Niger", @"Niue", @"Norfolk Iland", @"Northern Mariana Islands", @"Norway"];
        _oCountries = @[@"Oman", @"Other Country"];
        _pCountries = @[@"Pakistan", @"Palau", @"Palestinian Territory", @"Panama", @"Papua New Guinea", @"Paraguay", @"Peru", @"Philippines", @"Pitcairn", @"Poland", @"Portugal", @"Puerto Rico"];
        _qCountries = @[@"Qatar"];
        _rCountries = @[@"Reunion", @"Romania", @"Rwanda"];
        _sCountries = @[@"Saint Bartelemey", @"Saint Helena", @"Saint Kitts and Nevis", @"Saint Lucia", @"Saint Martin", @"Saint Pierre and Miquelon", @"Sain Vincent and Grenadines", @"Samoa", @"San Marino", @"Sao Tome and Principe", @"Saudi Arabia", @"Senegal", @"Serbia", @"Seychelles", @"Sierra Leone", @"Singapore", @"Sint Maarten", @"Slovakia", @"Slovenia", @"Solomon Islands", @"Somalia", @"South Africa", @"South Georgia and the South Sandwich Islands", @"Spain", @"Sri Lanka", @"Sudan", @"Suriname", @"Svalbard and Jan Mayen", @"Swaziland", @"Sweden", @"Switzerland", @"Syrian Arab Republic"];
        _tCountries = @[@"Taiwan", @"Tajikistan", @"Tanzania, United Republic of", @"Thailand", @"Timor-Leste", @"Togo", @"Tokelau", @"Tonga", @"Trinidad and Tobago", @"Tunisia", @"Turkey", @"Turkmenistan", @"Turks and Caicos Islands", @"Tuvalu"];
        _uCountries = @[@"Uganda", @"Ukraine", @"United Arab Emirates", @"United Kingdom", @"United States", @"United States Minor Outlying Islads", @"Uruguay", @"Uzbekistan"];
        _vCountries = @[@"Vanuatu", @"Venezuela", @"Vietnam", @"Virgin Islands, British", @"Virgin Islands, U.S."];
        _wCountries = @[@"Wallis and Futuna", @"Western Sahara"];
        _yCountries = @[@"Yemen"];
        _zCountries = @[@"Zambia", @"Zimbabwe"];
        
        self.countries = [NSMutableArray arrayWithObjects:_aCountries, _bCountries, _cCountries, _dCountries, _eCountries, _fCountries, _gCountries, _hCountries, _iCountries, _jCountries, _kCountries, _lCountries, _mCountries, _nCountries, _oCountries, _pCountries, _qCountries, _rCountries, _sCountries, _tCountries, _uCountries, _vCountries, _wCountries, _yCountries, _zCountries, nil];
        
    }
    return self;
}

@end
