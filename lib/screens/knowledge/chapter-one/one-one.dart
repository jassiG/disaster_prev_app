import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OneOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('1-1 水害')),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _MyText(txt: '平成29年7月九州北部豪雨\n', sz: 24, isthick: true),
              Divider(height: 10, color: Colors.black87,),
              _MyText(txt: '平成29年7月九州北部豪雨（へいせい29ねん7がつきゅうしゅうほくぶごうう）は、2017年（平成29年）7月5日から6日にかけて福岡県と大分県を中心とする九州北部で発生した集中豪雨[6]。 被害の規模は気象庁が豪雨について命名する基準（損壊家屋、浸水家屋の数）を下回ってはいたものの[7]、人的被害が大きいことから[8]、同年7月19日付で命名された[6]。\n', sz: 18, isthick: false),
              _MyText(txt: '河川の氾濫\n', sz: 24, isthick: true),
              Divider(height: 10, color: Colors.black87,),
              _MyText(txt: '福岡県朝倉市では、蜷城地区で桂川が氾濫し[23]。添田町で彦山川が氾濫した[23]。大分県日田市では大肥川の一部が溢れ、一部地区の孤立が生じた[24]。日田市では花月川も氾濫した[25]。\n', sz: 18, isthick: false),
              _MyText(txt: '被災地には大量の流木が見られ、河川に流れ込んだ総量はおよそ20万トン、36万立方メートルにのぼると推定されている[26]。土砂崩れでなぎ倒された杉などの木が川を流れ下り、川の流れをせき止めて氾濫させた。住宅地に押し寄せた流木によって、水流だけの場合よりも破壊力が増し、家屋に大きな被害をもたらした[27]。\n', sz: 18, isthick: false),
              _MyText(txt: '流木は直接的な破壊以外にも、間接的に水流の圧が増すことによる被害も生んだ。日田市では花月川を渡るJR久大線の橋が流されたが、流木が橋に引っ掛かり、水がせき止められたことで水量が増し、橋により大きな力がかかったことが原因とみられる[28]。\n', sz: 18, isthick: false),
              Image.asset('assets/images/one-one-1.png'),
              _MyText(txt: '\n土砂崩れ\n', sz: 24, isthick: true),
              Divider(height: 10, color: Colors.black87,),
              _MyText(txt: '大分県日田市の小野地区では6日10時半頃、大規模な土砂崩れが起きて土砂が民家に押し寄せ、1人が巻き込まれて死亡した。この土砂崩れで川がせき止められて土砂ダムができた[29]。\n', sz: 18, isthick: false),
              _MyText(txt: '真砂土と呼ばれる地質の山地は突然の豪雨に耐え切れず、各地で表層崩壊を起こした。表層崩壊によって杉の流木が川に流れ込み、ため池が決壊した[30][31]。スギなどの木が大量に生えている人工林は間伐して日当たりを改善するなどの手入れをしなければ木が成長せず深い根を張れないため、森林管理が十分でなかったのではとも指摘されている[32]。\n', sz: 18, isthick: false),
            ],
          ),
        )
    );
  }
  Widget _MyText({required String txt, required int sz, required bool isthick}) {
    String text = txt;
    int size = sz;
    bool isThick = isthick;
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontWeight: isThick ? FontWeight.w800 : FontWeight.w500,
          fontSize: size*1.0,
          color: Colors.black87,
        ),
      ),
    );
  }
}
