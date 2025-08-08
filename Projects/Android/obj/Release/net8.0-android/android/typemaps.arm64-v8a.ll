; ModuleID = 'typemaps.arm64-v8a.ll'
source_filename = "typemaps.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.TypeMapJava = type {
	i32, ; uint32_t module_index
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_name_index
}

%struct.TypeMapModule = type {
	[16 x i8], ; uint8_t module_uuid[16]
	i32, ; uint32_t entry_count
	i32, ; uint32_t duplicate_count
	ptr, ; TypeMapModuleEntry map
	ptr, ; TypeMapModuleEntry duplicate_map
	ptr, ; char* assembly_name
	ptr, ; MonoImage image
	i32, ; uint32_t java_name_width
	ptr ; uint8_t java_map
}

%struct.TypeMapModuleEntry = type {
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_map_index
}

@map_module_count = dso_local local_unnamed_addr constant i32 2, align 4

@java_type_count = dso_local local_unnamed_addr constant i32 105, align 4

; Managed modules map
@map_modules = dso_local local_unnamed_addr global [2 x %struct.TypeMapModule] [
	%struct.TypeMapModule {
		[16 x i8] c"_\F3\CA\F8\BD\E6\AAC\B1\CE|\F5\0APx\0D", ; module_uuid: f8caf35f-e6bd-43aa-b1ce-7cf50a50780d
		i32 1, ; uint32_t entry_count (0x1)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module0_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.0_assembly_name, ; assembly_name: RAZR_PointCRep.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 0
	%struct.TypeMapModule {
		[16 x i8] c"\A6\145\AA\FCa\E0@\85E\06\F0:8W\1C", ; module_uuid: aa3514a6-61fc-40e0-8545-06f03a38571c
		i32 104, ; uint32_t entry_count (0x68)
		i32 36, ; uint32_t duplicate_count (0x24)
		ptr @module1_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module1_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.1_assembly_name, ; assembly_name: Mono.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	} ; 1
], align 8

; Java types name hashes
@map_java_hashes = dso_local local_unnamed_addr constant [105 x i64] [
	i64 128182020419974451, ; 0: 0x1c764de51b97533 => java/lang/String
	i64 361870449891484378, ; 1: 0x5059f41c47e22da => android/os/Bundle
	i64 698692053645229055, ; 2: 0x9b240b890e97bff => javax/net/ssl/HttpsURLConnection
	i64 870874870088288028, ; 3: 0xc15f8148b6d471c => java/lang/Exception
	i64 1079586186822872943, ; 4: 0xefb75eac1feef6f => java/util/function/Consumer
	i64 1217044833273073796, ; 5: 0x10e3cfd3e2f75084 => java/util/HashSet
	i64 1283121375857603354, ; 6: 0x11ce9017d3b3f31a => java/net/ConnectException
	i64 1317579852464953526, ; 7: 0x1248fbe51d6298b6 => java/io/FileInputStream
	i64 1320822650197077237, ; 8: 0x12548133cc496cf5 => android/runtime/JavaProxyThrowable
	i64 1362770524300979611, ; 9: 0x12e9889253552d9b => java/util/Iterator
	i64 1550860884384862055, ; 10: 0x1585c3c1edcecf67 => java/net/ProtocolException
	i64 1747499027921055994, ; 11: 0x18405d1b749330fa => android/os/BaseBundle
	i64 1831728799718484971, ; 12: 0x196b9ba37012abeb => java/io/IOException
	i64 1877272793125324469, ; 13: 0x1a0d69a8bcbd86b5 => java/net/Proxy
	i64 2164140653916027403, ; 14: 0x1e08927568a57a0b => java/io/InputStream
	i64 2266689907793747123, ; 15: 0x1f74e67632025cb3 => java/net/HttpURLConnection
	i64 2270205244544766606, ; 16: 0x1f8163a45051d28e => android/view/SurfaceHolder
	i64 2319268360137032813, ; 17: 0x202fb24918c5446d => java/security/SecureRandom
	i64 2375243497726607572, ; 18: 0x20f68f60690d00d4 => java/lang/System
	i64 2542726837267699812, ; 19: 0x2349949628319864 => android/view/Window
	i64 3071747017624329461, ; 20: 0x2aa109a3415d1cf5 => android/os/Build
	i64 3476617847597562063, ; 21: 0x303f6d8331d5f8cf => java/io/PrintWriter
	i64 3656396631051491790, ; 22: 0x32be215d0fc259ce => java/net/InetSocketAddress
	i64 3852049679258842853, ; 23: 0x35753ac6356176e5 => android/view/SurfaceHolder$Callback
	i64 3936478700004404583, ; 24: 0x36a12e8573a76d67 => java/net/SocketAddress
	i64 3940353796168302121, ; 25: 0x36aef2e695f93e29 => android/graphics/Canvas
	i64 3957166361670620563, ; 26: 0x36eaadd708809593 => javax/security/cert/Certificate
	i64 4305371449952891808, ; 27: 0x3bbfc085dc8cf3a0 => java/lang/Class
	i64 4590799101254748484, ; 28: 0x3fb5cb75a178c944 => javax/net/ssl/TrustManagerFactory
	i64 4756101769800025001, ; 29: 0x4201115c588983a9 => javax/net/SocketFactory
	i64 5214467817578676657, ; 30: 0x485d82da477bc1b1 => java/lang/Error
	i64 5793982059409158284, ; 31: 0x50685bfc3611b08c => java/net/URLConnection
	i64 5991054489085362647, ; 32: 0x53248050dbf141d7 => javax/security/cert/X509Certificate
	i64 6000768439507874839, ; 33: 0x5347031a303df417 => java/lang/Enum
	i64 6740334783866200195, ; 34: 0x5d8a7ac62b8de083 => javax/net/ssl/SSLSession
	i64 6887549445287282166, ; 35: 0x5f957dba8b4985f6 => android/view/Surface
	i64 7291810569935423650, ; 36: 0x6531b714667088a2 => android/os/Build$VERSION
	i64 7620119821450638162, ; 37: 0x69c01a9abf7a7352 => java/io/InterruptedIOException
	i64 7658195837123306865, ; 38: 0x6a476089fc1c2571 => java/lang/Character
	i64 7933543037734065265, ; 39: 0x6e199b5bee699471 => java/util/HashMap
	i64 8190305621607579207, ; 40: 0x71a9cf9199cdfe47 => java/nio/channels/spi/AbstractInterruptibleChannel
	i64 8416619862292774857, ; 41: 0x74cdd72bed753fc9 => java/lang/IllegalArgumentException
	i64 8487642170263250902, ; 42: 0x75ca29959b2aa7d6 => android/content/ContextWrapper
	i64 8587172038193766563, ; 43: 0x772bc378d1b4e0a3 => java/lang/Runnable
	i64 8950391188589719199, ; 44: 0x7c362d5d64ad2e9f => java/lang/Boolean
	i64 9154019302997878316, ; 45: 0x7f099c0e5641e62c => javax/net/ssl/KeyManager
	i64 9217569019755338609, ; 46: 0x7feb622fcb299b71 => java/security/Principal
	i64 9667515047141612341, ; 47: 0x8629e9b6f59e9b35 => java/lang/Thread
	i64 9785570804745343508, ; 48: 0x87cd54ccfd479214 => java/net/URL
	i64 9866983915955550238, ; 49: 0x88ee91981305f81e => java/lang/SecurityException
	i64 9869939015140501507, ; 50: 0x88f9113db837e803 => android/app/Activity
	i64 9977296435420958008, ; 51: 0x8a767a3efc098d38 => java/lang/NullPointerException
	i64 10266059374509936169, ; 52: 0x8e785e9bf4bbce29 => java/lang/Long
	i64 10589642565195629679, ; 53: 0x92f5f7ce84d7846f => java/lang/UnsupportedOperationException
	i64 10722894652849872693, ; 54: 0x94cf5fdfdb0d5f35 => java/lang/Short
	i64 11005920483369566278, ; 55: 0x98bce25e25704046 => java/util/Random
	i64 11112718717483603117, ; 56: 0x9a384ecbbc71d4ad => android/os/Handler
	i64 11393831178655295976, ; 57: 0x9e1f05170284e9e8 => javax/net/ssl/SSLContext
	i64 11573301743732151818, ; 58: 0xa09ca09e3190560a => mono/java/lang/RunnableImplementor
	i64 11712899692065226922, ; 59: 0xa28c94365b5480aa => java/util/ArrayList
	i64 11763058807128842702, ; 60: 0xa33ec7a966f1e1ce => java/security/cert/Certificate
	i64 11954228872253987625, ; 61: 0xa5e5f3d2b66adb29 => android/view/View
	i64 12228984007958404582, ; 62: 0xa9b61429ce4b1de6 => android/content/Context
	i64 12426529965699990912, ; 63: 0xac73e72a4c4b8580 => java/lang/IndexOutOfBoundsException
	i64 12476375190645835422, ; 64: 0xad24fd221af1069e => android/os/Looper
	i64 12488842103917764438, ; 65: 0xad5147b98bf5df56 => java/lang/IllegalStateException
	i64 12532121860257401396, ; 66: 0xadeb0a6f128cca34 => java/lang/Number
	i64 12806567541869262104, ; 67: 0xb1ba1153c52a3518 => java/lang/Integer
	i64 12882710959019299141, ; 68: 0xb2c8955c98609145 => java/net/SocketTimeoutException
	i64 13252491226311317086, ; 69: 0xb7ea4e8e3d44565e => android/view/SurfaceHolder$Callback2
	i64 13402779434266666368, ; 70: 0xba003ce26e602580 => mono/android/TypeManager
	i64 13493236796125990997, ; 71: 0xbb419b603751d055 => android/graphics/Rect
	i64 13502560151794130917, ; 72: 0xbb62baeb1e089fe5 => javax/security/auth/Subject
	i64 13770727111868296170, ; 73: 0xbf1b735909c02bea => java/io/StringWriter
	i64 13789203013919682202, ; 74: 0xbf5d1715346dae9a => java/lang/RuntimeException
	i64 13805562342397192842, ; 75: 0xbf9735ce2f182a8a => android/util/AttributeSet
	i64 13959986462581077347, ; 76: 0xc1bbd5b97b683563 => java/net/UnknownServiceException
	i64 14008091590880237307, ; 77: 0xc266bd15778d96fb => android/os/Process
	i64 14031640676547298208, ; 78: 0xc2ba66da3d8603a0 => java/nio/channels/FileChannel
	i64 14160925941038085484, ; 79: 0xc485b71d9630756c => javax/net/ssl/KeyManagerFactory
	i64 14167891754637755728, ; 80: 0xc49e767c735e8550 => java/lang/Object
	i64 14180814796703042768, ; 81: 0xc4cc5feca7168cd0 => java/lang/ClassCastException
	i64 14206023932851353817, ; 82: 0xc525ef800c4d78d9 => mono/android/runtime/OutputStreamAdapter
	i64 14347188694821580438, ; 83: 0xc71b741a70572e96 => crc649bbba407d2477f6e/MainActivity
	i64 14501341618205132561, ; 84: 0xc93f1d5ecfb48711 => java/lang/Byte
	i64 14684559126920293129, ; 85: 0xcbca08b94b4deb09 => java/lang/CharSequence
	i64 14940408132235664607, ; 86: 0xcf56fe09e1439cdf => java/lang/Throwable
	i64 15142650489578038267, ; 87: 0xd22580641d31a3fb => java/lang/StackTraceElement
	i64 15178898666151156562, ; 88: 0xd2a647ea65971b52 => javax/net/ssl/HostnameVerifier
	i64 15633873768898914415, ; 89: 0xd8f6ad5c6a84686f => java/io/Writer
	i64 15767615218119146656, ; 90: 0xdad1d2801f08fca0 => javax/net/ssl/SSLSessionContext
	i64 15888603495552893685, ; 91: 0xdc7fa8b2a175c2f5 => javax/net/ssl/TrustManager
	i64 15896143924811176167, ; 92: 0xdc9a72ada0da98e7 => java/net/SocketException
	i64 16314168557433322311, ; 93: 0xe26791dde7a8fb47 => android/view/ContextThemeWrapper
	i64 16542847110558016359, ; 94: 0xe593ffcc9e686367 => android/app/Application
	i64 16603717322881265010, ; 95: 0xe66c40ef55566d72 => mono/android/runtime/JavaObject
	i64 16723123314454325679, ; 96: 0xe814780d351a69af => mono/android/runtime/InputStreamAdapter
	i64 17125416866214736517, ; 97: 0xeda9b3e7cd367285 => java/io/OutputStream
	i64 17490083481060646178, ; 98: 0xf2b94242748c1d22 => java/util/Enumeration
	i64 17498018958444438720, ; 99: 0xf2d57388c321a4c0 => java/lang/Double
	i64 17519581955836770800, ; 100: 0xf3220ef752fe79f0 => java/security/KeyStore
	i64 17605619666541934257, ; 101: 0xf453b9cee2dcf6b1 => java/net/Proxy$Type
	i64 18216578448169670053, ; 102: 0xfcce4995423095a5 => javax/net/ssl/SSLSocketFactory
	i64 18401512074820890716, ; 103: 0xff5f4dbc95c2b05c => java/lang/Float
	i64 18401692079723824300 ; 104: 0xff5ff1733e0ec4ac => java/util/Collection
], align 8

@module0_managed_to_java = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554439, ; uint32_t type_token_id (0x2000007)
		i32 83; uint32_t java_map_index (0x53)
	} ; 0
], align 4

