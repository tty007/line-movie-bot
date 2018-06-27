class LinebotController < ApplicationController
    require 'line/bot'  # gem 'line-bot-api'

  # callbackアクションのCSRFトークン認証を無効
  protect_from_forgery :except => [:callback]

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def callback
    body = request.body.read

    #---sendメソッド用---
    #-------------------

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end

    events = client.parse_events_from(body)

    events.each { |event|
      case event
      when Line::Bot::Event::Message
        if Line::Bot::Event::Message == "あ"
        case event.type
        when Line::Bot::Event::MessageType::Text
            messages = [
                "ラブリーボーン(2009)/ドラマ",
                "her(2013)/SF,ラブストーリー",
                "インポッシブル(2012)/ドラマ",
                "インターステラー(2014)/SF",
                "ウォークラフト(2016)/ファンタジー",
                "グランド・イリュージョン(2013)/アクション",
                "オートマタ(2014)/SF",
                "ガーディアンズ・オブ・ギャラクシー(2014)/SF",
                "バタフライ・エフェクト(2004)/SF,スリラー",
                "バードマン あるいは (無知がもたらす予期せぬ奇跡)(2014)/ドラマ",
                "ルーム(2015)/ドラマ",
                "プレミアム・ラッシュ(2012)/アクション",
                "雨の日は会えない、晴れた日は君を想う(2015)/ドラマ",
                "沈黙-サイレンス-(2015)/ヒストリー,ドラマ",
                "スター・トレック(2009)/SF",
                "ガタカ(1997)/サスペンス",
                "ジュピター(2014)/SF",
                "ゴーン・ガール(2014)/サスペンス,スリラー",
                "インセプション(2010)/アクション",
                "ドント・ブリーズ(2016)/スリラー",
                "ドニー・ダーコ(2001)/ドラマ",
                "エクス・マキナ(2015)/SF",
                "ドクター・ストレンジ(2016)/アクション",
                "ザ・ファーム(1993)/サスペンス",
                "ライオン(2015)/ドラマ",
                "スリー・ビルボード(2017)/ドラマ,クライム",
                "ヴィジット(2015)/ホラー",
                "ゴースト・イン・ザ・シェル(2017)/SF",
                "最強のふたり(2011)/ドラマ",
                "メッセージ(2016)/SF",
                "(500)日のサマー(2009)/コメディ,ラブストーリー",
                "ザ・ギフト(2015)/サスペンス,スリラー",
                "チャッピー(2015)/SF",
                "フライト・ゲーム(2014)/ミステリー",
                "オデッセイ(2015)/SF",
                "ロスト・バケーション(2016)/ドラマ,スリラー",
                "シャッターアイランド(2009)/サスペンス",
                "ミニミニ大作戦(2003)/アクション,クライム",
                "モンスター上司(2011)/コメディ",
                "あと1センチの恋(2014)/ラブストーリー",
                "ターボキッド(2015)/アクション",
                "ウォールフラワー(2012)/ドラマ",
                "ブラック・パンサー(2018)/アクション,アドベンチャー",
                "ディストピア(2016)/ホラー,スリラー",
                "ゲット・アウト(2017)/ホラー,ミステリー",
                "キス&キル(2010)/コメディ",
                "ライフ(2017)/SF",
                "プロメテウス(2012)/SF",
                "トレインスポッティング(1996)/ドラマ",
                "エターナル・サンシャイン(2004)/ラブストーリー",
                "コン・ティキ(2012)/ドラマ",
                "ダンケルク(2017)/戦争,ヒストリー",
                "セルラー(2004)/サスペンス",
                "オールド・ボーイ(2013)/アクション,クライム",
                "ソウ(2004)/サスペンス,スリラー",
                "エミリー・ローズ(2005)/ホラー",
                "ライト・オフ(2016)/ホラー",
                "ものすごくうるさくて、ありえないほど近い(2011)/ドラマ",
                "ガーディアンズ・オブ・ギャラクシー(2014)/SF,アクション",
                "ブラック・スワン(2010)/スリラー",
                "ピエロがお前を嘲笑う(2014)/クライム",
                "誘拐の掟(2014)/クライム,アクション",
                "オッド・トーマス 死神と奇妙な救世主(2013)/ファンタジー",
                "キャビン(2012)/ホラー",
                "ラ・ラ・ランド(2016)/ラブストーリー,ミュージカル",
                "ザ・コール(2013)/アクション,スリラー",
                "パフューム ある人殺しの物語(2006)/サスペンス,ドラマ",
                "イフ・アイ・ステイ 愛が返る場所(2014)/ドラマ",
                "ブレードランナー2049(2017)/SF",
                "セッション(2014)/ドラマ,ミュージック",
                "キングコング：髑髏島の巨神(2017)/アドベンチャー",
                "ファンタスティック・ビーストと魔法使いの旅(2016)/ファンタジー",
                "ゼロ・グラビティ(2013)/SF",
                "マッド・マックス 怒りのデス・ロード(2015)/アクション",
                "ジュラシック・ワールド(2015)/パニック",
                "エスター(2009)/スリラー,サスペンス",
                "スリーデイズ(2010)/アクション",
                "ドント・ハングアップ(2016)/ホラー,スリラー",
                "リミットレス(2011)/ドラマ",
                "トールマン(2012)/ホラー,サスペンス",
                "50/50 フィフティ・フィフティ(2011)/ドラマ",
                "カリフォルニア・ダウン(2015)/パニック,ディザスター",
                "ブレード・ランナー(2007)/SF",
                "エクソシスト(2000)/ホラー",
                "崖っぷちの男(2011)/スリラー",
                "ペイン&ゲイン 史上最低の一攫千金(2013)/アクション",
                "華麗なるギャッツビー(2013)/ドラマ",
                "ベイビー・ドライバー(2017)/アクション",
                "マシニスト(2004)/ホラー",
                "パーフェクト・センス(2011)/アクション",
                "ジュノ(2007)/ドラマ",
                "イット・フォローズ(2014)/ホラー",
                "ダークスカイズ(2013)/ホラー",
                "サプライズ(2011)/ホラー",
                "アンノウン(2011)/サスペンス,アクション",
                "死霊館(2013)/ホラー",
                "ダ・ヴィンチ・コード(2006)/ミステリー",
                "きみに読む物語(2004)/ラブストーリー",
                "イントゥ・ザ・ブルー(2005)/アクション",
                "運命を分けたザイル(2003)/ドラマ",
                "ヒックとドラゴン(2010)/ファミリー",
                "スター・トレック イントゥ・ダークネス(2013)/SF"
            ]
            message = {
                type: 'text',
                text: messages.sample.to_s
              }
          client.reply_message(event['replyToken'], message)
        end
        end
      end
    }

    head :ok
  end

end
