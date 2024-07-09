import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_with_go_router_sample/presentation/page1/page/page_1.dart';
import 'package:riverpod_with_go_router_sample/presentation/page2/page/page_2.dart';
import 'package:riverpod_with_go_router_sample/presentation/page2/provider/page_2_count_provider.dart';
import 'package:riverpod_with_go_router_sample/presentation/page3/page/page_3.dart';
import 'package:riverpod_with_go_router_sample/presentation/page4/model/human.dart';
import 'package:riverpod_with_go_router_sample/presentation/page4/page/page_4.dart';
import 'package:riverpod_with_go_router_sample/presentation/page5/page/page_5.dart';
import 'package:riverpod_with_go_router_sample/presentation/x_page/page/x_page.dart';

part 'router.g.dart';

@riverpod
class Router extends _$Router {
  @override
  GoRouter build() {
    return GoRouter(

        //アプリ起動時のパス
        initialLocation: '/page1',

        //リダイレクト内の条件にマッチしたら該当のページに飛ばせられる　※複数条件入れられます
        //ログイン状況やユーザのステータスに応じてリダイレクトするときに使うと良いかも
        redirect: (context, state) {
          //ここの場合はpage2でカウントアップしたときカウントが１０を超えたらpage3ではなくXpageに遷移させる
          final count = ref.read(page2CountProvider);
          if (count >= 10) {
            return '/x_page';
          }

          //通常時はnullでOK
          return null;
        },

        //routesの中にページを入れていく
        //top層のパスには'/'を先頭につける
        routes: [
          GoRoute(
            path: '/page1',
            builder: (context, state) => const Page1(),
          ),

          //引数を渡したい場合は
          //'ページパス:パラメータ１:パラメータ2'
          //のように値を渡すことができる(以下では'title'が該当部分)
          //builder部分は'state.pathParameters[パラメータ１]'のように割り当てることができる
          GoRoute(
              path: '/page2:title',
              builder: (context, state) => Page2(
                    title: state.pathParameters['title']!,
                  ),
              routes: [
                //page2の中のroutsに入れると
                //'page2:title/page3:countNum'
                //のようにつながったパスにできる
                GoRoute(
                  path: 'page3:countNum',
                  builder: (context, state) => Page3(
                    countNum: int.parse(state.pathParameters['countNum']!),
                  ),
                )
              ]),
          GoRoute(
            //nameを定義するとnamedPushで使える
            //(多分Analyticsを使用していたら定義しているだけでこのnameでログが残ると思う)
            name: 'page4',
            path: '/page4',
            builder: (context, state) => const Page4(),
          ),
          GoRoute(
            path: '/page5',
            builder: (context, state) {
              //pathParameterは文字列のみ対応しているため、もしモデルなどを引数に持たせたい場合は、extraを使用する。
              //またはモデルを分解して文字列にするか、、、
              //　※extraはpathに表示されないため注意する
              final human = state.extra;
              return Page5(human: human as Human);
            },
          ),
          //リダイレクトされた際のページ
          GoRoute(
            path: '/x_page',
            builder: (context, state) => const XPage(),
          ),
        ]);
  }
}