@module1_managed_to_java = internal dso_local constant [104 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554518, ; uint32_t type_token_id (0x2000056)
		i32 26; uint32_t java_map_index (0x1a)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554520, ; uint32_t type_token_id (0x2000058)
		i32 32; uint32_t java_map_index (0x20)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554522, ; uint32_t type_token_id (0x200005a)
		i32 72; uint32_t java_map_index (0x48)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554523, ; uint32_t type_token_id (0x200005b)
		i32 29; uint32_t java_map_index (0x1d)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554525, ; uint32_t type_token_id (0x200005d)
		i32 2; uint32_t java_map_index (0x2)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554527, ; uint32_t type_token_id (0x200005f)
		i32 88; uint32_t java_map_index (0x58)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554529, ; uint32_t type_token_id (0x2000061)
		i32 45; uint32_t java_map_index (0x2d)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554531, ; uint32_t type_token_id (0x2000063)
		i32 34; uint32_t java_map_index (0x22)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554533, ; uint32_t type_token_id (0x2000065)
		i32 90; uint32_t java_map_index (0x5a)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554535, ; uint32_t type_token_id (0x2000067)
		i32 91; uint32_t java_map_index (0x5b)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554537, ; uint32_t type_token_id (0x2000069)
		i32 79; uint32_t java_map_index (0x4f)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554538, ; uint32_t type_token_id (0x200006a)
		i32 57; uint32_t java_map_index (0x39)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554539, ; uint32_t type_token_id (0x200006b)
		i32 102; uint32_t java_map_index (0x66)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554541, ; uint32_t type_token_id (0x200006d)
		i32 28; uint32_t java_map_index (0x1c)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554542, ; uint32_t type_token_id (0x200006e)
		i32 75; uint32_t java_map_index (0x4b)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554544, ; uint32_t type_token_id (0x2000070)
		i32 11; uint32_t java_map_index (0xb)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554545, ; uint32_t type_token_id (0x2000071)
		i32 20; uint32_t java_map_index (0x14)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554546, ; uint32_t type_token_id (0x2000072)
		i32 36; uint32_t java_map_index (0x24)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554547, ; uint32_t type_token_id (0x2000073)
		i32 1; uint32_t java_map_index (0x1)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554548, ; uint32_t type_token_id (0x2000074)
		i32 56; uint32_t java_map_index (0x38)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554549, ; uint32_t type_token_id (0x2000075)
		i32 64; uint32_t java_map_index (0x40)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554550, ; uint32_t type_token_id (0x2000076)
		i32 77; uint32_t java_map_index (0x4d)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554553, ; uint32_t type_token_id (0x2000079)
		i32 50; uint32_t java_map_index (0x32)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554554, ; uint32_t type_token_id (0x200007a)
		i32 94; uint32_t java_map_index (0x5e)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554559, ; uint32_t type_token_id (0x200007f)
		i32 93; uint32_t java_map_index (0x5d)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554560, ; uint32_t type_token_id (0x2000080)
		i32 23; uint32_t java_map_index (0x17)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554562, ; uint32_t type_token_id (0x2000082)
		i32 69; uint32_t java_map_index (0x45)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554564, ; uint32_t type_token_id (0x2000084)
		i32 16; uint32_t java_map_index (0x10)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554566, ; uint32_t type_token_id (0x2000086)
		i32 35; uint32_t java_map_index (0x23)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554567, ; uint32_t type_token_id (0x2000087)
		i32 61; uint32_t java_map_index (0x3d)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554568, ; uint32_t type_token_id (0x2000088)
		i32 19; uint32_t java_map_index (0x13)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554591, ; uint32_t type_token_id (0x200009f)
		i32 96; uint32_t java_map_index (0x60)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554593, ; uint32_t type_token_id (0x20000a1)
		i32 104; uint32_t java_map_index (0x68)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554595, ; uint32_t type_token_id (0x20000a3)
		i32 39; uint32_t java_map_index (0x27)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554604, ; uint32_t type_token_id (0x20000ac)
		i32 59; uint32_t java_map_index (0x3b)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554606, ; uint32_t type_token_id (0x20000ae)
		i32 95; uint32_t java_map_index (0x5f)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554607, ; uint32_t type_token_id (0x20000af)
		i32 8; uint32_t java_map_index (0x8)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554608, ; uint32_t type_token_id (0x20000b0)
		i32 5; uint32_t java_map_index (0x5)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554620, ; uint32_t type_token_id (0x20000bc)
		i32 82; uint32_t java_map_index (0x52)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554626, ; uint32_t type_token_id (0x20000c2)
		i32 25; uint32_t java_map_index (0x19)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554627, ; uint32_t type_token_id (0x20000c3)
		i32 71; uint32_t java_map_index (0x47)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554629, ; uint32_t type_token_id (0x20000c5)
		i32 62; uint32_t java_map_index (0x3e)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554631, ; uint32_t type_token_id (0x20000c7)
		i32 42; uint32_t java_map_index (0x2a)
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 33554632, ; uint32_t type_token_id (0x20000c8)
		i32 98; uint32_t java_map_index (0x62)
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 33554634, ; uint32_t type_token_id (0x20000ca)
		i32 9; uint32_t java_map_index (0x9)
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 33554636, ; uint32_t type_token_id (0x20000cc)
		i32 55; uint32_t java_map_index (0x37)
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 33554637, ; uint32_t type_token_id (0x20000cd)
		i32 4; uint32_t java_map_index (0x4)
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 33554639, ; uint32_t type_token_id (0x20000cf)
		i32 46; uint32_t java_map_index (0x2e)
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 33554641, ; uint32_t type_token_id (0x20000d1)
		i32 100; uint32_t java_map_index (0x64)
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 33554642, ; uint32_t type_token_id (0x20000d2)
		i32 17; uint32_t java_map_index (0x11)
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 33554643, ; uint32_t type_token_id (0x20000d3)
		i32 60; uint32_t java_map_index (0x3c)
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 33554645, ; uint32_t type_token_id (0x20000d5)
		i32 78; uint32_t java_map_index (0x4e)
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 33554647, ; uint32_t type_token_id (0x20000d7)
		i32 40; uint32_t java_map_index (0x28)
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 33554649, ; uint32_t type_token_id (0x20000d9)
		i32 6; uint32_t java_map_index (0x6)
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 33554650, ; uint32_t type_token_id (0x20000da)
		i32 15; uint32_t java_map_index (0xf)
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 33554652, ; uint32_t type_token_id (0x20000dc)
		i32 22; uint32_t java_map_index (0x16)
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 33554653, ; uint32_t type_token_id (0x20000dd)
		i32 10; uint32_t java_map_index (0xa)
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 33554654, ; uint32_t type_token_id (0x20000de)
		i32 13; uint32_t java_map_index (0xd)
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 33554655, ; uint32_t type_token_id (0x20000df)
		i32 101; uint32_t java_map_index (0x65)
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 33554656, ; uint32_t type_token_id (0x20000e0)
		i32 24; uint32_t java_map_index (0x18)
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 33554658, ; uint32_t type_token_id (0x20000e2)
		i32 92; uint32_t java_map_index (0x5c)
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 33554659, ; uint32_t type_token_id (0x20000e3)
		i32 68; uint32_t java_map_index (0x44)
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 33554660, ; uint32_t type_token_id (0x20000e4)
		i32 76; uint32_t java_map_index (0x4c)
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 33554661, ; uint32_t type_token_id (0x20000e5)
		i32 48; uint32_t java_map_index (0x30)
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 33554662, ; uint32_t type_token_id (0x20000e6)
		i32 31; uint32_t java_map_index (0x1f)
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 33554665, ; uint32_t type_token_id (0x20000e9)
		i32 7; uint32_t java_map_index (0x7)
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 14; uint32_t java_map_index (0xe)
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 37; uint32_t java_map_index (0x25)
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 33554669, ; uint32_t type_token_id (0x20000ed)
		i32 12; uint32_t java_map_index (0xc)
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 33554670, ; uint32_t type_token_id (0x20000ee)
		i32 97; uint32_t java_map_index (0x61)
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 21; uint32_t java_map_index (0x15)
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 73; uint32_t java_map_index (0x49)
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 33554674, ; uint32_t type_token_id (0x20000f2)
		i32 89; uint32_t java_map_index (0x59)
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 33554676, ; uint32_t type_token_id (0x20000f4)
		i32 44; uint32_t java_map_index (0x2c)
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 33554677, ; uint32_t type_token_id (0x20000f5)
		i32 84; uint32_t java_map_index (0x54)
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 33554678, ; uint32_t type_token_id (0x20000f6)
		i32 38; uint32_t java_map_index (0x26)
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 33554679, ; uint32_t type_token_id (0x20000f7)
		i32 27; uint32_t java_map_index (0x1b)
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 33554680, ; uint32_t type_token_id (0x20000f8)
		i32 81; uint32_t java_map_index (0x51)
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 33554681, ; uint32_t type_token_id (0x20000f9)
		i32 99; uint32_t java_map_index (0x63)
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 33554682, ; uint32_t type_token_id (0x20000fa)
		i32 33; uint32_t java_map_index (0x21)
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 33554684, ; uint32_t type_token_id (0x20000fc)
		i32 30; uint32_t java_map_index (0x1e)
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 33554685, ; uint32_t type_token_id (0x20000fd)
		i32 3; uint32_t java_map_index (0x3)
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 33554686, ; uint32_t type_token_id (0x20000fe)
		i32 103; uint32_t java_map_index (0x67)
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 33554687, ; uint32_t type_token_id (0x20000ff)
		i32 85; uint32_t java_map_index (0x55)
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 33554689, ; uint32_t type_token_id (0x2000101)
		i32 41; uint32_t java_map_index (0x29)
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 33554690, ; uint32_t type_token_id (0x2000102)
		i32 65; uint32_t java_map_index (0x41)
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 33554691, ; uint32_t type_token_id (0x2000103)
		i32 63; uint32_t java_map_index (0x3f)
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 33554692, ; uint32_t type_token_id (0x2000104)
		i32 67; uint32_t java_map_index (0x43)
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 33554693, ; uint32_t type_token_id (0x2000105)
		i32 43; uint32_t java_map_index (0x2b)
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 33554695, ; uint32_t type_token_id (0x2000107)
		i32 18; uint32_t java_map_index (0x12)
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 33554696, ; uint32_t type_token_id (0x2000108)
		i32 52; uint32_t java_map_index (0x34)
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 33554697, ; uint32_t type_token_id (0x2000109)
		i32 51; uint32_t java_map_index (0x33)
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 33554698, ; uint32_t type_token_id (0x200010a)
		i32 66; uint32_t java_map_index (0x42)
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 33554700, ; uint32_t type_token_id (0x200010c)
		i32 80; uint32_t java_map_index (0x50)
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 33554701, ; uint32_t type_token_id (0x200010d)
		i32 74; uint32_t java_map_index (0x4a)
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 33554702, ; uint32_t type_token_id (0x200010e)
		i32 49; uint32_t java_map_index (0x31)
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 33554703, ; uint32_t type_token_id (0x200010f)
		i32 54; uint32_t java_map_index (0x36)
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 33554704, ; uint32_t type_token_id (0x2000110)
		i32 87; uint32_t java_map_index (0x57)
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 33554705, ; uint32_t type_token_id (0x2000111)
		i32 0; uint32_t java_map_index (0x0)
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 33554707, ; uint32_t type_token_id (0x2000113)
		i32 47; uint32_t java_map_index (0x2f)
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 33554708, ; uint32_t type_token_id (0x2000114)
		i32 58; uint32_t java_map_index (0x3a)
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 33554709, ; uint32_t type_token_id (0x2000115)
		i32 86; uint32_t java_map_index (0x56)
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 33554710, ; uint32_t type_token_id (0x2000116)
		i32 53; uint32_t java_map_index (0x35)
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 33554724, ; uint32_t type_token_id (0x2000124)
		i32 70; uint32_t java_map_index (0x46)
	} ; 103
], align 4

