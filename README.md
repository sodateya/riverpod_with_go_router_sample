# riverpod_with_go_router_sample

## 準備
- [pubspec.yaml](https://github.com/sodateya/riverpod_with_go_router_sample/blob/main/pubspec.yaml)に各ライブラリを追加
```
dependencies:
  riverpod_annotation:
  flutter_riverpod:
  go_router:

dev_dependencies:
 riverpod_generator:
　　build_runner: 
```
## riverpod generatorファイルの作成方法 (foo.g.dartを生成)
- riverpod generatorの定義
  
    ##### 詳細はソースコード参照
  - NotifierProvider
    - [page_2_count_provider.dart](https://github.com/sodateya/riverpod_with_go_router_sample/blob/main/lib/presentation/page2/provider/page_2_count_provider.dart)
  - FamilyProvider
    - [page_3_count_provider.dart](https://github.com/sodateya/riverpod_with_go_router_sample/blob/main/lib/presentation/page3/provider/page_3_count_provider.dart)
  - FutureProvider
    - [page4_data_provider.dart](https://github.com/sodateya/riverpod_with_go_router_sample/blob/main/lib/presentation/page4/provider/page4_data_provider.dart)

- ファイルが作成できたらターミナルでコマンドを叩く
  ```
  dart run build_runner build --delete-conflicting-outputs
  ```

## go_routerファイルの作成方法 (router.dart)
- routerをriverpodのメソッドそして定義する
  - [router.dart参照](https://github.com/sodateya/riverpod_with_go_router_sample/blob/main/lib/router/provoder/router.dart)
- GoRouter()に含まれているパラメータについて
  ##### initialLocation　
      アプリ起動時に開かれるページのパス
  ##### redirect
      リダイレクト内の条件にマッチしたら該当のページに飛ばせられる
      ※複数条件入れられます
      ログイン状況やユーザのステータスに応じてリダイレクトするときに使うと良いかも
  ##### routes
      この中にGoRouter()を入れていく
      中に入れたGorouterの中にroutesを入れることができ、そうするとパスが繋がっていく
  <details>
    <summary>ソースコードでパスが繋がっている部分</summary>
    　https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/router/provoder/router.dart#L38-L63
  </details>

## go_routerを使った遷移方法
  <details>
  　　　　<summary>繋がったパスへの遷移（同じルート内での遷移）</summary>
     https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/router/provoder/router.dart#L48-L63
  　　　　　　https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/presentation/page2/page/page_2.dart#L43-L46
　　　</details>
  <details>
  　　　　<summary>namedを使って遷移</summary>
   　　　　　https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/router/provoder/router.dart#L64-L70
  　　　　　　https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/presentation/page3/page/page_3.dart#L53-L57
  </details>
  <details>
  　　　　<summary>値渡して遷移(pathParameters)</summary>
   　　　　 https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/router/provoder/router.dart#L44-L52
      https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/presentation/page1/page/page_1.dart#L30-L37
  </details>
  <details>
  　　　　<summary>値渡して遷移(extra)</summary>
     　　https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/router/provoder/router.dart#L71-L80
      https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/presentation/page4/page/page_4.dart#L72-L76
　　  </details>




## main.dart編集
### Riverpodの設定
<details>
  <summary>runApp内でProviderScopeでラップする</summary>
  
  [https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/main.dart#L6](https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/main.dart#L6)

</details>
<details>
  <summary>MaterialAppが含まれるWidgetをConsumerWidgetにする</summary>
  
  [https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/main.dart#L9](https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/main.dart#L9)

</details>

### go_routerの設定
<details>
  <summary>MaterialAppをMaterialApp.routerに変更</summary>
  
  [https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/main.dart#L14](https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/main.dart#L14)

</details>
<details>
  <summary>MaterialApp.routerのrouterConfigにrouterを割り当てる</summary>
  
  [https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/main.dart#L20](https://github.com/sodateya/riverpod_with_go_router_sample/blob/d95dcfd605711727930c2ee4a90b1da6476ae6c2/lib/main.dart#L20)


</details>


## サンプル画像
|page1|page2|page3|page4|page5|
|--|--|--|--|--|
|<img src="https://github.com/sodateya/riverpod_with_go_router_sample/assets/79615420/31ad2052-5050-4e3a-b232-d9cade71240c" width="300">|<img src="https://github.com/sodateya/riverpod_with_go_router_sample/assets/79615420/053da177-1f7d-442c-b023-6301a4c16d82" width="300">|<img src="https://github.com/sodateya/riverpod_with_go_router_sample/assets/79615420/82244e3d-5f7f-4497-bdff-5cd0615d2fd8" width="300">|<img src="https://github.com/sodateya/riverpod_with_go_router_sample/assets/79615420/97fab054-cb8a-4f86-8f06-f4fc1263b132" width="300">|<img src="https://github.com/sodateya/riverpod_with_go_router_sample/assets/79615420/c5928190-9330-4a39-a1f8-9222c1637197" width="300">|






