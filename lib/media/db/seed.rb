# encoding: UTF-8

require_relative "../model/language"
require_relative "../model/license"
require_relative "../model/category"
require_relative "../model/subcategory"
require_relative "../model/encoder"

module Media
  module Model
    DB.transaction do

      # Language

      {
        'Afar' => 'aa',
        'Abkhazian' => 'ab',
        'Afrikaans' => 'af',
        'Akan' => 'ak',
        'Albanian' => 'sq',
        'Amharic' => 'am',
        'Arabic' => 'ar',
        'Aragonese' => 'an',
        'Armenian' => 'hy',
        'Assamese' => 'as',
        'Avaric' => 'av',
        'Avestan' => 'ae',
        'Aymara' => 'ay',
        'Azerbaijani' => 'az',
        'Bashkir' => 'ba',
        'Bambara' => 'bm',
        'Basque' => 'eu',
        'Belarusian' => 'be',
        'Bengali' => 'bn',
        'Bihari' => 'bh',
        'Bislama' => 'bi',
        'Tibetan' => 'bo',
        'Bosnian' => 'bs',
        'Breton' => 'br',
        'Bulgarian' => 'bg',
        'Burmese' => 'my',
        'Catalan' => 'ca',
        'Czech' => 'cs',
        'Chamorro' => 'ch',
        'Chechen' => 'ce',
        'Chinese' => 'zh',
        'Church Slavic' => 'cu',
        'Chuvash' => 'cv',
        'Cornish' => 'kw',
        'Corsican' => 'co',
        'Cree' => 'cr',
        'Welsh' => 'cy',
        'Czech' => 'cs',
        'Danish' => 'da',
        'German' => 'de',
        'Divehi' => 'dv',
        'Dutch' => 'nl',
        'Dzongkha' => 'dz',
        'Greek' => 'el',
        'English' => 'en',
        'Esperanto' => 'eo',
        'Estonian' => 'et',
        'Basque' => 'eu',
        'Ewe' => 'ee',
        'Faroese' => 'fo',
        'Persian' => 'fa',
        'Fijian' => 'fj',
        'Finnish' => 'fi',
        'French' => 'fr',
        'Western Frisian' => 'fy',
        'Fulah' => 'ff',
        'Georgian' => 'ka',
        'German' => 'de',
        'Gaelic' => 'gd',
        'Irish' => 'ga',
        'Galician' => 'gl',
        'Manx' => 'gv',
        'Greek' => 'el',
        'Guarani' => 'gn',
        'Gujarati' => 'gu',
        'Haitian' => 'ht',
        'Hausa' => 'ha',
        'Hebrew' => 'he',
        'Herero' => 'hz',
        'Hindi' => 'hi',
        'Hiri Motu' => 'ho',
        'Croatian' => 'hr',
        'Hungarian' => 'hu',
        'Armenian' => 'hy',
        'Igbo' => 'ig',
        'Icelandic' => 'is',
        'Ido' => 'io',
        'Sichuan Yi' => 'ii',
        'Inuktitut' => 'iu',
        'Interlingue' => 'ie',
        'Interlingua' => 'ia',
        'Indonesian' => 'id',
        'Inupiaq' => 'ik',
        'Icelandic' => 'is',
        'Italian' => 'it',
        'Javanese' => 'jv',
        'Japanese' => 'ja',
        'Kalaallisut' => 'kl',
        'Kannada' => 'kn',
        'Kashmiri' => 'ks',
        'Georgian' => 'ka',
        'Kanuri' => 'kr',
        'Kazakh' => 'kk',
        'Central Khmer' => 'km',
        'Kikuyu' => 'ki',
        'Kinyarwanda' => 'rw',
        'Kirghiz' => 'ky',
        'Komi' => 'kv',
        'Kongo' => 'kg',
        'Korean' => 'ko',
        'Kuanyama' => 'kj',
        'Kurdish' => 'ku',
        'Lao' => 'lo',
        'Latin' => 'la',
        'Latvian' => 'lv',
        'Limburgan' => 'li',
        'Lingala' => 'ln',
        'Lithuanian' => 'lt',
        'Luxembourgish' => 'lb',
        'Luba-Katanga' => 'lu',
        'Ganda' => 'lg',
        'Macedonian' => 'mk',
        'Marshallese' => 'mh',
        'Malayalam' => 'ml',
        'Maori' => 'mi',
        'Marathi' => 'mr',
        'Malay' => 'ms',
        'Macedonian' => 'mk',
        'Malagasy' => 'mg',
        'Maltese' => 'mt',
        'Moldavian' => 'mo',
        'Mongolian' => 'mn',
        'Maori' => 'mi',
        'Malay' => 'ms',
        'Burmese' => 'my',
        'Nauru' => 'na',
        'Navajo' => 'nv',
        'Ndebele, South' => 'nr',
        'Ndebele, North' => 'nd',
        'Ndonga' => 'ng',
        'Nepali' => 'ne',
        'Dutch' => 'nl',
        'Norwegian Nynorsk' => 'nn',
        'Bokmål, Norwegian' => 'nb',
        'Norwegian' => 'no',
        'Chichewa' => 'ny',
        'Occitan' => 'oc',
        'Ojibwa' => 'oj',
        'Oriya' => 'or',
        'Oromo' => 'om',
        'Ossetian' => 'os',
        'Panjabi' => 'pa',
        'Persian' => 'fa',
        'Pali' => 'pi',
        'Polish' => 'pl',
        'Portuguese' => 'pt',
        'Pushto' => 'ps',
        'Quechua' => 'qu',
        'Romansh' => 'rm',
        'Romanian' => 'ro',
        'Romanian' => 'ro',
        'Rundi' => 'rn',
        'Russian' => 'ru',
        'Sango' => 'sg',
        'Sanskrit' => 'sa',
        'Serbian' => 'sr',
        'Croatian' => 'hr',
        'Sinhala' => 'si',
        'Slovak' => 'sk',
        'Slovak' => 'sk',
        'Slovenian' => 'sl',
        'Northern Sami' => 'se',
        'Samoan' => 'sm',
        'Shona' => 'sn',
        'Sindhi' => 'sd',
        'Somali' => 'so',
        'Sotho, Southern' => 'st',
        'Spanish' => 'es',
        'Albanian' => 'sq',
        'Sardinian' => 'sc',
        'Serbian' => 'sr',
        'Swati' => 'ss',
        'Sundanese' => 'su',
        'Swahili' => 'sw',
        'Swedish' => 'sv',
        'Tahitian' => 'ty',
        'Tamil' => 'ta',
        'Tatar' => 'tt',
        'Telugu' => 'te',
        'Tajik' => 'tg',
        'Tagalog' => 'tl',
        'Thai' => 'th',
        'Tibetan' => 'bo',
        'Tigrinya' => 'ti',
        'Tonga' => 'to',
        'Tswana' => 'tn',
        'Tsonga' => 'ts',
        'Turkmen' => 'tk',
        'Turkish' => 'tr',
        'Twi' => 'tw',
        'Uighur' => 'ug',
        'Ukrainian' => 'uk',
        'Urdu' => 'ur',
        'Uzbek' => 'uz',
        'Venda' => 've',
        'Vietnamese' => 'vi',
        'Volapük' => 'vo',
        'Welsh' => 'cy',
        'Walloon' => 'wa',
        'Wolof' => 'wo',
        'Xhosa' => 'xh',
        'Yiddish' => 'yi',
        'Yoruba' => 'yo',
        'Zhuang' => 'za',
        'Chinese' => 'zh',
        'Zulu' => 'zu'
      }.each do |name, id|
        Language.find_or_create name: name, id: id
      end

      # License

      {
        'CC BY'       => 'Attribution',
        'CC BY-ND'    => 'Attribution-NoDerivs',
        'CC BY-NC-SA' => 'Attribution-NonCommercial-ShareAlike',
        'CC BY-SA'    => 'Attribution-ShareAlike',
        'CC BY-NC'    => 'Attribution-NonCommercial',
        'CC BY-NC-ND' => 'Attribution-NonCommercial-NoDerivs'
      }.each do |id, name|
        License.find_or_create id: id, name: name
      end

      # Category

      {
        '100' => 'Business',
        '101' => 'Engineering',
        '102' => 'Fine Arts',
        '103' => 'Health & Medicine',
        '104' => 'History',
        '105' => 'Humanities',
        '106' => 'Language',
        '107' => 'Literature',
        '108' => 'Mathematics',
        '109' => 'Science',
        '110' => 'Social Science',
        '111' => 'Society',
        '112' => 'Teaching & Education'
      }.each do |id, name|
        Category.find_or_create id: id, name: name
      end

      # Subcategory

      # Business
      {
        '100' => 'Economics',
        '101' => 'Finance',
        '102' => 'Hospitality',
        '103' => 'Management',
        '104' => 'Marketing',
        '105' => 'Personal Finance',
        '106' => 'Real Estate'
      }.each do |id, name|
        Subcategory.find_or_create id: id, name: name, category_id: 100
      end

      # Engineering
      {
        '100' => 'Chemical & Petroleum',
        '101' => 'Civil',
        '102' => 'Computer Science',
        '103' => 'Electrical',
        '104' => 'Environmental',
        '105' => 'Mechanical'
      }.each do |id, name|
        Subcategory.find_or_create id: id, name: name, category_id: 101
      end

      # Fine Arts
      {
        '100' => 'Architecture',
        '101' => 'Art',
        '102' => 'Art History',
        '103' => 'Dance',
        '104' => 'Film',
        '105' => 'Graphic Design',
        '106' => 'Interior Design',
        '107' => 'Music',
        '108' => 'Theater'
      }.each do |id, name|
        Subcategory.find_or_create id: id, name: name, category_id: 102
      end

      # Health & Medicine
      {
        '100' => 'Anatomy & Physiology',
        '101' => 'Behavioral Science',
        '102' => 'Dentistry',
        '103' => 'Diet & Nutrition',
        '104' => 'Emergency',
        '105' => 'Genetics',
        '106' => 'Gerontology',
        '107' => 'Health & Exercise Science',
        '108' => 'Immunology',
        '109' => 'Neuroscience',
        '110' => 'Pharmacology & Toxicology',
        '111' => 'Psychiatry',
        '112' => 'Public Health',
        '113' => 'Radiology'
      }.each do |id, name|
        Subcategory.find_or_create id: id, name: name, category_id: 103
      end

      # History
      {
        '100' => 'Ancient',
        '101' => 'Medieval',
        '102' => 'Military',
        '103' => 'Modern',
        '104' => 'African',
        '105' => 'Asian',
        '106' => 'European',
        '107' => 'Middle Eastern',
        '108' => 'North American',
        '109' => 'South American'
      }.each do |id, name|
        Subcategory.find_or_create id: id, name: name, category_id: 104
      end

      # Humanities
      {
        '100' => 'Communications',
        '101' => 'Philosophy',
        '102' => 'Religion'
      }.each do |id, name|
        Subcategory.find_or_create id: id, name: name, category_id: 105
      end

      # Language
      {
        '100' => 'African',
        '101' => 'Ancient',
        '102' => 'Asian',
        '103' => 'Eastern European/Slavic',
        '104' => 'English',
        '105' => 'English Language Learners',
        '106' => 'French',
        '107' => 'German',
        '108' => 'Italian',
        '109' => 'Linguistics',
        '110' => 'Middle Eastern',
        '111' => 'Spanish & Portuguese',
        '112' => 'Speech Pathology'
      }.each do |id, name|
        Subcategory.find_or_create id: id, name: name, category_id: 106
      end

      # Literature
      {
        '100' => 'Anthologies',
        '101' => 'Biography',
        '102' => 'Classics',
        '103' => 'Criticism',
        '104' => 'Fiction',
        '105' => 'Poetry'
      }.each do |id, name|
        Subcategory.find_or_create id: id, name: name, category_id: 107
      end


      # Mathematics
      {
        '100' => 'Advanced Mathematics',
        '101' => 'Algebra',
        '102' => 'Arithmetic',
        '103' => 'Calculus',
        '104' => 'Geometry',
        '105' => 'Statistics'
      }.each do |id, name|
        Subcategory.find_or_create id: id, name: name, category_id: 108
      end

      # Science
      {
        '100' => 'Agricultural',
        '101' => 'Astronomy',
        '102' => 'Atmospheric',
        '103' => 'Biology',
        '104' => 'Chemistry',
        '105' => 'Ecology',
        '106' => 'Geography',
        '107' => 'Geology',
        '108' => 'Physics'
      }.each do |id, name|
        Subcategory.find_or_create id: id, name: name, category_id: 109
      end

      # Social Science
      {
        '100' => 'Law',
        '101' => 'Political Science',
        '102' => 'Public Administration',
        '103' => 'Psychology',
        '104' => 'Social Welfare',
        '105' => 'Sociology'
      }.each do |id, name|
        Subcategory.find_or_create id: id, name: name, category_id: 110
      end

      # Society
      {
        '100' => 'African-American Studies',
        '101' => 'Asian Studies',
        '102' => 'European & Russian Studies',
        '103' => 'Indigenous Studies',
        '104' => 'Latin & Caribbean Studies',
        '105' => 'Middle Eastern Studies',
        '106' => "Women's Studies"
      }.each do |id, name|
        Subcategory.find_or_create id: id, name: name, category_id: 111
      end


      # Teaching & Education
      {
        '100' => 'Curriculum & Teaching',
        '101' => 'Educational Leadership',
        '102' => 'Family & Childcare',
        '103' => 'Learning Resources',
        '104' => 'Psychology & Research',
        '105' => 'Special Education'
      }.each do |id, name|
        Subcategory.find_or_create id: id, name: name, category_id: 112
      end

      # Encoders

      video_size = '1280x720'
      thumb_size = '480x270'

      Encoder.find_or_create name: 'poster.png',
      options: {
          f: 'image2',
          s: video_size,
          vframes: 1
      }.hstore

      Encoder.find_or_create name: 'thumb.png',
      options: {
          f: 'image2',
          s: thumb_size,
          vframes: 1
      }.hstore

      Encoder.find_or_create name: 'mp4',
      options: {
          acodec: 'aac',
          ac: 2,
          strict: 'experimental',
          ab: '160k',
          s: video_size,
          vcodec: 'libx264',
          preset: 'slow',
          'profile:v' => 'baseline',
          level: 30,
          maxrate: 10000000,
          bufsize: 10000000,
          'b:v' => '1200k',
          f: 'mp4',
          threads: 0
      }.hstore

      Encoder.find_or_create name: 'webm',
      options: {
          f: 'webm',
          s: video_size,
          acodec: 'libvorbis',
          ab: '160k',
          vcodec: 'libvpx',
          vb: '1500k',
          threads: 0,
          strict: -2
      }.hstore
    end
  end
end