@module1_managed_to_java_duplicates = internal dso_local constant [36 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554519, ; uint32_t type_token_id (0x2000057)
		i32 26; uint32_t java_map_index (0x1a)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554521, ; uint32_t type_token_id (0x2000059)
		i32 32; uint32_t java_map_index (0x20)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554524, ; uint32_t type_token_id (0x200005c)
		i32 29; uint32_t java_map_index (0x1d)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554526, ; uint32_t type_token_id (0x200005e)
		i32 2; uint32_t java_map_index (0x2)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554528, ; uint32_t type_token_id (0x2000060)
		i32 88; uint32_t java_map_index (0x58)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554530, ; uint32_t type_token_id (0x2000062)
		i32 45; uint32_t java_map_index (0x2d)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554532, ; uint32_t type_token_id (0x2000064)
		i32 34; uint32_t java_map_index (0x22)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554534, ; uint32_t type_token_id (0x2000066)
		i32 90; uint32_t java_map_index (0x5a)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554536, ; uint32_t type_token_id (0x2000068)
		i32 91; uint32_t java_map_index (0x5b)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554540, ; uint32_t type_token_id (0x200006c)
		i32 102; uint32_t java_map_index (0x66)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554543, ; uint32_t type_token_id (0x200006f)
		i32 75; uint32_t java_map_index (0x4b)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554561, ; uint32_t type_token_id (0x2000081)
		i32 23; uint32_t java_map_index (0x17)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554563, ; uint32_t type_token_id (0x2000083)
		i32 69; uint32_t java_map_index (0x45)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554565, ; uint32_t type_token_id (0x2000085)
		i32 16; uint32_t java_map_index (0x10)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554569, ; uint32_t type_token_id (0x2000089)
		i32 19; uint32_t java_map_index (0x13)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554594, ; uint32_t type_token_id (0x20000a2)
		i32 104; uint32_t java_map_index (0x68)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554600, ; uint32_t type_token_id (0x20000a8)
		i32 39; uint32_t java_map_index (0x27)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554605, ; uint32_t type_token_id (0x20000ad)
		i32 59; uint32_t java_map_index (0x3b)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554609, ; uint32_t type_token_id (0x20000b1)
		i32 5; uint32_t java_map_index (0x5)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554630, ; uint32_t type_token_id (0x20000c6)
		i32 62; uint32_t java_map_index (0x3e)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554633, ; uint32_t type_token_id (0x20000c9)
		i32 98; uint32_t java_map_index (0x62)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554635, ; uint32_t type_token_id (0x20000cb)
		i32 9; uint32_t java_map_index (0x9)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554638, ; uint32_t type_token_id (0x20000ce)
		i32 4; uint32_t java_map_index (0x4)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554640, ; uint32_t type_token_id (0x20000d0)
		i32 46; uint32_t java_map_index (0x2e)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554644, ; uint32_t type_token_id (0x20000d4)
		i32 60; uint32_t java_map_index (0x3c)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554646, ; uint32_t type_token_id (0x20000d6)
		i32 78; uint32_t java_map_index (0x4e)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554648, ; uint32_t type_token_id (0x20000d8)
		i32 40; uint32_t java_map_index (0x28)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554651, ; uint32_t type_token_id (0x20000db)
		i32 15; uint32_t java_map_index (0xf)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554657, ; uint32_t type_token_id (0x20000e1)
		i32 24; uint32_t java_map_index (0x18)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554663, ; uint32_t type_token_id (0x20000e7)
		i32 31; uint32_t java_map_index (0x1f)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554667, ; uint32_t type_token_id (0x20000eb)
		i32 14; uint32_t java_map_index (0xe)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554671, ; uint32_t type_token_id (0x20000ef)
		i32 97; uint32_t java_map_index (0x61)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 89; uint32_t java_map_index (0x59)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554683, ; uint32_t type_token_id (0x20000fb)
		i32 33; uint32_t java_map_index (0x21)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554694, ; uint32_t type_token_id (0x2000106)
		i32 43; uint32_t java_map_index (0x2b)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554699, ; uint32_t type_token_id (0x200010b)
		i32 66; uint32_t java_map_index (0x42)
	} ; 35
], align 4

