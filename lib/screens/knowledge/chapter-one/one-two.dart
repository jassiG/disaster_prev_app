import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OneTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('1-2　地震')),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _MyText(txt: '地震は地下で起きる岩盤の「ずれ」により発生する現象です。\n', sz: 24, isthick: true),
              Divider(height: 10, color: Colors.black87,),
              _MyText(sz: 18, isthick: false, txt: 'では、なぜこのような現象が起き るのでしょうか。硬い物に何らかの力がかかり、それに耐えられなくなると、ひびが入ります。地 下でも同じように、岩盤に力がかかっており、それに耐えられなくなったときに地震が起こる（岩 盤がずれる）のです。\n'),
              _MyText(sz: 18, isthick: false, txt: 'では、どうして地下に力がかかっているのでしょうか。これは、「プレートテクトニクス」という説 で説明されます。\n'),
              _MyText(sz: 18, isthick: false, txt: '地球は、中心から、核（内核、外核）、マントル（下部マントル、上部マントル）、地殻という層構造に なっていると考えられています。このうち「地殻」と上部マントルの地殻に近いところは硬い板状の 岩盤となっており、これを「プレート」と呼びます。地球の表面は十数枚のプレートに覆われています。\n'),
              Image.asset('assets/images/one-two-1.png'),
              _MyText(txt: '\nプレートは、地球内部で対流しているマントルの上に乗っています。そのため、プレートはごく わずかですが、少しずつ動いています。そして、プレートどうしがぶつかったり、すれ違ったり、 片方のプレートがもう一方のプレートの下に沈み込んだりしています。この、プレートどうしがぶ つかっている付近では強い力が働きます。この力により地震が発生するのです。\n', sz: 18, isthick: false),
              Image.asset('assets/images/one-two-2.png'),
              _MyText(sz: 18, isthick: false, txt: '\n日本周辺では、海のプレートである太平洋プレート、フィリピン海プレートが、陸のプレート （北米プレートやユーラシアプレート）の方へ１年あたり数cm の速度で動いており、陸のプレー トの下に沈み込んでいます。このため、日本周辺では、複数のプレートによって複雑な力がかかっ ており、世界でも有数の地震多発地帯となっています。\n'),
              Image.asset('assets/images/one-two-3.png'),
              _MyText(sz: 18, isthick: false, txt: '\n日本周辺では、海のプレートが沈み込むときに陸のプレートを地下へ引きずり込んでいきます。 陸のプレートが引きずりに耐えられなくなり、跳ね上げられるように起こるのがプレート境界の地 震です。 プレート境界の地震の例としては、南海地震、東南海地震、「平成15年（2003年）十勝沖地震」、 「平成23年（2011年）東北地方太平洋沖地震」があります。\n'),
              _MyText(sz: 18, isthick: false, txt: 'プレートの内部に力が加わって発生する地震が、プレート内の地震です。プレート内の地震には、 沈み込むプレート内の地震と陸のプレートの浅いところで発生する地震（陸域の浅い地震）があります。\n'),
              _MyText(sz: 18, isthick: false, txt: '沈み込むプレート内の地震の例としては、昭和三陸地震、「平成5年（1993年）釧路沖地震」、 「平成6年（1994年）北海道東方沖地震」があります。\n'),
              _MyText(sz: 18, isthick: false, txt: 'また、陸域の浅い地震の例としては、 「平成7年（1995年）兵庫県南部地震」、「平成16年（2004年）新潟県中越地震」、 「平成20年（2008年）岩手・宮城内陸地震」、「平成28年（2016年）熊本地震」があります。\n'),
              _MyText(sz: 18, isthick: false, txt: '陸域の浅い地震は、プレート境界で発生する地震に比べると規模が小さい地震が多いですが、 人間の居住地域に近いところで発生するため、大きな被害を伴うことがあります。\n'),
              Image.asset('assets/images/one-two-4.png'),
              _MyText(sz: 24, isthick: true, txt: '\nマグニチュードと震度の違いは？'),
              Divider(height: 10, color: Colors.black87,),
              _MyText(sz: 18, isthick: false, txt: '「マグニチュード」は、地震そのものの大きさ（規模）を表すものさしです。一方「震度」は、ある大きさの地震が起きた時のわたしたちが生活している場所での揺れの強さのことを表します。\n'),
              _MyText(sz: 18, isthick: false, txt: 'マグニチュードは１増えると地震のエネルギーが３２倍になります。マグニチュード８の地震は、マグニチュード７の地震の３２個分のエネルギーを持っていることになります。\n'),
              _MyText(sz: 18, isthick: false, txt: '「震度」とは、地震が起きたときのわたしたちが生活している場所での揺れの大きさを表し、日本では気象庁が１０階級（０、１、２、３、４、５弱、５強、６弱、６強、７）に分けたものが使われています。地震による揺れが強くなると、震度は大きくなります。\n'),
              Image.asset('assets/images/one-two-5.png'),
              _MyText(sz: 30, isthick: false, txt: '\n'),
            ],
          ),
        ));
  }

  Widget _MyText(
      {required String txt, required int sz, required bool isthick}) {
    String text = txt;
    int size = sz;
    bool isThick = isthick;
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontWeight: isThick ? FontWeight.w800 : FontWeight.w500,
          fontSize: size * 1.0,
          color: Colors.black87,
        ),
      ),
    );
  }
}
