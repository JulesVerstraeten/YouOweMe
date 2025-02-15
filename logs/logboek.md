# You Owe Me - Logboek
:author: Jules Verstraeten
:toc: auto
:imagesdir: images

link:home.adoc[Home]

## TODO's

### Versie Beta 1.0
Ik wil het meest simpelste versie van het programma, het enigste wat men moet kunnen doen is een contact toevoegen, een lening bij dat contact persoon open zetten, en een lening afbetaald zetten, als lening is afbetaald gaat de lening naar de historie

    * [*] Modellen maken
    * [] Functie's van modellen maken
    * [] Repositorie maken
    * [] UI maken

## Week 6
### 05/02
Circa 2.5 uur

[.lead]
REST, database,..  welke?

    Ik heb vooral gezocht naar wat ik zou kunnen gebruiken voor mijn programma, welke rest api en database. Ik wou eerst voor C# ASP.NET gaan omdat ik dit zou moeten leren voor mijn opleiding en het zou goed staan voor mijn portofolio. Maar achteraf ben ik gaan twijfelen tussen ASP.NET of Django. Hier ga ik later op terug komen. Database zou PostgreSQL zijn op Supabase, dit is ook nog niet 100% zeker.

[.lead]
Logs bestand bijgehouden

    Ik heb heel veel aan het logbestand toegevoegd onderandere de classmodel en het design principes

=== 06/02
Circa 4-5 uur

[.lead]
UI, modellen en repositorie

    Ik heb vandaag heel veel aan de UI van de homepagina gewerkt, ik heb daarvoor vele testen gemaakt met modellen, lokale repositorie, lokale service en lokale viewmodels, alles werkt na verwacht. Alle modellen zijn tot nu toe goed qua design. Ik moet alleen nog wel de voorwaardes instellen van de modellen.

[.lead]
Veranderd (~)/toegevoegd (+)/verwijderd (-)

modellen:

* + User
* + Contact
* + Transaction
* + Payment

UI-views:

* ~ HomePage
* + TransactionPage
* + TransactionsPage
* + ContactPage
* + ContactsPage
* + AddTransactionPage
* + AddContactPage
* + EditTransactionPage

Verder:

* + Lokale repositorie
* + Lokale service
* + Lokale viewmodel
* + Invoices widget

=== 07/02
Circa 2.5 uur

[.lead]
State Management

    Ik ben nu achter gekomen dat State Management de beste optie is om data door te geven aan pagina's. Dit ga ik aanpakken aan mijn applicatie. State Management houd in dat er geen data hoeven doorgegeven te worden aan pagina's maar dat dit centraal worden opgeslagen in de viewmodel.

    Het aanpassen naar State Management was wel echt een hele gedoe, maar het werkt nu.

[.lead]
Veranderd (~)/toegevoegd (+)/verwijderd (-)

* - Lokale service (is niet nodig ivm viewModel)
* ~ Lokale viewModel (het veranderen naar State Manager methode)
* ~ Lokale repositorie (het aanpassen van totalAmount output(int -> string))
* ~ User model (totalAmount output)
* ~ Contact model (totalAmount output)
* ~ HomePage (het veranderen naar State Manager methode)
* ~ ContactPage (voorbereiden voor de ui)
* ~ InvoicesItemView (het veranderen naar State Manager methode)
* ~ Main (kleine aanpassingen en darkmode)
* ~ Theme (darkmode toepassing)
* ~ BottomNavBarWithoutActionButton (darkmode toepassing)

=== 08/02
Circa 5 uur

[.lead]
UI

    Hier heb ik vandaag het meest gewerkt. Maar ik kwam nogsteeds wel heel veel vragen op, vele dingen snap ik nog niet echt hoe ik het best kan aanpakken en toepassen. Hiervoor ga ik binnenkort even goed onderzoeken.

[.lead]
Veranderd (~)/toegevoegd (+)/verwijderd (-)

* Modellen:
** ~ Contact (Alle transactie geven methode)
** ~ Transaction (GetAmountString, GetTitle en GetStatus methodes toegepast)
* Views:
** ~ ContactPage (Heel contactpage ui gemaakt, alleen nog functioneel maken)
* Widgets:
** + InvoiceItemviewContactWidget (de transacties module voor contactpage)
** + ToggleButton (Toggle button voor contactpage (moet nog wel universeel gemaakt worden en echt beter geschreven worden))
* Theme (geselecteerde text en opgeselecteerde text een vaste kleur gegeven)
* Lokale repositorie (Fetchuser aangepast)
* Main (ik heb daar de repo vastgezet)

=== 09/02
Circa 6 uur

[.lead]
UI
    
    Vandaag alleen aan de UI gewerkt, de contactpage is af, moet nog de listview items een klik functie geven. Sliding pages toegevoegd voor add_transaction en add_contact.

