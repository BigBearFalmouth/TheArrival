//Global vars to control whole story
VAR letterSent=false
VAR checkIn=false
VAR gotFed=false
VAR metSister=false

VAR hasMetPoliceDiaryEntry=false
VAR hasMetSisterDiaryEntry=false

{~I arrived in Queen St Station after what seemed like an endless journey!. Upon leaving the station building, I tried to take in my surroundings. My first impressions were that this looked like what I'd heard an American city would look like. For as far as I could see, the streets were in grids with columns in the architecture... Although that wasn't very far, the smog here is almost unbearable!... I think I might miss the country life. The first thing I was wanting to do was meet up with Halina. Although I had to deliver a letter for my Uncle and find some food too... It would also be nice to get a letter sent back home.|The journey was so tiring! I lost count of the exact time it has taken me to get here, but I know it's the longest journey I've ever made in my life. On first impressions Glasgow seems very grand and important. The architecture is fantastic! Although, not that I can see most of it for the smog that seems to have enveloped the city. It's been a fantastic experience getting to a new land, a new start. I'm determined to make the most of my new opportunities in this country.|It was 9am when I arrived. I had been travelling over night from London on the train. By the time I got to Glasgow I was tired and hungry, although when the excitement of exploring my new surroundings kicked in, the tiredness soon faded. I couldn't wait to see Halina again. I was betting she had grown up so much in the 13 years since we were back living with Mum and Dad, but she was now a woman! I feel like I've missed out on a major part of her life growing up}->menu

=== menu ===
+[Visit Bank]->bank
+[Visit Post Office]->postOffice
+[Visit Buchannan St Station]->buchannanStStation
+[Visit Butchers]->butchers
+[Visit Grand Central Hotel]->grandCentral
*[Visit Underground]->underground
+[Visit Queen St. Station]->queenSt
+[End]->ending

/*
    answersArray = [[NSArray alloc]initWithObjects:@"Introduce yourself",@"Exchange your money",@"Show English letter",@"Lost!", nil];
    responsesArray = [[NSArray alloc]initWithObjects:@"You introduce yourself. The woman doesn't bat an eyelid. She doesn't seem to be interested in what you have to say.",@"You hand over your Deutch Mark's. The woman counts over them and gives you a single coin in return. A single coin?! That was everything I had!",@"The woman looked at the letter, shakes her head, and hands you the note back.",@"Where ye' lookin fur?",nil];
*/
=== bank ===
This is the bank
*[Back]->menu

/*
   answersArray = [[NSArray alloc]initWithObjects:@"Look at the hordes of people.",@"Post letter",@"Glance at man behind counter",@"Lost!", nil];
    responsesArray = [[NSArray alloc]initWithObjects:@"Everyone looks the same here. There must be a standard set of clothes that are given out.",@"The woman takes the letter and a coin. 'I hope it arrives ok, you say out loud. A few people turn and look at where the foreign accent has came from.",@"The woman behind the counter has a warm cup of tea. She reaches for the ... MILK?! She poured MILK into his tea!?...",@"Where ye' lookin fur?",nil];
*/
=== postOffice ===
This is the post office
*[Back]->menu

/*
   answersArray = [[NSArray alloc]initWithObjects:@"Ask about mum and dad",@"Ask for money to send the letter home",@"Ask where to send the letter",@"Lost!", nil];
    responsesArray = [[NSArray alloc]initWithObjects:@"Halina goes silent and looks at the floor... She clearly doesn't want to talk about it. I hope they're ok.",@"Halina opens her purse, she doesn't seem to have many coins but she gives you one and tells you that's enough to send the letter. Now to get to the post office.",@"Helina tells you where the post office is. It's quite close actually. Just along the road to the west.",@"Where ye' lookin fur?",nil];
*/
=== buchannanStStation ===
This Buchannan St Station
*[Back]->menu

/*
   answersArray = [[NSArray alloc]initWithObjects:@"Point to animal on wall",@"Point to the counter",@"Point to the lunch box",@"D", nil];
    responsesArray = [[NSArray alloc]initWithObjects:@"The butcher makes an oink noise. Definitely not what I'm looking for.",@"The meat on the counter appears to be beef. At least that's what the moo the butcher made suggests. Not for me",@"You point to the lunch box on the side of the container. The butcher takes out some bread and what appears to be jam. What a strange combination? Oh well it's better than nothing!",@"Where ye' lookin fur?",nil];
*/
=== butchers ===
This is the butchers
*[Back]->menu

/*
 //Grand Central Hotel

Questions = @"Give English letter",@"Convey hunger",@"4", nil];
Answers - "You say your name to the doorman. You are sure that this is the place you were to give the letter to.",@"You dig through your bag for the letter written in English. You hand the man the note and he takes a moment to read it.",@"You point to your throat. The man looks at you blankly. You rub your belly and make a groaning sound. His face lights up. He points over to the east, and nods. I bet I'll find some food place there!",@"Where ye' lookin fur?",nil];
*/
=== grandCentral ===
This is Grand Central hotel
*[Back]->menu

=== underground ===
= start
This station doesn't seem to be the right one ...There are a lot of police around, and lots of people seem to be heading to the underground with blue sports shirts on. There's to be thousands of them! There's also a few guys with green and white shirts on shouwing what seems to be very unpleasant things towards the blue guys. The policeman notices your bewildered look. He approaches you and speaks very quickly in a harsh tone. You can't understand him but he clearly wants an answer!
*[...yes?]->underground.yes
*[...no?]->underground.no
*[Show him your letter]->underground.letter
*[Lost!]->underground.lost

= yes
The policeman rambles on more. His voice gets loud and louder and people are turning to see what the fuss is about.
->underground

= no
He seems to have lost patience. If you don't try and communicate in some other way, he won't be able to help
->underground

= letter
Ahhhh, he mumbles some more, pointing towards the top of the road saying 's-t-a-t-i-o-n very slowly. I think this is where I've to meet Halina! He also points in the other direction and says something you don't understand, maybe this is where the hotel is?
~hasMetPoliceDiaryEntry=true
->menu

= lost
Where ye' lookin fur?
->underground

=== queenSt ===
=start
You arrive at queen st station. Stepping outside you are greeted with George Square. There are grand statues and people everywhere. The first thing you notice is the smog that stops your vision short of a few blocks. You take a moment to compose yourself in this alien city. You seem hungry. Must make a note to find some place to buy food.
*[Check Bag]->check_bag
*[Look Around]->look_around
*[Ask Directions]->ask_directions
*[Lost!]->lost
+[back]->menu

= check_bag
You have your passport, a note from your sister, a note written in English from your friend. You also have your entire life savings in Reichsmark
->queenSt

=look_around
You look again at the city around you. The architecture seems really beautiful. It's a shame it's all stained black with the coal and smog.
->queenSt
#===inventory===

=ask_directions
You ask a passing man for directions in Polish. He gives you an angry scowl and storms off, not saying a word. 'These people won't understand me at all' you think to yourself.
->queenSt

=lost
here ye' lookin fur?
->queenSt

=== ending ===
This is the end
->END
