//
//  DialogContent.swift
//  AlertManager
//
//  Created by Eddie on 2021/7/26.
//

import Foundation

enum DialogContent {
    case noBindingCar
    case MembershipTerms
    case update
    
    var content: String {
        switch self {
        case .update:
            return "資料已送出！客服將盡速為您更新車主資料"
        case .noBindingCar:
            return "您的會員帳號目前尚未綁定任何TOYOTA車輛，請前往新增愛車，以使用TOYOTA車主相關服務。"
        case .MembershipTerms:
            return """
                以下條款為TOYOTA總代理和泰汽車股份有限公司( 以下稱 " TOYOTA " )藉由本網站提供您服務的同時，您必須了解的相關事項。為保障您的權益及讓您合法使用網站上的服務，請於註冊成為會員前詳細閱讀本會員條款之內容。當您點選「我同意」鍵，即表示您可使用本網站所提供之網站服務，並視為您已同意並遵守本網站之會員規範及相關之法律規定。若會員為未滿二十歲之未成年人，應於會員的法定代理人（或監護人）閱讀、瞭解並同意本會員條款之所有內容及其後修改變更後，方得註冊為會員、使用或繼續使用本服務。當會員使用或繼續使用本網站時，即推定會員的法定代理人（或監護人）已閱讀、瞭解並同意接受本約定書之所有內容及其後修改變更。

                遵守會員規範及法律規定
                當您註冊成為會員後，可使用本網站提供的服務。當會員使用本網站服務時，視為會員同意接受本會員條款及所有注意事項之拘束，並同意遵守中華民國相關法規及一切國際網際網路規定與慣例。

                會員資料之修改與刪除
                基於本網站所提供之各項服務，您同意於註冊時提供正確詳實之個人資料，您所登錄之資料嗣後有變更時，應隨時於線上更新之，或回覆郵件(CRDA@mail.hotaimotor.com.tw)，表明您有意修改或刪除個人資料的要求，TOYOTA即會按您的要求作出變更。您提供之個人資料若有填寫不實、或原登錄之資料已不符而未更新、或以任何虛假或冒用他人名義登錄，或您所提供之個人資料有其他違反或破壞TOYOTA服務宗旨之情事，您除應自負法律責任。TOYOTA保留隨時終止您的會員資格及使用各項服務資格之權利。

                隱私權保護
                TOYOTA承諾保護您的個人隱私權。本「隱私權聲明」簡述TOYOTA在此網站所收集到的資料種類，以及如何使用與保護上述資料的方法。同時說明當您蒞臨本網站但不希望提供個人基本資料時應如何處理，以及如何變更已提供給本網站的個人基本資料。

                例如，您的資料不會用於我們向其他廠商網站所購買或參與的橫標廣告、抽獎及其他廣告或促銷活動中，除非經過您的同意。

                您對此隱私權聲明之認同
                您使用本網站，就表示同意本網站所公佈之現行隱私聲明。如果您不同意本聲明內容，請勿在本網站上提供您的資料。如果您選擇不在本網站上提供個人基本資料或提供之個人基本資料不正確，您將無法使用部分內容，例如進入本網站特定區域、參加抽獎或比賽活動 、索取樣品、或收到我們寄給您的電子郵件，然而本網站所連結的其他網站並不在本隱私權保護之範圍內。

                個人基本資料的蒐集與使用
                TOYOTA依個人資料保護法規定蒐集、處理及利用您的個人資料。TOYOTA將以簡訊、網路、電話、e-mail等您留存之聯絡方式，使您知悉廣告、贈品或相關資訊及優惠，或對您進行問卷調查。個人資料蒐集目的、類別及資料利用之期間、地區、對象及方式如下:

                蒐集目的:
                行銷、維修、保固、提供客戶服務、消費者保護、契約、類似契約或其他法律關係事務、執行其他經營合於營業登記項目或組織章程所定之業務、調查、統計與研究分析、個人資料之合法交易業務。
                資料類別:
                個人資料包含但不限於姓名、身分證號碼、生日、電話(住宅)(公司)、行動電話、e-mail、戶籍地址及聯絡地址、TOYOTA現存您之所有資料、交易及維修資訊、行動及網路媒體資訊等。
                利用之期間、地區、對象及方式:
                a. 期間: 截至您主動請求相對人刪除、停止處理或利用該個人資料之日，或TOYOTA執行業務所必需之保存期間止。
                b. 地區: TOYOTA國內及國外所在地。
                c. 對象: 和泰汽車股份有限公司及其關係企業、台灣地區授權經銷商及有合作關係第三人(註)。您知悉並同意對象範圍及於未來於和泰汽車及附註所述公司官方網站所增加之公司(https://pressroom.hotaimotor.com.tw/)。
                d. 方式: 符合個人資料保護相關法令以自動化機器或其他非自動化之利用方式。
                您得依個人資料保護法得隨時請求TOYOTA查閱、給予複本或補正您之個人資料，亦得隨時電洽TOYOTA之客服專線或逕向台灣地區授權經銷商各營業單位以書面表示拒絕TOYOTA繼續蒐集、處理、利用，或刪除您個人資料；您同意由TOYOTA依本同意書之約定持續蒐集、處理、利用您提供之個人資料，截至您主動請求相對人刪除、停止處理或利用該個人資料之日或TOYOTA執行業務所必需之保存期間止，相對人始終止其個人資料蒐集、處理及利用。

                其他我們可能會收集的資料
                當您造訪本網站時，本網站會使用cookies及其他類似追蹤技術自動蒐集資料，包括您的 IP 位址、裝置 ID、瀏覽行為資訊、瀏覽器名稱、電腦作業系統等資料，而您的個人資料只有在您主動提供才會被儲存。

                cookies及其他類似追蹤技術是一個保存在您的電腦或行動設備瀏覽器內的小型文字檔，TOYOTA將會在您蒞臨本網站時使用cookies及其他類似追蹤技術，藉此達到如下目的：驗證使用者、記住使用者偏好和設定、確定內容的受歡迎度、分析網站流量和趨勢，並大致瞭解網站使用者的線上行為和興趣，例如：您參觀的特定網站區域，以及您透過我們網站所購買的產品或服務。cookies也會用於幫助提升您在本網站的瀏覽速度。我們同時也與第三方網站進行合作，當您蒞臨與TOYOTA合作之第三方網站時，我們也會使用cookies及其他類似技術記錄識別資訊和社會情況類別資訊。例如，興趣、生活樣貌標籤、消費模式等。和泰汽車收集這些資訊是為使和泰汽車的網站及產品更合乎使用者的興趣與需求，並據以改善本網站提供的服務品質。

                大部分的瀏覽器最初設定接設定為可接受cookies，您也可以將您的電腦設定為拒絕cookies或在接到cookies時發出警告。當您蒞臨網站且拒絕接受cookies時，您可能會無法瀏覽部分網站內容，或無法接收個人化的資訊。

                此外，我們將不斷改良推廣本網站的作法。為了幫助我們達到此目標，我們可能會判斷您是由哪個地方點選進入本網站，藉此分析我們網站在網路上曝光程度的高低。

                有關您電腦的資訊，例如，IP位置(您電腦連上網際網路時所分配使用的號碼)、您所使用瀏覽器相關資訊、作業系統相關資訊等，也可能會被收集並與您主動提供的個人基本資料相連結。這是為了確保我們網站能提供訪客最佳的瀏覽經驗，而這些資料是最有效的資料來源。

                最後，我們會在您提供的資料中，增補由第三者所提供的資料。我們如此做是為了提供更符合您需求的產品與服務。

                資料安全
                我們採取標準預防措施以確保您個人基本資料的安全。所有個人身分資料都是限制存取的，以避免未經授權者存取、修改或濫用。

                會員條款之修改
                TOYOTA保留隨時修改本會員條款之權利，修改後之會員條款將於本網站相關網頁公告，並自公告之日起即時生效，不另作通知。若您於本網站公告修改或變更會員條款後繼續使用本網站 (https://www.toyota.com.tw/) 所提供之服務，將視為您已閱讀同意接受該等修改或變更。如果您不同意本會員條款的內容，您應立即通知TOYOTA並停止使用本網站服務。

                服務中止與修改
                TOYOTA保留隨時中止或更改本網站各項服務內容，或終止任一會員帳戶服務之權利。無論任何情形，就中止或更改服務或終止會員帳戶服務之決定，TOYOTA對會員或第三人均不負任何賠償或補償責任。您應瞭解並同意，TOYOTA可能因公司、其他協力廠商或相關電信業者網路系統、軟硬體設備之故障或失靈或人為操作上之疏失而全部或部份中斷、暫時無法使用、遲延、或造成資料傳輸或儲存上之錯誤、或遭第三人惡意侵入系統篡改或偽造變造資料等，TOYOTA不負任何賠償責任。

                您瞭解TOYOTA提供網站上的服務與資訊供會員使用，但不對任何服務或資訊傳送的遲延、儲存的故障以及任何資訊的刪除負任何責任。

                保管及通知義務
                您有義務妥善保管在本網站註冊之帳號與密碼，並於每次使用完TOYOTA所提供之服務後確實登出，以防他人盜用。您應為以此組帳號與密碼登入本網站後所進行之一切行為負責。為維護您自身權益，請勿將帳號與密碼洩露或提供予第三人知悉，或出借或轉讓他人使用；以同一個會員帳號和密碼使用本服務所進行的所有行為，都將被視為是該會員本人的行為。若因您保管疏失，而導致帳號、密碼遭他人非法使用時，TOYOTA將不負責賠償責任。若您發現帳號或密碼遭人非法使用或有任何異常破壞使用安全之情形時，應立即通知TOYOTA，若因未及時通知致無法有效防止或修護時，您應自負全責。

                風險承擔
                您同意使用本網站各項服務係基於您的個人意願，並同意自負任何風險，包括因為自本網站下載資料或圖片，或自TOYOTA所提供之服務中獲得之資料導致您的電腦系統損壞，或是發生任何資料流失等結果。


                法律保護條款

                商品及服務資訊
                本網站提供有關於TOYOTA總代理和泰汽車股份有限公司所代理的產品、服務及促銷等相關資訊，該等資訊皆僅適用於中華民國(台、澎、金、馬)地區，本網站所有價格資訊均為建議零售價格，實際成交價格請洽TOYOTA全省之授權經銷商；包含TOYOTA商品的配備，均應以TOYOTA經銷商實際展售車輛之實車配備為準)。

                智慧財產權
                本網站所有內容，包括但不限於商標、文字、肖像、圖表、音樂、動畫文件、錄影及所有經TOYOTA所策劃、製作置於網站內容之智慧財產權，均為TOYOTA或其權利人所有，除事先經TOYOTA或其權利人之書面授權同意外，您不得無權複製、散佈、上傳、公告、轉讓，或用任何方式傳輸、改變本網站的任何內容，亦無權解編、還原、拆解本網站或軟體或以其他任何形式、基於任何目的為不合法使用，否則應自負所有法律之責任，本公司有權採取一切法律途徑維護本公司的權利。

                免責事項
                TOYOTA將盡全力來維護本網站資訊的正確性及完整性，然而本網站將努力提供準確性和及時的訊息與內容，但這些訊息與內容僅限於現有狀況，對其準確性和及時性，本網站不給予任何直接或間接的保證(包含。經由本網站所連結的其他網站並非TOYOTA可以控制，基此，我們無法對於任何連結網站的內容負責。TOYOTA提供這些連結只為了讓您使用上方便，TOYOTA不擔保其真實性、完整性、即時性或可信度，該等個人、公司或組織亦不因此而當然與TOYOTA有任何僱傭、委任、代理、合夥或其他類似之關係。

                您了解本網站上刊登有商業廣告及各種商品之促銷資訊。該等內容均係由廣告商或商品服務提供人所為，TOYOTA僅係提供刊登內容之媒介。對於透過本網站銷售之商品，TOYOTA對其交易過程及商品本身，均不負任何擔保責任。您了解您透過本網站所購得之商品或服務之品質、保固及售後服務，完全由商品或服務提供人負全責，若有任何瑕疵或擔保責任，均與TOYOTA無關。

                賠償責任限制
                TOYOTA對於您使用本網站服務、或無法使用本網站服務所致生之任何直接、間接、衍生、或特別損害、損失或費用，不負任何賠償責任。若您使用之本網站服務係有相對現金價格者，TOYOTA僅於您所給付之相對現金價格範圍內，負賠償責任。

                上述賠償責任限制，若依法為不得限制者，則限制規定將不予適用。

                變更聲明
                TOYOTA保留得於法令規定範圍內逕自變更或撤銷本法律保護條款之權利，並建議您經常瀏覽本條款以掌握最新資訊。

                如果對本法律保護條款您有任何疑問、建議或顧慮，歡迎來信crda@mail.hotaimotor.com.tw。

                禁止從事違反法律規定之行為
                TOYOTA就您的行為是否符合本會員條款約定，有最終決定權。若TOYOTA認定您的行為違反本會員條款或任何法令，您同意TOYOTA得隨時停止帳號使用權或清除帳號，及停止使用本網站服務。您若有違反法律規定之情事，應自負法律責任。

                損害賠償
                因您違反相關法令或違背本會員條款之任一條款，致TOYOTA或其關係企業、受僱人、受託人、代理人及其他相關履行輔助人因此而受有損害或支出費用（包括但不限於因進行民事、刑事及行政程序所支出之律師費用等）時，您應負擔損害賠償責任或補償其費用。

                個別條款之效力
                本會員條款之全部或部分無效時，不影響其他條款之效力。

                通知
                您依本會員條款之約定而有通知TOYOTA之必要時，請以電子郵件方式寄送TOYOTA（與TOYOTA連繫之電子郵件為: CRDA@hotaimotor.com.tw）或電洽TOYOTA (與TOYOTA之連繫電話為: 0800-221-345) ，在TOYOTA未收到您的通知前，尚未發生通知之效力，故原約定不會因此而變更或受到任何影響。

                準據法及管轄法院
                本會員條款之解釋及適用、以及您因使用本網站服務而與TOYOTA間所生之權利義務關係，應依中華民國法令解釋適用之。若有涉訟或爭議，均同意以台北地方法院為第一審管轄法院。

                """
        }
    }
}