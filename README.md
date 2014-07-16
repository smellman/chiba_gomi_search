# 千葉市ごみ分類辞典検索サイト

これは千葉県千葉市のオープンデータ、[千葉市：ごみ分別事典（５０音順）](http://www.city.chiba.jp/kankyo/junkan/shushugyomu/gomibunbetujiten.html)のデータを元に検索サイトを作りました。

## Demo

http://smellman.github.io/chiba_gomi_search

## 加工したデータ

    ├── data
    │   ├── chiba_gomi_201402.csv (ごみ分類辞典のExcelファイルをコピペして作成したCSV)
    │   ├── chiba_gomi_201402.utf8.csv (上記のCSVをutf8に変換してヘッダ行を削除したCSV)


## 利用したもの

- [Bootstrap](http://getbootstrap.com/)
- [jQuery](http://jquery.com/)
- [Papa Parse - Powerful CSV parser for Javascript](http://papaparse.com/)
- [hail2u/jquery.table-filter](https://github.com/hail2u/jquery.table-filter)

Papa Parseはテストで使ったPythonのSimpleHTTPServerがContent-Rangeに対応していないため、アドホックなパッチを適応しています。
