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

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end

    events = client.parse_events_from(body)

    events.each { |event|
      case event
      when Line::Bot::Event::Message
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
                "フライト・ゲーム(2014)/ミステリー"
            ]
            message = {
                type: 'text',
                text: messages.sample.to_s
              }
          client.reply_message(event['replyToken'], message)
        end
      end
    }

    head :ok
  end
end