; Java to managed map
@map_java = dso_local local_unnamed_addr constant [105 x %struct.TypeMapJava] [
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554705, ; uint32_t type_token_id (0x2000111)
		i32 99; uint32_t java_name_index (0x63)
	}, ; 0
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554547, ; uint32_t type_token_id (0x2000073)
		i32 19; uint32_t java_name_index (0x13)
	}, ; 1
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554525, ; uint32_t type_token_id (0x200005d)
		i32 5; uint32_t java_name_index (0x5)
	}, ; 2
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554685, ; uint32_t type_token_id (0x20000fd)
		i32 82; uint32_t java_name_index (0x52)
	}, ; 3
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 47; uint32_t java_name_index (0x2f)
	}, ; 4
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554608, ; uint32_t type_token_id (0x20000b0)
		i32 38; uint32_t java_name_index (0x26)
	}, ; 5
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554649, ; uint32_t type_token_id (0x20000d9)
		i32 54; uint32_t java_name_index (0x36)
	}, ; 6
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554665, ; uint32_t type_token_id (0x20000e9)
		i32 66; uint32_t java_name_index (0x42)
	}, ; 7
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554607, ; uint32_t type_token_id (0x20000af)
		i32 37; uint32_t java_name_index (0x25)
	}, ; 8
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 45; uint32_t java_name_index (0x2d)
	}, ; 9
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554653, ; uint32_t type_token_id (0x20000dd)
		i32 57; uint32_t java_name_index (0x39)
	}, ; 10
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554544, ; uint32_t type_token_id (0x2000070)
		i32 16; uint32_t java_name_index (0x10)
	}, ; 11
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554669, ; uint32_t type_token_id (0x20000ed)
		i32 69; uint32_t java_name_index (0x45)
	}, ; 12
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554654, ; uint32_t type_token_id (0x20000de)
		i32 58; uint32_t java_name_index (0x3a)
	}, ; 13
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 67; uint32_t java_name_index (0x43)
	}, ; 14
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554650, ; uint32_t type_token_id (0x20000da)
		i32 55; uint32_t java_name_index (0x37)
	}, ; 15
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 28; uint32_t java_name_index (0x1c)
	}, ; 16
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554642, ; uint32_t type_token_id (0x20000d2)
		i32 50; uint32_t java_name_index (0x32)
	}, ; 17
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554695, ; uint32_t type_token_id (0x2000107)
		i32 90; uint32_t java_name_index (0x5a)
	}, ; 18
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554568, ; uint32_t type_token_id (0x2000088)
		i32 31; uint32_t java_name_index (0x1f)
	}, ; 19
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554545, ; uint32_t type_token_id (0x2000071)
		i32 17; uint32_t java_name_index (0x11)
	}, ; 20
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 71; uint32_t java_name_index (0x47)
	}, ; 21
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554652, ; uint32_t type_token_id (0x20000dc)
		i32 56; uint32_t java_name_index (0x38)
	}, ; 22
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 26; uint32_t java_name_index (0x1a)
	}, ; 23
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554656, ; uint32_t type_token_id (0x20000e0)
		i32 60; uint32_t java_name_index (0x3c)
	}, ; 24
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554626, ; uint32_t type_token_id (0x20000c2)
		i32 40; uint32_t java_name_index (0x28)
	}, ; 25
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554518, ; uint32_t type_token_id (0x2000056)
		i32 1; uint32_t java_name_index (0x1)
	}, ; 26
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554679, ; uint32_t type_token_id (0x20000f7)
		i32 77; uint32_t java_name_index (0x4d)
	}, ; 27
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554541, ; uint32_t type_token_id (0x200006d)
		i32 14; uint32_t java_name_index (0xe)
	}, ; 28
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554523, ; uint32_t type_token_id (0x200005b)
		i32 4; uint32_t java_name_index (0x4)
	}, ; 29
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554684, ; uint32_t type_token_id (0x20000fc)
		i32 81; uint32_t java_name_index (0x51)
	}, ; 30
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554662, ; uint32_t type_token_id (0x20000e6)
		i32 65; uint32_t java_name_index (0x41)
	}, ; 31
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554520, ; uint32_t type_token_id (0x2000058)
		i32 2; uint32_t java_name_index (0x2)
	}, ; 32
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554682, ; uint32_t type_token_id (0x20000fa)
		i32 80; uint32_t java_name_index (0x50)
	}, ; 33
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 8; uint32_t java_name_index (0x8)
	}, ; 34
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554566, ; uint32_t type_token_id (0x2000086)
		i32 29; uint32_t java_name_index (0x1d)
	}, ; 35
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554546, ; uint32_t type_token_id (0x2000072)
		i32 18; uint32_t java_name_index (0x12)
	}, ; 36
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 68; uint32_t java_name_index (0x44)
	}, ; 37
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554678, ; uint32_t type_token_id (0x20000f6)
		i32 76; uint32_t java_name_index (0x4c)
	}, ; 38
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554595, ; uint32_t type_token_id (0x20000a3)
		i32 34; uint32_t java_name_index (0x22)
	}, ; 39
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554647, ; uint32_t type_token_id (0x20000d7)
		i32 53; uint32_t java_name_index (0x35)
	}, ; 40
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554689, ; uint32_t type_token_id (0x2000101)
		i32 85; uint32_t java_name_index (0x55)
	}, ; 41
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554631, ; uint32_t type_token_id (0x20000c7)
		i32 43; uint32_t java_name_index (0x2b)
	}, ; 42
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 89; uint32_t java_name_index (0x59)
	}, ; 43
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554676, ; uint32_t type_token_id (0x20000f4)
		i32 74; uint32_t java_name_index (0x4a)
	}, ; 44
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 7; uint32_t java_name_index (0x7)
	}, ; 45
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 48; uint32_t java_name_index (0x30)
	}, ; 46
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554707, ; uint32_t type_token_id (0x2000113)
		i32 100; uint32_t java_name_index (0x64)
	}, ; 47
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554661, ; uint32_t type_token_id (0x20000e5)
		i32 64; uint32_t java_name_index (0x40)
	}, ; 48
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554702, ; uint32_t type_token_id (0x200010e)
		i32 96; uint32_t java_name_index (0x60)
	}, ; 49
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554553, ; uint32_t type_token_id (0x2000079)
		i32 23; uint32_t java_name_index (0x17)
	}, ; 50
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554697, ; uint32_t type_token_id (0x2000109)
		i32 92; uint32_t java_name_index (0x5c)
	}, ; 51
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554696, ; uint32_t type_token_id (0x2000108)
		i32 91; uint32_t java_name_index (0x5b)
	}, ; 52
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554710, ; uint32_t type_token_id (0x2000116)
		i32 103; uint32_t java_name_index (0x67)
	}, ; 53
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554703, ; uint32_t type_token_id (0x200010f)
		i32 97; uint32_t java_name_index (0x61)
	}, ; 54
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554636, ; uint32_t type_token_id (0x20000cc)
		i32 46; uint32_t java_name_index (0x2e)
	}, ; 55
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554548, ; uint32_t type_token_id (0x2000074)
		i32 20; uint32_t java_name_index (0x14)
	}, ; 56
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554538, ; uint32_t type_token_id (0x200006a)
		i32 12; uint32_t java_name_index (0xc)
	}, ; 57
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554708, ; uint32_t type_token_id (0x2000114)
		i32 101; uint32_t java_name_index (0x65)
	}, ; 58
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554604, ; uint32_t type_token_id (0x20000ac)
		i32 35; uint32_t java_name_index (0x23)
	}, ; 59
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554643, ; uint32_t type_token_id (0x20000d3)
		i32 51; uint32_t java_name_index (0x33)
	}, ; 60
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554567, ; uint32_t type_token_id (0x2000087)
		i32 30; uint32_t java_name_index (0x1e)
	}, ; 61
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554629, ; uint32_t type_token_id (0x20000c5)
		i32 42; uint32_t java_name_index (0x2a)
	}, ; 62
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554691, ; uint32_t type_token_id (0x2000103)
		i32 87; uint32_t java_name_index (0x57)
	}, ; 63
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554549, ; uint32_t type_token_id (0x2000075)
		i32 21; uint32_t java_name_index (0x15)
	}, ; 64
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554690, ; uint32_t type_token_id (0x2000102)
		i32 86; uint32_t java_name_index (0x56)
	}, ; 65
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554698, ; uint32_t type_token_id (0x200010a)
		i32 93; uint32_t java_name_index (0x5d)
	}, ; 66
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554692, ; uint32_t type_token_id (0x2000104)
		i32 88; uint32_t java_name_index (0x58)
	}, ; 67
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554659, ; uint32_t type_token_id (0x20000e3)
		i32 62; uint32_t java_name_index (0x3e)
	}, ; 68
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 27; uint32_t java_name_index (0x1b)
	}, ; 69
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554724, ; uint32_t type_token_id (0x2000124)
		i32 104; uint32_t java_name_index (0x68)
	}, ; 70
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554627, ; uint32_t type_token_id (0x20000c3)
		i32 41; uint32_t java_name_index (0x29)
	}, ; 71
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554522, ; uint32_t type_token_id (0x200005a)
		i32 3; uint32_t java_name_index (0x3)
	}, ; 72
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 72; uint32_t java_name_index (0x48)
	}, ; 73
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554701, ; uint32_t type_token_id (0x200010d)
		i32 95; uint32_t java_name_index (0x5f)
	}, ; 74
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 15; uint32_t java_name_index (0xf)
	}, ; 75
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554660, ; uint32_t type_token_id (0x20000e4)
		i32 63; uint32_t java_name_index (0x3f)
	}, ; 76
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554550, ; uint32_t type_token_id (0x2000076)
		i32 22; uint32_t java_name_index (0x16)
	}, ; 77
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554645, ; uint32_t type_token_id (0x20000d5)
		i32 52; uint32_t java_name_index (0x34)
	}, ; 78
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554537, ; uint32_t type_token_id (0x2000069)
		i32 11; uint32_t java_name_index (0xb)
	}, ; 79
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554700, ; uint32_t type_token_id (0x200010c)
		i32 94; uint32_t java_name_index (0x5e)
	}, ; 80
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554680, ; uint32_t type_token_id (0x20000f8)
		i32 78; uint32_t java_name_index (0x4e)
	}, ; 81
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554620, ; uint32_t type_token_id (0x20000bc)
		i32 39; uint32_t java_name_index (0x27)
	}, ; 82
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554439, ; uint32_t type_token_id (0x2000007)
		i32 0; uint32_t java_name_index (0x0)
	}, ; 83
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554677, ; uint32_t type_token_id (0x20000f5)
		i32 75; uint32_t java_name_index (0x4b)
	}, ; 84
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554687, ; uint32_t type_token_id (0x20000ff)
		i32 84; uint32_t java_name_index (0x54)
	}, ; 85
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554709, ; uint32_t type_token_id (0x2000115)
		i32 102; uint32_t java_name_index (0x66)
	}, ; 86
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554704, ; uint32_t type_token_id (0x2000110)
		i32 98; uint32_t java_name_index (0x62)
	}, ; 87
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 6; uint32_t java_name_index (0x6)
	}, ; 88
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554674, ; uint32_t type_token_id (0x20000f2)
		i32 73; uint32_t java_name_index (0x49)
	}, ; 89
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 9; uint32_t java_name_index (0x9)
	}, ; 90
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 10; uint32_t java_name_index (0xa)
	}, ; 91
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554658, ; uint32_t type_token_id (0x20000e2)
		i32 61; uint32_t java_name_index (0x3d)
	}, ; 92
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554559, ; uint32_t type_token_id (0x200007f)
		i32 25; uint32_t java_name_index (0x19)
	}, ; 93
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554554, ; uint32_t type_token_id (0x200007a)
		i32 24; uint32_t java_name_index (0x18)
	}, ; 94
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554606, ; uint32_t type_token_id (0x20000ae)
		i32 36; uint32_t java_name_index (0x24)
	}, ; 95
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554591, ; uint32_t type_token_id (0x200009f)
		i32 32; uint32_t java_name_index (0x20)
	}, ; 96
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554670, ; uint32_t type_token_id (0x20000ee)
		i32 70; uint32_t java_name_index (0x46)
	}, ; 97
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 44; uint32_t java_name_index (0x2c)
	}, ; 98
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554681, ; uint32_t type_token_id (0x20000f9)
		i32 79; uint32_t java_name_index (0x4f)
	}, ; 99
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554641, ; uint32_t type_token_id (0x20000d1)
		i32 49; uint32_t java_name_index (0x31)
	}, ; 100
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554655, ; uint32_t type_token_id (0x20000df)
		i32 59; uint32_t java_name_index (0x3b)
	}, ; 101
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554539, ; uint32_t type_token_id (0x200006b)
		i32 13; uint32_t java_name_index (0xd)
	}, ; 102
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554686, ; uint32_t type_token_id (0x20000fe)
		i32 83; uint32_t java_name_index (0x53)
	}, ; 103
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554593, ; uint32_t type_token_id (0x20000a1)
		i32 33; uint32_t java_name_index (0x21)
	} ; 104
], align 4

