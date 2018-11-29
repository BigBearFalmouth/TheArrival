//Global vars to control whole story
VAR letterSent=false
VAR checkIn=false
VAR gotFed=false
VAR metSister=false

VAR hasMetPoliceDiaryEntry=false
VAR hasMetSisterDiaryEntry=false

VAR unlockPostOffice=false
VAR unlockGrandCentralHotel=false
VAR unlockBuchananRailwayStation=false
VAR unlockButcher=false
VAR unlockBank=false
VAR money=0

//Inventory
VAR hasReichsmarks=true
VAR hasPassport=true
VAR hasEnglishLetter=true
VAR hasNote=true

LIST STORY_STATES=QUEEN_ST,BANK,POST_OFFICE, BUCHANNAN_ST_STATION,GRAND_CENTRAL_HOTEL,BUTCHERS,UNDERGROUND,END,MAP

VAR currentStoryState=QUEEN_ST

{~I arrived in Queen St Station after what seemed like an endless journey!. Upon leaving the station building, I tried to take in my surroundings. My first impressions were that this looked like what I'd heard an American city would look like. For as far as I could see, the streets were in grids with columns in the architecture... Although that wasn't very far, the smog here is almost unbearable!... I think I might miss the country life. The first thing I was wanting to do was meet up with Halina. Although I had to deliver a letter for my Uncle and find some food too... It would also be nice to get a letter sent back home.|The journey was so tiring! I lost count of the exact time it has taken me to get here, but I know it's the longest journey I've ever made in my life. On first impressions Glasgow seems very grand and important. The architecture is fantastic! Although, not that I can see most of it for the smog that seems to have enveloped the city. It's been a fantastic experience getting to a new land, a new start. I'm determined to make the most of my new opportunities in this country.|It was 9am when I arrived. I had been travelling over night from London on the train. By the time I got to Glasgow I was tired and hungry, although when the excitement of exploring my new surroundings kicked in, the tiredness soon faded. I couldn't wait to see Halina again. I was betting she had grown up so much in the 13 years since we were back living with Mum and Dad, but she was now a woman! I feel like I've missed out on a major part of her life growing up}->queenSt

=== menu ===
~currentStoryState=MAP
*{unlockBank and hasReichsmarks}[Visit Bank]->bank
+{unlockPostOffice and hasEnglishLetter}[Visit Post Office]->postOffice
+{unlockBuchananRailwayStation and not metSister}[Visit Buchannan St Station]->buchannanStStation
+{unlockButcher and not gotFed}[Visit Butchers]->butchers
+{unlockGrandCentralHotel and not checkIn}[Visit Grand Central Hotel]->grandCentral
*{not hasMetPoliceDiaryEntry}[Visit Underground]->underground
*[Visit Queen St. Station]->queenSt
+{letterSent and checkIn and gotFed and metSister}[End]->ending


=== bank ===
=start
~currentStoryState=BANK
{I then spotted a nearby bank, it was a great opportunity to swap my money for local currency. I can't imagine the locals would appreciate my German money. It turned out my money was worth next to nothing! I couldn't believe my ears ... But I guess it makes sense, the war is over and there is a lot of rebuilding to do, especially in Germany... All of Europe is literally a warzone. I guess I'm lucky to be somewhere that's more untouched like Glasgow.|There was a sign post near by with a pound sign on it. I figured that'd be a good place to go and exchange my money for the local currency. The woman at the bank was in a really foul mood, she didn't seem to want to communicate with me at all. I conveyed that I had some money to exchange and she obliged. It turns out my Marks weren't worth very much... I had expected their value to deteriorate, I didn't realise by how much!!|There was a bank right next to the train station, the large grand building immediately recognisable by the currency sign on the front. The woman was off with me, she must've had to deal with a lot of people coming in with the wrong money, because she knew exactly what I wanted when I showed her my Deutch Mark's. After the decline in value of my savings... I had enough for lunch. At least the day would get better}->choices