[.lead]
Veranderd (~)/toegevoegd (+)/verwijderd (-)

* Views:
** ~ Home Page (dropdown menu toegevoegd voor sorteren van listview (moet nog werken gemaakt worden))
** ~ Contact Page (UI is bijna helemaal en functioneel)
* Sliding Pages:
** + Sliding page voor Add Transaction en beetje gewerkt
** + Sliding page voor Add Contact
* Widgets:
** + Page View (PageView voor contact page (2 pagina's naast elkaar))
** + Text Fields (Text Field voor Slidepages)
** ~ Bottom Navbar Floating Actionbutton functioneel gemaakt
** ~ Invoices Itemview Contact (open en gesloten transacties opengesteld)
** ~ Invoices Itemview Home (beter gemaakt)
* ~ Contact model (getAllClosedTransactions voor de contactpage geimplementeerd)
* ~ Theme (textFieldFill standaard kleur gegeven (moet nog verbeterd worden) en een textHint kleur gegeven)
* + Navigation View Model (voor het navigeren van PageView)
* ~ Main (Extra provider toegevoegd(Navigation View Model))

== Week 7
=== 10/02
Circa 0.5 uur

[.lead]
Contact Page Debug

    Er was heletijd een foutmelding op de pagina contact-page.dart. Deze melding is gefixt, Het bleek dat ik een expanded had geplaatst bij een widget die dit pagina gebruikte. Deze heb ik weggehaald en zo is de foutmelding opgelost.

[.lead]
Veranderd (~)/toegevoegd (+)/verwijderd (-)

* Views:
** ~ Contact Page (foutmelding gedebugged)
* Widget:
** ~  Invoices Item View (foutmelding gedebugged)

=== 12/02
Circa 4 uur

[.lead]
Add Transaction Page

    Hier heeeeel veel bezig geweest, eerst problemen gehad met en openen van de sliding pages omdat de viewmodels niet werkte in de sliding pages, daarna chaos met dropdown menu, het is nogsteeds niet echt veel gelukt maar dit word volgende keer goed aangepakt!

[.lead]
Veranderd (~)/toegevoegd (+)/verwijderd (-)

// TODO Ga ik later doen

=== 13/02
Circa 5 uur

[.lead]
Rare probleem

    Er was heletijd iets raars, tijdens debuggen kreeg ik konstant meldingen van I/MESA, wel een stuk of 30 per seconden. Dit duurde ongeveer anderhalf uur om op te lossen. Het bleek dat ik bij .fetchData() NotifyListener had gebruikt. Dit zorgte voor dat het pagina voortdurend de data aan het laden was. Waardoor dus het programma blijft draaien.

[.lead]
UI Add Transaction

    De UI van Add Transaction Slide is 99% af. Alleen die DropDownMenu's moeten een klein beetje aangepast worden (als dit mogelijk is). De volgende keer dat ik bezig gaat zijn gaat waarschijnelijk de validators en het toevoegen van de Transaction afgewerkt zijn (hopelijk). 

[.lead]
Veranderd (~)/toegevoegd (+)/verwijderd (-)

* Views:
** Pages:
*** ~ Home Page: Het laden van alle data van de gebruiker
** Widgets:
*** ~ Floating Action Button: De onPressed goed toegewezen
*** ~ Toggle Button: Ergens anders gezet
*** Forms:
**** ~ Big Button: Een nieuwe button aangemaakt die makkelijk te designen is voor grote knoppen in forms
**** ~ Small Button: Dit had ik aangepast zodat ik een onderscheid kan maken tussen grote en kleine knoppen
**** ~ DropDown: Grote veranderingen zodat dit item herbruikbaar is
**** ~ TextField: Grote veranderingen zodat dit item herbruikbaar is
**** ~ Add Transaction Form: Dit is veranderd van een page naar een form
** Sliding Page: Kleine aanpassingen zodat het toegankelijker is
* View Models:
** Local View Model: Grote probleem gedebugged, NotifyListener weggehaald bij .fetchData()
* Core:
** Exceptions:
*** + Validation Exception: Toegevoegd en basis gezet
** Models:
*** ~ Transaction: Contact toegevoegd en een getContact method geimplementeerd
** Repositorie:
*** ~ Local Repository: getContact van Transaction method geimplementeerd
** Services:
*** + Validator Services: Toegevoegd en basis gezet
** Utils:
*** Theme: Witte text toegevoegd
*** String Utils: Basis gezet

=== 14/02
Circa 2 uur

[.lead]
2 uur: UI Add Transaction Page

    Ui van de transaction-page is zo goed als af. Hij is helemaal herbruik baar dus als ik aan contact-page ga beginnen is dat zo gebeurd. Ook als je gaat toevoegen werkt naar toebehoren.