; Java type names
@java_type_names = dso_local local_unnamed_addr constant [105 x ptr] [
	ptr @.str.0, ; 0
	ptr @.str.1, ; 1
	ptr @.str.2, ; 2
	ptr @.str.3, ; 3
	ptr @.str.4, ; 4
	ptr @.str.5, ; 5
	ptr @.str.6, ; 6
	ptr @.str.7, ; 7
	ptr @.str.8, ; 8
	ptr @.str.9, ; 9
	ptr @.str.10, ; 10
	ptr @.str.11, ; 11
	ptr @.str.12, ; 12
	ptr @.str.13, ; 13
	ptr @.str.14, ; 14
	ptr @.str.15, ; 15
	ptr @.str.16, ; 16
	ptr @.str.17, ; 17
	ptr @.str.18, ; 18
	ptr @.str.19, ; 19
	ptr @.str.20, ; 20
	ptr @.str.21, ; 21
	ptr @.str.22, ; 22
	ptr @.str.23, ; 23
	ptr @.str.24, ; 24
	ptr @.str.25, ; 25
	ptr @.str.26, ; 26
	ptr @.str.27, ; 27
	ptr @.str.28, ; 28
	ptr @.str.29, ; 29
	ptr @.str.30, ; 30
	ptr @.str.31, ; 31
	ptr @.str.32, ; 32
	ptr @.str.33, ; 33
	ptr @.str.34, ; 34
	ptr @.str.35, ; 35
	ptr @.str.36, ; 36
	ptr @.str.37, ; 37
	ptr @.str.38, ; 38
	ptr @.str.39, ; 39
	ptr @.str.40, ; 40
	ptr @.str.41, ; 41
	ptr @.str.42, ; 42
	ptr @.str.43, ; 43
	ptr @.str.44, ; 44
	ptr @.str.45, ; 45
	ptr @.str.46, ; 46
	ptr @.str.47, ; 47
	ptr @.str.48, ; 48
	ptr @.str.49, ; 49
	ptr @.str.50, ; 50
	ptr @.str.51, ; 51
	ptr @.str.52, ; 52
	ptr @.str.53, ; 53
	ptr @.str.54, ; 54
	ptr @.str.55, ; 55
	ptr @.str.56, ; 56
	ptr @.str.57, ; 57
	ptr @.str.58, ; 58
	ptr @.str.59, ; 59
	ptr @.str.60, ; 60
	ptr @.str.61, ; 61
	ptr @.str.62, ; 62
	ptr @.str.63, ; 63
	ptr @.str.64, ; 64
	ptr @.str.65, ; 65
	ptr @.str.66, ; 66
	ptr @.str.67, ; 67
	ptr @.str.68, ; 68
	ptr @.str.69, ; 69
	ptr @.str.70, ; 70
	ptr @.str.71, ; 71
	ptr @.str.72, ; 72
	ptr @.str.73, ; 73
	ptr @.str.74, ; 74
	ptr @.str.75, ; 75
	ptr @.str.76, ; 76
	ptr @.str.77, ; 77
	ptr @.str.78, ; 78
	ptr @.str.79, ; 79
	ptr @.str.80, ; 80
	ptr @.str.81, ; 81
	ptr @.str.82, ; 82
	ptr @.str.83, ; 83
	ptr @.str.84, ; 84
	ptr @.str.85, ; 85
	ptr @.str.86, ; 86
	ptr @.str.87, ; 87
	ptr @.str.88, ; 88
	ptr @.str.89, ; 89
	ptr @.str.90, ; 90
	ptr @.str.91, ; 91
	ptr @.str.92, ; 92
	ptr @.str.93, ; 93
	ptr @.str.94, ; 94
	ptr @.str.95, ; 95
	ptr @.str.96, ; 96
	ptr @.str.97, ; 97
	ptr @.str.98, ; 98
	ptr @.str.99, ; 99
	ptr @.str.100, ; 100
	ptr @.str.101, ; 101
	ptr @.str.102, ; 102
	ptr @.str.103, ; 103
	ptr @.str.104 ; 104
], align 8