=choices
*[Introduce yourself]->bank.intro
*[Exchange your money]->bank.exchange
*[Show English letter]->bank.letter
*[Lost!]->bank.lost
+[Leave]->menu

=intro
You introduce yourself. The woman doesn't bat an eyelid. She doesn't seem to be interested in what you have to say.
->bank.choices

=exchange
You hand over your Reichsmarks. The woman counts over them and gives you a single coin in return. A single coin?! That was everything I had!
~money=money+1
~hasReichsmarks=false
->bank.choices

=letter
The woman looked at the letter, shakes her head, and hands you the note back
->bank.choices

=lost
Where ye' lookin fur?
->bank.choices


=== postOffice ===
=start
~currentStoryState=POST_OFFICE
{The post office was very busy! I could barely move. I did notice during my time here that everyone seemed to be dressed the same? It seemed some sort of standard set of clothes that must have been given out to the people here. I must be sticking out without even opening my mouth! Oh, I almost forgot! The woman behind the counter was putting milk in his tea. MILK!?|There was a queue all the way out the door of the post office. A queue of people dressed very similarly. At first I had thought that this must be some sort of uniform, but upon closer inspection it was clear that these were just ordinary people. The war had left a lot of people without any belongings, I imagine these people had all been given help and given the exact same mass produced clothes. I paid for the postage and sent the family back home a note to let them know I was safe.|The post office was a little out of the way compared to the other places I had been in the city, although still in the city centre. The place was packed full of people! I spent a long time waiting in line and when I approached the counter I noticed that the person attending to me was pouring milk in his tea!? She noticed my reaction to this and seemed to have a giggle to herself. Is that normal here? It's definitely a foreign concept to me... although this is a foreign land. I sent a letter back home, and Halina insisted she write a little message on it to, I happily obliged.}->choices

=choices
*[Look at the hordes of people]->postOffice.people
+{not letterSent}[Post letter]->postOffice.letter
*[Glance at woman behind counter]->postOffice.counter
*[Lost!?]->postOffice.lost
+[Leave]->menu

=people 
Everyone looks the same here. There must be a standard set of clothes that are given out.
->postOffice.choices

=letter
{money>0:
The woman takes the letter and a coin. 'I hope it arrives ok', you say out loud. A few people turn and look at where the foreign accent has came from.
~letterSent=true
~hasEnglishLetter=false
-else:
    The women holds her hand out as if asking for money, you will need to change your Reichsmarks into the local currency
    ~unlockBank=true
}
->postOffice.choices

=counter 
The woman behind the counter has a warm cup of tea. She reaches for the ... MILK?! She poured MILK into his tea!?...
->postOffice.choices

=lost
Where ye' lookin fur?
->postOffice.choices


=== buchannanStStation ===
=start
~currentStoryState=BUCHANNAN_ST_STATION
~metSister=true
~hasMetSisterDiaryEntry=true
{I found my way to Buchanan Street Railway eventually. Just my luck that there are two train stations on that same street here huh? Couldn't they make things a little easier? Gah, anyway, seeing Halina again was great. I hadn't seen her since before the war you see. She had been evacuated as part of the KinderTransport system of getting kids out of Poland and away from the Nazi's. I was so relieved she was OK, we must have hugged for a long time, maybe people were staring? I didn't care. She gave me some money to post a letter back home and pointed out where the post office was. I also asked if she had heard anything about our parents back home, she seemed be hurt by the question and refused to answer... I hope they are OK|So I found out in my first day here, there happens to be two railway stations named almost identially. What's the chances of that right? The policeman I met had pointed me in the correct direction to get to the right one and see my sister again. I had been looking forward to seeing her for so long. She moved to Glasgow as one of the KinderTransport kids thirteen years ago. She was a woman now! We hugged for a long time before letting each other go. She helped me out by giving me some money and pointed me towards to post office to send a letter back home and let everyone know we're safe.|My Halina was waiting for me at the station when I arrived. I don't know long she had been waiting, but I was sure I was at least a couple of hours late. A big new city was quite a scary place to navigate after all. I think she understood though. We greeted each other like we had never parted. Although it was clear time had passed. She was almost the same height as me now! She'll always be my kid sister though. She was kind enough to give me some money, although she insisted I used it to send a letter home.}->choices
=choices
*[Ask about mum and dad]->askMumAndDad
*[Ask for money to send the letter home]->askForMoney
*[Ask where to send the letter]->askLetter
+[Leave]->menu

=askMumAndDad
Halina goes silent and looks at the floor... She clearly doesn't want to talk about it. I hope they're ok
->buchannanStStation.choices

=askForMoney
Halina opens her purse, she doesn't seem to have many coins but she gives you one and tells you that's enough to send the letter. Now to get to the post office.
~money=money+1
->buchannanStStation.choices

=askLetter
Helina tells you where the post office is. It's quite close actually. Just along the road to the west
~unlockPostOffice=true
->buchannanStStation.choices


=== butchers ===
=start
~currentStoryState=BUTCHERS
{So the markets here were mostly butchers. There was a lot of meat and I couldn't see much fruit or veg anywhere. The diets here seem to be vastly different to back home. I knew none of the meats where going to be kosher, and I didn't wanna eat anything that had been cut up next to the pigs. I offered to buy the butcher's lunch off of him, as it was stored in a see through plastic container. It wasn't much but he agreed, maybe he knew I couldn't eat the meat here? He seemed a nice man... He pointed to himself and said 'Dave'. That must've been his name.|My uncles friend at the hotel couldn't have been Jewish. He pointed me to a market where every stall was butchers. None of the meat was Kosher, although I couldn't exactly ask this myself, it was an educated guess. I ended up bartering for the butcher's lunch which was a sandwich and jam.|The smell of the market guided me to it. It smelt very apetizing and my stomach was grumbling in anticipation. Although I was disappointed when I arrived there, as the food was all meat and I couldn't ask if it was kosher. The butcher- who managed to convey his name was Dave - was kind enough to offer me his vegetarian lunch instead, he must also be quite used to Jewish people trying to find some food here.}->choices
=choices
*[Point to animal on wall]->pointToAnimal
*[Point to the counter]->pointToCounter
+{not gotFed}[Point to the lunch box]->pointToLunchBox
*[Lost!]->lost
+[Leave]->menu

=pointToAnimal
The butcher makes an oink noise. Definitely not what I'm looking for.
->butchers.choices

=pointToCounter
The meat on the counter appears to be beef. At least that's what the moo the butcher made suggests. Not for me!
->butchers.choices

=pointToLunchBox
You point to the lunch box on the side of the container. The butcher takes out some bread and what appears to be jam.The butcher holds his hand out waiting for a coin.
{money==0:
You wave an apology, you will need to find some money. Perhaps you can change your Reichsmarks at a bank or ask you Sister for money.
~unlockBank=true
-else:
~money--
~gotFed=true
You give the butcher a coin and then eat the sandwhich. What a strange combination? Oh well it's better than nothing!
}
->butchers.choices

=lost
Where ye' lookin fur?
->butchers.choices


=== grandCentral ===
=start
~currentStoryState=GRAND_CENTRAL_HOTEL
~checkIn=true
{I managed to find the hotel where I was to give my uncle's letter to his friend. Apparently it must have said something good, becuase the very nice man pointed me towards where to buy food (after some terrible gestures by me to convey my hunger). He also told me to come back there later on. I had found a nice place to sleep tonight! Tomorrow I can go and see where Halina has been staying and try finding some job to do. Surely I don't need to speak English for all work here? Perhaps something without any interaction with the public. I see posters everywhere. Maybe putting some posters up?|My uncles friend at the hotel was very helpful. Although he couldn't speak English, he made sure I understood I was welcome to come and sleep here tonight and he also pointed me in the direction of a food market. I don't know what I wouldn't done if I didn't find him with that letter. Halina was staying too far away and we had missed the only train heading back there today.|The hotel that my uncles friend worked at was HUGE! It was attached to central station, that made the fourth train station within a 10 minute walk from each other that I had came across today. Although my sister has since said that the one where I met her at is for local trains, such as the train home for her, and the one I arrived at is for long distance trains. I guess that makes sense. Anyway... my uncles friend at the hotel didn't speak Polish either, I better get learning English quickly if I want to make the most of my chances over here. Halina keeps using Scottish words in with her Polish with me, I guess she hasn't spoken Polish in a little while now. After much back and forward I understood that he would let me stay in the hotel tonight for free and he was also kind enough to point me in the direction of a butcher}->choices

=choices
*[Give English letter]->grandCentral.letter
*[Convey hunger]->grandCentral.hunger
+[Leave]->menu

=letter
You say your name to the doorman. You are sure that this is the place you were to give the letter to. You dig through your bag for the letter written in English. You hand the man the note and he takes a moment to read it
->grandCentral.choices

=hunger
You point to your throat. The man looks at you blankly. You rub your belly and make a groaning sound. His face lights up. He points over to the east, and nods. I bet I'll find some food place there!
~unlockButcher=true
->grandCentral.choices

=== underground ===
= start
~currentStoryState=UNDERGROUND
This station doesn't seem to be the right one ...There are a lot of police around, and lots of people seem to be heading to the underground with blue sports shirts on. There's to be thousands of them! There's also a few guys with green and white shirts on shouwing what seems to be very unpleasant things towards the blue guys. The policeman notices your bewildered look. He approaches you and speaks very quickly in a harsh tone. You can't understand him but he clearly wants an answer!
~unlockGrandCentralHotel=true 
~unlockBuchananRailwayStation=true
->choices

=choices
*[...yes?]->underground.yes
*[...no?]->underground.no
*[Show him your letter]->underground.letter
*[Lost!]->underground.lost
+[Leave]->menu

= yes
The policeman rambles on more. His voice gets loud and louder and people are turning to see what the fuss is about.
->underground.choices

= no
He seems to have lost patience. If you don't try and communicate in some other way, he won't be able to help
->underground.choices

= letter
Ahhhh, he mumbles some more, pointing towards the top of the road saying 's-t-a-t-i-o-n very slowly. I think this is where I've to meet Halina! He also points in the other direction and says something you don't understand, maybe this is where the hotel is?
~hasMetPoliceDiaryEntry=true
->menu

= lost
Where ye' lookin fur?
->underground.choices

=== queenSt ===
=start
~currentStoryState=QUEEN_ST
You arrive at queen st station. Stepping outside you are greeted with George Square. There are grand statues and people everywhere. The first thing you notice is the smog that stops your vision short of a few blocks. You take a moment to compose yourself in this alien city. You seem hungry. Must make a note to find some place to buy food.->choices

=choices
*[Check Bag]->queenSt.check_bag
*[Look Around]->queenSt.look_around
*[Ask Directions]->queenSt.ask_directions
*[Lost!]->queenSt.lost
+[See the City]->menu

= check_bag
You have your passport, a note from your sister, a note written in English from your friend. You also have your entire life savings in Reichsmarks
->queenSt.choices

=look_around
You look again at the city around you. The architecture seems really beautiful. It's a shame it's all stained black with the coal and smog.
->queenSt.choices

=ask_directions
You ask a passing man for directions in Polish. He gives you an angry scowl and storms off, not saying a word. 'These people won't understand me at all' you think to yourself.
->queenSt.choices

=lost
here ye' lookin fur?
->queenSt.choices

=== ending ===
~currentStoryState=END
And that was my day today! As I've said, tomorrow, my new life really begins. I hope to find some work and a place to stay more permanently.
->END