; Strings
@.str.0 = private unnamed_addr constant [35 x i8] c"crc649bbba407d2477f6e/MainActivity\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"javax/security/cert/Certificate\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"javax/security/cert/X509Certificate\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"javax/security/auth/Subject\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"javax/net/SocketFactory\00", align 1
@.str.5 = private unnamed_addr constant [33 x i8] c"javax/net/ssl/HttpsURLConnection\00", align 1
@.str.6 = private unnamed_addr constant [31 x i8] c"javax/net/ssl/HostnameVerifier\00", align 1
@.str.7 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/KeyManager\00", align 1
@.str.8 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/SSLSession\00", align 1
@.str.9 = private unnamed_addr constant [32 x i8] c"javax/net/ssl/SSLSessionContext\00", align 1
@.str.10 = private unnamed_addr constant [27 x i8] c"javax/net/ssl/TrustManager\00", align 1
@.str.11 = private unnamed_addr constant [32 x i8] c"javax/net/ssl/KeyManagerFactory\00", align 1
@.str.12 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/SSLContext\00", align 1
@.str.13 = private unnamed_addr constant [31 x i8] c"javax/net/ssl/SSLSocketFactory\00", align 1
@.str.14 = private unnamed_addr constant [34 x i8] c"javax/net/ssl/TrustManagerFactory\00", align 1
@.str.15 = private unnamed_addr constant [26 x i8] c"android/util/AttributeSet\00", align 1
@.str.16 = private unnamed_addr constant [22 x i8] c"android/os/BaseBundle\00", align 1
@.str.17 = private unnamed_addr constant [17 x i8] c"android/os/Build\00", align 1
@.str.18 = private unnamed_addr constant [25 x i8] c"android/os/Build$VERSION\00", align 1
@.str.19 = private unnamed_addr constant [18 x i8] c"android/os/Bundle\00", align 1
@.str.20 = private unnamed_addr constant [19 x i8] c"android/os/Handler\00", align 1
@.str.21 = private unnamed_addr constant [18 x i8] c"android/os/Looper\00", align 1
@.str.22 = private unnamed_addr constant [19 x i8] c"android/os/Process\00", align 1
@.str.23 = private unnamed_addr constant [21 x i8] c"android/app/Activity\00", align 1
@.str.24 = private unnamed_addr constant [24 x i8] c"android/app/Application\00", align 1
@.str.25 = private unnamed_addr constant [33 x i8] c"android/view/ContextThemeWrapper\00", align 1
@.str.26 = private unnamed_addr constant [36 x i8] c"android/view/SurfaceHolder$Callback\00", align 1
@.str.27 = private unnamed_addr constant [37 x i8] c"android/view/SurfaceHolder$Callback2\00", align 1
@.str.28 = private unnamed_addr constant [27 x i8] c"android/view/SurfaceHolder\00", align 1
@.str.29 = private unnamed_addr constant [21 x i8] c"android/view/Surface\00", align 1
@.str.30 = private unnamed_addr constant [18 x i8] c"android/view/View\00", align 1
@.str.31 = private unnamed_addr constant [20 x i8] c"android/view/Window\00", align 1
@.str.32 = private unnamed_addr constant [40 x i8] c"mono/android/runtime/InputStreamAdapter\00", align 1
@.str.33 = private unnamed_addr constant [21 x i8] c"java/util/Collection\00", align 1
@.str.34 = private unnamed_addr constant [18 x i8] c"java/util/HashMap\00", align 1
@.str.35 = private unnamed_addr constant [20 x i8] c"java/util/ArrayList\00", align 1
@.str.36 = private unnamed_addr constant [32 x i8] c"mono/android/runtime/JavaObject\00", align 1
@.str.37 = private unnamed_addr constant [35 x i8] c"android/runtime/JavaProxyThrowable\00", align 1
@.str.38 = private unnamed_addr constant [18 x i8] c"java/util/HashSet\00", align 1
@.str.39 = private unnamed_addr constant [41 x i8] c"mono/android/runtime/OutputStreamAdapter\00", align 1
@.str.40 = private unnamed_addr constant [24 x i8] c"android/graphics/Canvas\00", align 1
@.str.41 = private unnamed_addr constant [22 x i8] c"android/graphics/Rect\00", align 1
@.str.42 = private unnamed_addr constant [24 x i8] c"android/content/Context\00", align 1
@.str.43 = private unnamed_addr constant [31 x i8] c"android/content/ContextWrapper\00", align 1
@.str.44 = private unnamed_addr constant [22 x i8] c"java/util/Enumeration\00", align 1
@.str.45 = private unnamed_addr constant [19 x i8] c"java/util/Iterator\00", align 1
@.str.46 = private unnamed_addr constant [17 x i8] c"java/util/Random\00", align 1
@.str.47 = private unnamed_addr constant [28 x i8] c"java/util/function/Consumer\00", align 1
@.str.48 = private unnamed_addr constant [24 x i8] c"java/security/Principal\00", align 1
@.str.49 = private unnamed_addr constant [23 x i8] c"java/security/KeyStore\00", align 1
@.str.50 = private unnamed_addr constant [27 x i8] c"java/security/SecureRandom\00", align 1
@.str.51 = private unnamed_addr constant [31 x i8] c"java/security/cert/Certificate\00", align 1
@.str.52 = private unnamed_addr constant [30 x i8] c"java/nio/channels/FileChannel\00", align 1
@.str.53 = private unnamed_addr constant [51 x i8] c"java/nio/channels/spi/AbstractInterruptibleChannel\00", align 1
@.str.54 = private unnamed_addr constant [26 x i8] c"java/net/ConnectException\00", align 1
@.str.55 = private unnamed_addr constant [27 x i8] c"java/net/HttpURLConnection\00", align 1
@.str.56 = private unnamed_addr constant [27 x i8] c"java/net/InetSocketAddress\00", align 1
@.str.57 = private unnamed_addr constant [27 x i8] c"java/net/ProtocolException\00", align 1
@.str.58 = private unnamed_addr constant [15 x i8] c"java/net/Proxy\00", align 1
@.str.59 = private unnamed_addr constant [20 x i8] c"java/net/Proxy$Type\00", align 1
@.str.60 = private unnamed_addr constant [23 x i8] c"java/net/SocketAddress\00", align 1
@.str.61 = private unnamed_addr constant [25 x i8] c"java/net/SocketException\00", align 1
@.str.62 = private unnamed_addr constant [32 x i8] c"java/net/SocketTimeoutException\00", align 1
@.str.63 = private unnamed_addr constant [33 x i8] c"java/net/UnknownServiceException\00", align 1
@.str.64 = private unnamed_addr constant [13 x i8] c"java/net/URL\00", align 1
@.str.65 = private unnamed_addr constant [23 x i8] c"java/net/URLConnection\00", align 1
@.str.66 = private unnamed_addr constant [24 x i8] c"java/io/FileInputStream\00", align 1
@.str.67 = private unnamed_addr constant [20 x i8] c"java/io/InputStream\00", align 1
@.str.68 = private unnamed_addr constant [31 x i8] c"java/io/InterruptedIOException\00", align 1
@.str.69 = private unnamed_addr constant [20 x i8] c"java/io/IOException\00", align 1
@.str.70 = private unnamed_addr constant [21 x i8] c"java/io/OutputStream\00", align 1
@.str.71 = private unnamed_addr constant [20 x i8] c"java/io/PrintWriter\00", align 1
@.str.72 = private unnamed_addr constant [21 x i8] c"java/io/StringWriter\00", align 1
@.str.73 = private unnamed_addr constant [15 x i8] c"java/io/Writer\00", align 1
@.str.74 = private unnamed_addr constant [18 x i8] c"java/lang/Boolean\00", align 1
@.str.75 = private unnamed_addr constant [15 x i8] c"java/lang/Byte\00", align 1
@.str.76 = private unnamed_addr constant [20 x i8] c"java/lang/Character\00", align 1
@.str.77 = private unnamed_addr constant [16 x i8] c"java/lang/Class\00", align 1
@.str.78 = private unnamed_addr constant [29 x i8] c"java/lang/ClassCastException\00", align 1
@.str.79 = private unnamed_addr constant [17 x i8] c"java/lang/Double\00", align 1
@.str.80 = private unnamed_addr constant [15 x i8] c"java/lang/Enum\00", align 1
@.str.81 = private unnamed_addr constant [16 x i8] c"java/lang/Error\00", align 1
@.str.82 = private unnamed_addr constant [20 x i8] c"java/lang/Exception\00", align 1
@.str.83 = private unnamed_addr constant [16 x i8] c"java/lang/Float\00", align 1
@.str.84 = private unnamed_addr constant [23 x i8] c"java/lang/CharSequence\00", align 1
@.str.85 = private unnamed_addr constant [35 x i8] c"java/lang/IllegalArgumentException\00", align 1
@.str.86 = private unnamed_addr constant [32 x i8] c"java/lang/IllegalStateException\00", align 1
@.str.87 = private unnamed_addr constant [36 x i8] c"java/lang/IndexOutOfBoundsException\00", align 1
@.str.88 = private unnamed_addr constant [18 x i8] c"java/lang/Integer\00", align 1
@.str.89 = private unnamed_addr constant [19 x i8] c"java/lang/Runnable\00", align 1
@.str.90 = private unnamed_addr constant [17 x i8] c"java/lang/System\00", align 1
@.str.91 = private unnamed_addr constant [15 x i8] c"java/lang/Long\00", align 1
@.str.92 = private unnamed_addr constant [31 x i8] c"java/lang/NullPointerException\00", align 1
@.str.93 = private unnamed_addr constant [17 x i8] c"java/lang/Number\00", align 1
@.str.94 = private unnamed_addr constant [17 x i8] c"java/lang/Object\00", align 1
@.str.95 = private unnamed_addr constant [27 x i8] c"java/lang/RuntimeException\00", align 1
@.str.96 = private unnamed_addr constant [28 x i8] c"java/lang/SecurityException\00", align 1
@.str.97 = private unnamed_addr constant [16 x i8] c"java/lang/Short\00", align 1
@.str.98 = private unnamed_addr constant [28 x i8] c"java/lang/StackTraceElement\00", align 1
@.str.99 = private unnamed_addr constant [17 x i8] c"java/lang/String\00", align 1
@.str.100 = private unnamed_addr constant [17 x i8] c"java/lang/Thread\00", align 1
@.str.101 = private unnamed_addr constant [35 x i8] c"mono/java/lang/RunnableImplementor\00", align 1
@.str.102 = private unnamed_addr constant [20 x i8] c"java/lang/Throwable\00", align 1
@.str.103 = private unnamed_addr constant [40 x i8] c"java/lang/UnsupportedOperationException\00", align 1
@.str.104 = private unnamed_addr constant [25 x i8] c"mono/android/TypeManager\00", align 1

;TypeMapModule
@.TypeMapModule.0_assembly_name = private unnamed_addr constant [23 x i8] c"RAZR_PointCRep.Android\00", align 1
@.TypeMapModule.1_assembly_name = private unnamed_addr constant [13 x i8] c"Mono.Android\00", align 1

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
